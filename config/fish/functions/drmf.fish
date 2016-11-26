function drmf --description "force delete all containers"
  docker rm -f (docker ps -aq)
end
