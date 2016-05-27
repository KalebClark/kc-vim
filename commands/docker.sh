# Docker Commands

echo -e "docker_bash:\t\tStart bash shell in container"
function docker_bash() {
    docker run -i -t $1 /bin/bash    
}

echo -e "docker_bash_running:\t\tStart bash shell in running container"
function docker_bash_running() {
    docker exec -i -t $1 /bin/bash
}

echo -e "docker_remove_all_containers:\tRemoves all docker containers"
function docker_remove_all_containers() {
    docker rm $(docker ps -a -q)
}

echo -e "docker_remove_all_images:\tRemoves all docker images"
function docker-remove-all-images() {
    docker rmi -f $(docker images -q) 
}

echo -e "docker_remove_all_volumes:\tRemoves all docker volumes"
function docker_remove_all_volumes() {
    docker volume rm $(docker volume ls -q)
}
