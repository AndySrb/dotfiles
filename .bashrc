# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Import colorscheme from 'wal'
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(wal -r &)
#wal -r && 

# If the command above doesn't work,
# try this alternative.

#setsid wal -r

#[ "$TERM" = "rxvt-unicode-256color" ] && xrdb .Xdefaults.urxvt
#[ "$TERM" = "st-256color" ] && xrdb .Xdefaults.st

function dusort () {
    DIR=$(echo $1 | sed 's#\/$##')
    du -scxh $(mount | awk '{print $3}' | sort | uniq \
     | sed 's#/# --  exclude=/#') $DIR/* | sort -h
}


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
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

if [ -x "/bin/lsd" ]
then
	alias ls='lsd --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

cd() { builtin cd "$@" && ls; }
# St title
#PS1="\[\033]0;\u@\h:\w\007\][\u@\h \W]\$ "
PS1="\[\033]0;\w\007\][\u@\h \W]\$ "



wallpaper-jpg() {  cp "$@" /home/andy/Desktop.jpg && feh --bg-scale ~/Desktop.jpg ; }

wallpaper-png() {  cp "$@" /home/andy/Desktop.png && feh --bg-scale ~/Desktop.png ; }


poweroff() { echo -n 'Do you want to turn off your pc
	(Y)es, (N)o
	:' 
read options	
	
	case $options  in   
	
	Y|y)
# sudo systemctl disable logmein-hamachi &&
	sudo poweroff 
	;;	
	N|n) exit
	;;
*) exit
esac }

################
# Default Prog #
################
export EDITOR=vim
export VISUAL=vim
export TERMINAL=st
export BROWSER=brave
export PAGER=less
export PDFVIEWER=zathura
#DVIVIEWER
#MDVIEWER
#PSVIEWER

################
# Clean-up     #
################	




################
#   Aliases    #
################
#alias apt-install='sudo apt-get install'
#alias apt-remove='sudo apt-get remove'
#alias apt-update='sudo apt update'
#alias apt-upgrade='sudo apt-get upgrade'
#alias sources='sudo nano /etc/apt/sources.list'
#alias aptitude='sudo aptitude'

# host package server
alias hostPackages="sudo python -m http.server -d /var/cache/pacman/pkg/"



alias la="ls -a"
alias reboot="sudo reboot"
alias ytmp4="youtube-dl -x --video-format mp4"
alias ytmp3="youtube-dl -x  --write-thumbnail --audio-format  mp3"


alias feh='feh --bg-scale'
alias sources='sudo nano /etc/apt/sources.list'
alias fdisk=lsblk
alias fuck=sudo
alias mount='sudo mount'
alias umount='sudo umount'
alias sranger='sudo cp ~/.config/ranger/rc.conf /root/.config/ranger/rc.conf && sudo ranger'
alias pc-info=screenfetch
alias steam-wine='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe >/dev/null 2>&1 &'
alias pacman="sudo pacman"

alias mcrun='java -jar ~/Minecraft/TLauncher.jar'
alias reboot='./bin/restart.sh'
alias restart='./bin/restart.sh'

alias 'hamachi-start'='sudo systemctl enable logmein-hamachi && sudo systemctl restart '
alias 'hamachi-restart'='sudo systemctl restart logmein-hamachi'
alias 'hamachi-stop'='sudo systemctl disable logmein-hamachi'

alias win-compile="x86_64-w64-mingw32-g++ $@ -o win.exe -DCURL_STATICLIB -static -lstdc++ -lgcc -lpthread -lwldap32 -lws2_32" #-lcurl 
alias Sudo='sudo !!'

##################
# Important Ones #
##################

alias wine32="WINEPREFIX="$HOME/.prefix32" "
alias wine64="WINEPREFIX="$HOME/.wine" "
alias arduino-upload="arduino-cli upload -b arduino:avr:uno -p /dev/ttyUSB0"



dbus-update-activation-environment --all


# Here is all your login related aliases

if [[ -f "/tmp/autoCD" && -s "/tmp/autoCD" ]]; then 
	cd "`cat /tmp/autoCD`" && rm /tmp/autoCD	
fi



source ~/.bashrc_private
alias config='/usr/bin/git --git-dir=/home/andy/.cfg/ --work-tree=/home/andy'
