function ip --description 'Get your public ip'
  dig +short myip.opendns.com @resolver1.opendns.com
end