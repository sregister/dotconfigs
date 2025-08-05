# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# tmux sessionizer with ctrl-f
bind '"\C-f": "tmux-sessionizer\n"'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=3000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# alias ip to ip -c if its supported
if ip -V &> /dev/null; then
    alias ip='ip -c'
fi

# some more ls aliases
alias ll='ls -alFa'
alias la='ls -Aa'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

ring_thrice() {
    for i in {1..3}; do 
        echo -e "\a"
        sleep 1.5
    done
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

prompt_symbol() {
    if [ $(jobs -s | wc -l) -gt 0 ]; then
        echo "▸"
    else
        echo "$"
    fi
}

function truncate_pwd {
    if [ ${#PWD} -gt 20 ]; then
        echo "^"${PWD: -17}
    else
        echo $PWD
    fi
}

abs() {
    local file="$1"
    local full_path

    # Check if the file exists
    if [[ -e "$file" ]]; then
        # Get the absolute path of the file
        full_path="$(cd "$(dirname "$file")" && pwd)/$(basename "$file")"
        echo "$full_path"
    else
        echo "Error: File '$file' does not exist."
    fi
}

export PS1="\[\e[35m\]\h\[\e[m\]\[\e[33m\] \[\033[32m\]\W\[\033[33m\] \$(parse_git_branch)\[\033[00m\]\$(prompt_symbol) "
umask 022

if command -v nvim &> /dev/null; then
  alias vim='nvim'
  alias vi='nvim'
fi
export EDITOR='vim'


if xset -version &> /dev/null; then
	xset r rate 400 65 &> /dev/null
fi

AUTOENV_ENV_FILENAME='.autoenv'
source ~/.autoenv/activate.sh

#wsl fix for windows filesystem 777 files being unreadable
LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS
