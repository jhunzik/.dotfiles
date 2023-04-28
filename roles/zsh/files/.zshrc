PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:$HOME/bin:$HOME/.local/bin:/opt/puppetlabs/bin
PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
tmux-session dev

alias vim=nvim

#fzf bindings
. $(brew --prefix)/opt/fzf/shell/key-bindings.zsh

# Env Vars
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
VISUAL=nvim
EDITOR=$VISUAL
FZF_DEFAULT_OPTS="--height 40% --layout reverse --info inline --border"
FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob "!.git/*""
PY_COLORS=1
ANSIBLE_FORCE_COLOR=1

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

function maven_cmd() {
  if [[ -f "mvnw" ]] then
    ./mvnw $@
  else
    mvn $@
  fi
}

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --max-count=15"
alias ls="exa --group-directories-first"
alias ll="ls -lah"
alias bw-session="export \"BW_SESSION=$(bw unlock --raw)\""
#Docker
alias dsh="docker_ssh"
alias dlog="docker_log"
alias dcp="docker-compose"
#Java
alias java8="sdk use java 8.0.332-tem"
alias java11="sdk use java 11.0.16-tem"
alias java17="sdk use java 17.0.3-tem"
alias m="maven_cmd"

# Start ZSH Plugins
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit; compinit

# Source all plugins
for f in ~/.zsh-plugins/*/*.zsh; do source $f; done

fpath+=$HOME/.zsh-plugins/pure
autoload -Uz promptinit; promptinit
prompt pure
# End ZSH Plugins

# Source work .zsh
if [[ -e $HOME/.work.zsh ]] then;
	source $HOME/.work.zsh
fi

