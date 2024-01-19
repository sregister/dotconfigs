
# tmux sessionizer with ctrl-f
bind '"\C-f": "tmux-sessionizer\n"'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
#function parse_git_branch() {
#    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
#    if [ ! "${BRANCH}" == "" ]
#    then
#        echo "[${BRANCH}${STAT}]"
#    else
#        echo ""
#    fi
#}

function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \[\1$(parse_git_dirty)\]/"
}

export PS1="\[\e[35m\]\h\[\e[m\]\[\e[33m\] \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# get current status of git repo
#export PS1="\[\e[32m\]\u\[\e[m\]@\[\e[35m\]\h\[\e[m\]\[\e[33m\]\`parse_git_branch\`\[\e[m\] \[\e[36m\]\W\[\e[m\]\\$ "
#export DISPLAY=127.0.0.1:0.0
umask 022

if command -v nvim &> /dev/null; then
  alias vim='nvim'
  alias vi='nvim'
fi


if xset -version &> /dev/null; then
	xset r rate 400 65 &> /dev/null
fi

AUTO_ENV_FILENAME='.autoenv'
source ~/.autoenv/activate.sh

