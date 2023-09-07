function lt --description 'Use eza instead of ls'
  eza -al --icons --no-user --no-time --tree -L2 $argv
end
