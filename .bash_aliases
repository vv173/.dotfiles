# .bash_aliases

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --time-style=long-iso --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias diff='diff --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alhF'
alias la='ls -AF'
alias l='ls -CF'

# Open files, folders or URLs using the default application in the background
alias open='xdg-open "$@" &>/dev/null & disown'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Print current branch name
alias current-branch='git branch --show-current | tr -d "\n"'

# Add current branch name to the clipboard
alias copy-branch='git branch --show-current | tr -d '\n' | xclip -selection clipboard'