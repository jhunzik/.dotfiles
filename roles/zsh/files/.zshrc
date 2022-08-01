if [[ -z $TMUX ]]; then;
	tmux attach
fi

fpath+=$HOME/.zsh-plugins/pure
autoload -Uz compinit promptinit; compinit; promptinit;
prompt pure

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:$HOME/bin:/opt/puppetlabs/bin
alias vim=nvim

# Env Vars
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
VISUAL=nvim
EDITOR=$VISUAL
FZF_DEFAULT_OPTS="--height 40% --layout reverse --info inline --border"
FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob "!.git/*""

unsetopt beep
bindkey -e

# Pure prompt stuff
stty erase '^?'

# Functions
function docker_ssh() {
	docker exec -it "$1" /bin/bash
}

function docker_log() {
	docker logs -f "$1"
}

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --max-count=15"
alias ls="exa --group-directories-first"
alias ll="ls -lah"
alias dsh="docker_ssh"
alias dlog="docker_log"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/hunziker/.zshrc'
# End of lines added by compinstall

# Source all plugins
for f in ~/.zsh-plugins/*/*.zsh; do source $f; done

# Source work .zsh
if [[ -e $HOME/.work.zsh ]] then;
	source $HOME/.work.zsh
fi

# fzf key bindings
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh


if [ -e /home/hunziker/.nix-profile/etc/profile.d/nix.sh ]; then . /home/hunziker/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
