function mov2webm --description 'Turn a mov into a webm file'
  set --local filename $argv[1]
  set --local rootname (echo "$filename" | sed 's/\.[^.]*$//')
  ffmpeg -i $filename -b:v 0 -crf 30 -pass 1 -an -f webm -y /dev/null
  ffmpeg -i $filename -b:v 0 -crf 30 -pass 2 "$rootname".webm
  rm ffmpeg2pass-0.log
end
