# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Don't add duplicate lines or lines beggining with a space to the bash history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Set history format to include timestamps
HISTTIMEFORMAT="%Y-%m-%d %T "

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable starship prompt
eval "$(starship init bash)"

# Set default editor as Vim
export EDITOR=/usr/bin/vim

# Source git global configuration file
export GIT_CONFIG_GLOBAL="$HOME/.config/.gitconfig"

# Source starship configuration file
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

## Command aliases

# Bash aliases

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias diff='diff --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll=' ls -lhF --time-style=long-iso --color=auto'
alias la=' ls -lhFa --time-style=long-iso --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Functions

# Make a directory, then go there
md() {
    test -n "$1" || return
    mkdir -p "$1" && cd "$1"
}

# Docker aliases

# Run yq in docker container
yq() {
  docker run --rm -i -w /workdir -v "${PWD}":/workdir mikefarah/yq "$@"
}

# Run jq in docker container
jq() {
  docker run --rm -i -w /workdir -v "${PWD}":/workdir ghcr.io/jqlang/jq "$@"
}

# Run hadolint in docker container
hadolint() {
  docker run --rm -i hadolint/hadolint hadolint "$@" 
}

# Run shellcheck in docker container
shellcheck() {
  docker run --rm -i -w /mnt -v "${PWD}:/mnt" koalaman/shellcheck:stable "$@"
}

# Run kustomize in docker container
kustomize() {
  docker run --rm -i -w /workdir -v "${PWD}:/workdir" registry.k8s.io/kustomize/kustomize:v5.4.3 "$@"
}

# Run terraform in docker container
# terraform() {
#   docker run --rm -i -w /workdir -v "${PWD}:/workdir" hashicorp/terraform:latest "$@"
# }

# Run terraform with shared docker socket in docker container
# terraform-docker() {
#   docker run --rm -i -v /var/run/docker.sock:/var/run/docker.sock -w /workdir -v "${PWD}:/workdir" hashicorp/terraform:latest "$@"
# }

# Run aws-cli2 in docker container
# aws() {
#   docker run --rm -it -e AWS_PROFILE -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli:latest "$@"
# }

## Auto completion

# Terraform
complete -C /usr/bin/terraform terraform

# AWS CLI 2
complete -C '/usr/local/bin/aws_completer' aws

