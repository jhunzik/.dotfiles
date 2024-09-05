PATH=/opt/homebrew/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/usr/local/go/bin:/bin
PATH=$PATH:/opt/puppetlabs/bin
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:/$HOME/go/bin
PATH+$PATH:/$HOME/.cargo/bin
tmux-session dev

#fzf bindings
if command -v brew
then
  . $(brew --prefix)/opt/fzf/shell/key-bindings.zsh
fi

# Env Vars
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
VISUAL=nvim
EDITOR=$VISUAL
FZF_DEFAULT_OPTS="--height 40% --layout reverse --info inline --border --preview 'bat --color=always {}'"
FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob "!.git/*""
PY_COLORS=1
ANSIBLE_FORCE_COLOR=1

NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


unsetopt beep
bindkey -e

# Pure prompt stuff
stty erase '^?'

# Functions
function fdex() {
	CONTAINER=`docker ps | rg -v CONTAINER | awk '-F ' ' {print $NF}' | fzf`
	if [ ! -z $CONTAINER ]
	then
		docker exec -it $CONTAINER bash
	fi
}

function fdlog() {
	CONTAINER=`docker ps | rg -v CONTAINER | awk '-F ' ' {print $NF}' | fzf`
	if [ ! -z $CONTAINER ]
	then
		docker logs -f $CONTAINER
	fi
}

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
alias bw-session="export \"BW_SESSION=\$(bw unlock --raw)\""
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --max-count=15"
alias ls="eza --group-directories-first"
alias ll="ls -lah"
alias vim=nvim
alias vi=nvim
alias pbcopy="xsel --input --clipboard"
alias pbpaste="xsel --output --clipboard"
alias zsh-reload="source ~/.zshrc && echo 'zsh config reloaded'"

#Docker
alias dsh="fdex"
alias dlog="fdlog"

#Java
alias java8="sdk use java 8.0.332-tem"
alias java11="sdk use java 11.0.16-tem"
alias java17="sdk use java 17.0.3-tem"
alias m="maven_cmd"

# Source cargo env
[ -f ~/.cargo/env ] && source $HOME/.cargo/env


# Start ZSH Plugins
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit; compinit

# Source all plugins
for f in ~/.zsh-plugins/*/*.zsh; do source $f; done

fpath+=$HOME/.zsh-plugins/pure
autoload -Uz promptinit; promptinit
prompt pure
zstyle :prompt:pure:git:stash show yes
# End ZSH Plugins

# Source work .zsh
if [[ -e $HOME/.work.zsh ]] then;
	source $HOME/.work.zsh
fi

