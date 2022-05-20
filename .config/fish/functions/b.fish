function b
  if $argv 1
    command cd ../
  end
  if $argv 2
    command cd ../../
  end
  if $argv 3
    command cd ../../../
  end
  if $argv 4
    command cd ../../../../
  end
  if $argv 5
    command cd ../../../../../
  end
  if $argv 6
    command cd ../../../../../..
  end
end
