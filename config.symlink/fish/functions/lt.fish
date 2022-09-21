function lt --description 'Use exa instead of ls'
  exa -al --icons --no-user --no-time --tree -L2 $argv
end
