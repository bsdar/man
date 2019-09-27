###############
### .bashrc ###
###############


# Create everything with go-rwx
umask 077

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# export TERM as 256color capable
export TERM=xterm-256color

# hostname
host_abbr=`hostname`

## Prompt config
export PS1="\[$(tput setaf 2 0 0)\][\[$(tput setaf 1 0 0)\]$host_abbr \[$(tput setaf 2 0 0)\]\[$(tput bold)\]\W\[$(tput sgr0)\]\[$(tput setaf 2 0 0)\]]\\$ \[$(tput sgr0)\]\[\033]0;\w\007\]"

# Set tab width
tabs -4


## Bash options

stty -ixon

# History control
HISTTIMEFORMAT='%F %T '
HISTSIZE=1000000
HISTFILESIZE=1000000
HISTCONTROL=ignoreboth
shopt -s histappend
# Append commands to the history every time a prompt is shown (instead of on exit)
PROMPT_COMMAND='history -a'

# Keybindings and editors
set -o emacs
export EDITOR=vim
export MANPAGER=less



## Misc

## User specific aliases and functions

unalias -a


# tmux

export TMUXCFG='~/.config/tmux/tmux.conf'
alias tmux="tmux -f $TMUXCFG"
alias ta="tmux -f $TMUXCFG -q has 2>/dev/null && exec tmux -f $TMUXCFG attach || exec tmux -f $TMUXCFG new -s$(hostname -s)"
alias tas="exec tmux -f $TMUXCFG attach -t"
alias tn="tmux -f $TMUXCFG new -s"
alias te="vi $TMUXCFG"
alias ter="tmux source $TMUXCFG"
alias tl='tmux list-sessions'


# List files/dirs

alias 1='gls -lah --color --group-directories-first'
alias 1e='exa -laag --group-directories-first'
alias 1et='exa -lag --tree --level 2 --group-directories-first'
function _11() { 1 "$@" | more; }; alias 11="_11"
alias 12='1 -d'
alias tree="tree -Cpugh --dirsfirst -L 2"
alias 2='ps -A -o user,pid,ppid,start,time,args | awk '"'"'$3 != 2 && $2 != 2'"'"' | egrep -v "ps -A -o|awk $3"'
alias 22='ps -A -o user,pid,ppid,start,time,args | egrep -v "ps -A -o|egrep -v|ggrep -E -i --color" | ggrep -E -i --color'


# Read files

alias vi=vim
alias r='vi -R'
# Show all control chars to avoid surprises like CVE-2019-12735
alias c='cat -v'
alias cat='cat -v'
alias m='more'


# Manipulate files

alias rmi='rm -i'
alias cpi='cp -i'
alias mvi='mv -i'
alias rm='rm -rf'
alias cp='cp -rf'
alias cpo='cp -rfp'
alias mv='mv -f'
alias du='du -hs'
alias df='df -h'
alias scp='scp -r'


# Root

alias s='doas -s'


# Dev

alias grepc='\ggrep -I --color'
alias grepn='\ggrep -I --color -i -n'
alias grepr='\ggrep -I --color -i -R'
alias grepcn='\ggrep -I --color -n'
alias grepnr='\ggrep -I --color -i -n -R'
alias grepcr='\ggrep -I --color -R'
alias grepcnr='\ggrep -I --color -n -R'
alias egrep='gegrep -I --color -i'
alias grep='ggrep -I --color -i'
alias rgc='rg -s'
alias rgn='rg -in'
alias rgcn='rg -sn'
alias rg='rg -i'
function _grepall() { gegrep $\|$@; }; alias grepall="_grepall"

# From first match to the end
function fm2e() { awk "/$1/,0" $2; }

# From first match to the second match
function fm2sm() { fm2e $1 $3 | sed "/$2/q"; }

# From last match to the end (e.g. print all syslog entries from the last boot up to now)
function lm2e() { awk "BEGIN { x=9999999999 }; /$1/ { x=NR }; END { print x }" $2 | xargs -Ixox tail -n +xox $2; }

alias diff='diff -r'
alias diffb='diff -r --brief'

alias gpgk='gpg --keyserver hkp://keys.gnupg.net --search-keys'
alias gpgv='gpg --keyid-format long --verify'

alias make='make -j'$(( $(sysctl -n hw.ncpu) * 2 ))


# Network

alias l="netstat -nl -f inet"
alias lg="netstat -nl -f inet | rg"


# Misc

alias 3='pwd'
alias 4='clear'
alias 6='vi ~/.config/openbox/autostart'
alias 7='vi ~/.Xresources && xrdb -load ~/.Xresources'
alias 8='source ~/.bashrc'
alias 9='vi ~/.bashrc'
alias 0='exit'
alias trmb='nc termbin.com 9999'
alias calc='calc -p -m 0'
alias img='feh -B black -.'



# Process aliases files in ~/.aliases
for i in ~/.aliases/* ; do
    if [ -r "$i" ]; then
        source $i
    fi
done


# Enable bash completion
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

