# Set up the prompt

autoload -Uz promptinit
autoload -Uz add-zsh-hook
# promptinit
# prompt adam1

setopt histignorealldups # Remove old duplicates
setopt sharehistory # Share history between sessions
setopt interactivecomments # Allow comments in interactive sessions
setopt transientrprompt # Required for autocomplete

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
# Don't store commands starting with a space in the HISTFILE
setopt HIST_IGNORE_SPACE

# Use modern completion system
skip_global_compinit=1
source ~/buntuble/downloads/zsh-autocomplete/zsh-autocomplete.plugin.zsh

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
export PATH=./.git/safe/../../bin:~/bin:$PATH:~/.gem/bin:~/.cargo/bin:~/.local/bin
export GEM_HOME=~/.gem
setxkbmap -layout us -option ctrl:nocaps
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"

[ -f ~/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh
