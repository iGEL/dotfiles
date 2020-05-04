# Set up the prompt

autoload -Uz promptinit
autoload -Uz add-zsh-hook
# promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
# Don't store commands starting with a space in the HISTFILE
setopt HIST_IGNORE_SPACE

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
if whence dircolors >/dev/null; then
  eval "$(dircolors -b)"
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  alias ls='ls --color'
else
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
fi
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ":completion:*:commands" rehash 1

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

. $HOME/dev/files/prompt.zsh

alias lock='gnome-screensaver-command -l'
alias vol='amixer set Master'
alias suspend='dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Suspend && lock'

export BROWSER=/usr/bin/firefox

if [ -d /etc/update-motd.d ]; then
  # Show message of the day in new consoles
  for i in /etc/update-motd.d/*; do if [ "$i" != "/etc/update-motd.d/98-fsck-at-reboot" ]; then $i 2>/dev/null; fi; done
fi

function beep_on_return () (
  echo -ne '\a'
)
add-zsh-hook precmd beep_on_return

# Add ./bin on the path, if it's marked as safe
export PATH=./.git/safe/../../bin:~/bin:$PATH:~/.gem/bin:~/.cargo/bin
export GEM_HOME=~/.gem
setxkbmap -layout us -option ctrl:nocaps
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
