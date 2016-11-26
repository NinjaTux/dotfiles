function drmif --description "force delete all images"
  docker rmi -f (docker images -q)
end
