function docker-clean --description 'Clean up Docker'
  docker system df
  docker rm $(docker ps --filter=status=exited --filter=status=dead -q)
  docker rmi $(docker images --filter dangling=true -q)
  docker container prune -f
  docker volume prune -f
  docker network prune -f
  docker system prune -a -f
  docker system df
end
