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
