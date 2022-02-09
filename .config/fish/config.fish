# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * * * * * * * * * * * * * *       EXPORTS       * * * * * * * * * * * * * *
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Supresses fish's intro message:
set -U  fish_greeting                                
 
# Sets the terminal type:
set TERM "alacritty"

# $EDITOR use vim in terminal:
set EDITOR "vim"                            

# Set Vim as manpager: 
set -x MANPAGER '/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * * * * * * * * * * * * * *        GENERAL      * * * * * * * * * * * * * *
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Set vi mode:
function fish_user_key_bindings
  fish_vi_key_bindings
end

### PATH CONFIG: 
# First line removes the path; second line sets it.  Without the first line, your path gets massive and fish becomes very slow:
set -e fish_user_paths
set -U fish_user_paths /bin $HOME/scripts $HOME/.emacs.d/bin  $fish_user_paths

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * * * * * * * * * * * * * *        STARTUP      * * * * * * * * * * * * * *
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Check if running interactively:
if ! status -i
    exit
end

# Change caps to esc:
setxkbmap -option caps:escape

# Autohide the pointer after 4 secs idle:
unclutter -idle 4 -jitter 2 -root &

# Cool term art:
colorscript random

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * * * * * * * * * * * * * *      FUNCTIONS      * * * * * * * * * * * * * *
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Functions needed for !! and !$:
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# The bindings for !! and !$:
if [ $fish_key_bindings = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * * * * * * * * * * * * * *        ALIASES      * * * * * * * * * * * * * *
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Navigation:
alias cl='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Changing "ls" to "exa":
alias ls='exa -l --color=always --group-directories-first' 
alias la='exa -la --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

# Colorize grep output (good for log files):
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Confirm before overwriting something:
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# Git:
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias diff='git diff'
alias commit='git commit -m'
alias stat='git status'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

# Programs:
alias v='vim'
alias pdf='zathura'
alias img='vimiv'
alias shareScreen='xcompmgr -c -l0 -t0 -r0 -o.00'
alias drag='dragon-drag-and-drop'

# OpenFOAM:
alias blockMesh='blockMesh | tee log.blockMesh'
alias wmake='wmake | tee log.wmake'
alias checkMesh='checkMesh | tee log.checkMesh'
alias icoFoam='icoFoam | tee log.icoFoam'
alias simpleFoam='simpleFoam | tee log.simpleFoam'
alias foamDummy='touch open.foam'
