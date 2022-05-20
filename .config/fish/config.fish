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
set -U fish_user_paths /bin $HOME/scripts $HOME/.emacs.d/bin $HOME/.local/bin  $fish_user_paths

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# * * * * * * * * * * * * * *        STARTUP      * * * * * * * * * * * * * *
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
# Check if running interactively:
if ! status -i
    exit
end

# Change caps to esc:

# Autohide the pointer after 4 secs idle:

# Cool term art:
colorscript random

# OMF theme config:
set -U dangerous_nogreeting
