
# Pure
# by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License


# Change this to your own username
DEFAULT_USERNAME='igel'

# Threshold (sec) for showing cmd exec time
CMD_MAX_EXEC_TIME=5


# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' enable git # You can add hg too if needed: `git hg`
zstyle ':vcs_info:git*' formats ' %b'
zstyle ':vcs_info:git*' actionformats ' %b|%a'

# enable prompt substitution
setopt PROMPT_SUBST

# Only show username if not default
[ $USER != $DEFAULT_USERNAME ] && local username='%n@%m '

# Fastest possible way to check if repo is dirty
git_dirty() {
  # check if we're in a git repo
  command git rev-parse --is-inside-work-tree &>/dev/null || return
  # check if it's dirty
  command git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo '*'
}

# Displays the exec time of the last command if set threshold was exceeded
cmd_exec_time() {
  local stop=`date +%s`
  local start=${cmd_timestamp:-$stop}
  let local elapsed=$stop-$start
  [ $elapsed -gt $CMD_MAX_EXEC_TIME ] && print_time ${elapsed}
}

print_time() {
  ((h=${1}/3600))
  ((m=(${1}%3600)/60))
  ((s=${1}%60))
  printf "%02d:%02d:%02d\n" $h $m $s
}

record_start_time() {
  cmd_timestamp=`date +%s`
}
add-zsh-hook preexec record_start_time

print_prompt() {
  vcs_info
  # Add `%*` to display the time
  print -P '%F{blue}%~%f$vcs_info_msg_0_`git_dirty` $username%f %F{yellow}`cmd_exec_time`%f %*'
  # Reset value since `preexec` isn't always triggered
  unset cmd_timestamp
}
add-zsh-hook precmd print_prompt

# Prompt turns red if the previous command didn't exit with 0
PROMPT='%(?.%F{green}.%F{red})❯%f '
# Can be disabled:
# PROMPT='%F{magenta}❯%f '
