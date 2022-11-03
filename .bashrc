# ~/.bashrc

# history
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth  # no duplicate lines or lines starting with space in the history.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


# list dotfiles first when using the ls command
export LC_COLLATE=C

# colorful man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


# aliases
alias ls='ls --group-directories-first --color=always --quoting-style=literal'
alias pacman='pacman --color=auto'
alias grep='grep --color=auto'
alias dir="dir --color=auto"
alias mkdir="mkdir -pv"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"

# shortcuts
alias v="nvim"
alias fuck='eval "sudo $(history -n | tail -1)"'     # run the last command with sudo

alias ll='ls -lh'
alias la='ls -lah'

# python aliases
alias p='python'
alias pv='python -V'
alias ppth='python -c "import sys; print(sys.executable)"'


export TERM="xterm-256color"
export LANG="en_US.UTF-8"