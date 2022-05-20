function push
  command xclip -sel c < $HOME/.git-token
  command echo 'Token copied to the clipboard!'
  command echo 'For more information visit https://github.com/settings/tokens'
  git push origin $argv
end
