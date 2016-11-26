function drmv --description "delete all volumes"
  docker volume rm (docker volume ls -q)
end
