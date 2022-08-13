function gifify --description 'Turn a movie into a gif'
  set --local filename $argv[1]
  set --local rootname (echo "$filename" | sed 's/\.[^.]*$//')
  ffmpeg -i "$filename" -r 20 -f gif - | gifsicle > "$rootname".gif
end
