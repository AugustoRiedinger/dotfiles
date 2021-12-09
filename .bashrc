# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * * * * * * * * * * * * * *       EXPORTS       * * * * * * * * * * * * * *
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Set alacritty as terminal:
export TERM="alacritty"

# No duplicate entries in history:
export HISTCONTROL=ignoredups:erasedups

# Set editor as vim:
export EDITOR="vim"

# Set vim as manpager:
export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * * * * * * * * * * * * * *        GENERAL      * * * * * * * * * * * * * *
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Set vi mode:
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# If not running interactively, don't do anything:
[[ $- != *i* ]] && return

# Change to named directory without using 'cd':
shopt -s autocd 

# Autocorrect cd misspellings:
shopt -s cdspell

# Save multi-line commands in history as single line:
shopt -s cmdhist
shopt -s dotglob

# Do not overwrite history:
shopt -s histappend

# Expand aliases:
shopt -s expand_aliases

# Ignore upper and lowercase when TAB completion:
bind "set completion-ignore-case on"

# Use the up and down arrow keys for finding a command in history:
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Adding personal scripts to the global path:
PATH=$PATH:$HOME/scripts

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * * * * * * * * * * * * * *        STARTUP      * * * * * * * * * * * * * *
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Launch super-cool Starship Prompt:
eval "$(starship init bash)"

# Run fm6000 on startup:
fm6000 -f $HOME/scripts/.astronaut

# Remap esc key to caps lock:
setxkbmap -option caps:escape
# Autohide the pointer after 4 secs idle:
unclutter -idle 4 -jitter 2 -root &

# Setting up the OpenFOAM environment:
source /opt/OpenFOAM/OpenFOAM-9/etc/bashrc
export WM_OPTIONS=$WM_ARCH$WM_COMPILER$WM_PRECISION_OPTION$WM_LABEL_OPTION$WM_COMPILE_OPTION

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * * * * * * * * * * * * * *      FUNCTIONS      * * * * * * * * * * * * * *
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Archive extraction - usage: ex <file>:
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1 && rm $1    ;;
      *.tar.gz)    tar xzf $1 && rm $1    ;;
      *.bz2)       bunzip2 $1 && rm $1    ;;
      *.rar)       unrar x $1 && rm $1    ;;
      *.gz)        gunzip $1  && rm $1    ;;  
      *.tar)       tar xf $1  && rm $1    ;;  
      *.tbz2)      tar xjf $1 && rm $1    ;;
      *.tgz)       tar xzf $1 && rm $1    ;;
      *.zip)       unzip $1   && rm $1    ;;
      *.Z)         uncompress $1 && rm $1 ;;
      *.7z)        7z x $1    && rm $1    ;;
      *.deb)       ar x $1    && rm $1    ;;
      *.tar.xz)    tar xf $1  && rm $1    ;;
      *.tar.zst)   unzstd $1  && rm $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * * * * * * * * * * * * * *        ALIASES      * * * * * * * * * * * * * *
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# File management:
alias ls='exa -l --color=always --group-directories-first'
alias la='ls -al --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias cl='clear'
alias ..='cd ..'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias drag='dragon-drag-and-drop'

# Vim:
alias v='vim'

# Git:
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  
alias tag='git tag'
alias newtag='git tag -a'
