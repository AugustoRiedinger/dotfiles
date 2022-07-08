function ssh $argv
  if test $argv = "dirac"
    command ssh -Y dirac@172.16.52.109
  else if test $argv = "augusto"
    command ssh -Y augusto@172.16.52.109
  else if test $argv = "martin"
    command ssh -Y msaravia@172.16.52.86
  else if test $argv = "gimap" || $argv = "uni"
    command ssh -Y ariedinger@172.16.52.85
  else if test $argv = "ariedinger" || $argv = "notebook"
    command ssh -Y ariedinger@192.168.0.148
  else if test $argv = "git"
    command ssh -T git@github.com
  else if test $argv = "git"
    command ssh -T git@github.com
  else if test $argv = "pv"
    command ssh -Y -L 11111:dirac:11111 dirac@172.16.52.109
  else
    command ssh $argv
  end
end
