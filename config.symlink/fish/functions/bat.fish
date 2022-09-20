function cat --description 'Use bat instead of cat'
  bat --theme=(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo Dunkel || echo Licht) $argv
end
