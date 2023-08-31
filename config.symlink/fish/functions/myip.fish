function myip --description 'Print the internal ip address of this device'
  ifconfig | grep "inet " | grep -v 127.0.0.1
end
