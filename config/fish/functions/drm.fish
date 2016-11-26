function drm --description "delete all containers"
  docker rm (docker ps -aq)
end
