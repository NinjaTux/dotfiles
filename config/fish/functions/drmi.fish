function drmi --description "delete all images"
  docker rmi (docker images -q)
end
