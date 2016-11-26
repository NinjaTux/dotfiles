function dstop --description "stop all running docker containers"
  docker stop (docker ps -aq)
end
