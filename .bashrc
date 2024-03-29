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

# Set history format to include timestamps
HISTTIMEFORMAT="%Y-%m-%d %T "

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

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll=' ls -lhF --time-style=long-iso --color=auto'
alias la=' ls -lhFa --time-style=long-iso --color=auto'

## Functions

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
