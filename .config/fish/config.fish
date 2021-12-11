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
set -U fish_user_paths /bin $HOME/scripts $fish_user_paths

#Autocomplete and highligth colors:
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * * * * * * * * * * * * * *        STARTUP      * * * * * * * * * * * * * *
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Check if running interactively:
if ! status -i
    exit
end

# Launch super-cool starship prompt:
starship init fish | source

# Run fm6000 on startup:
fm6000 -f $HOME/scripts/.astronaut

# Remap esc key to caps lock:
setxkbmap -option caps:escape

# Autohide the pointer after 4 secs idle:
unclutter -idle 4 -jitter 2 -root &

# Setting up the OpenFOAM environment:
#source /opt/OpenFOAM/OpenFOAM-9/etc/bashrc
#set -Ux WM_OPTIONS $WM_ARCH$WM_COMPILER$WM_PRECISION_OPTION$WM_LABEL_OPTION$WM_COMPILE_OPTION

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

# Vim:
alias v='vim'

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
