# docker-cleaner-swarm for Docker swarm
This is docker-cleaner-swarm image source code. The project is to clean docker
automatically by [CRON](https://en.wikipedia.org/wiki/Cron).

## Run
Run background clear service by [docker-compose](https://docs.docker.com/compose):
```bash:
docker network create --driver=overlay --attachable cleaner-network
docker-compose -f docker-compose.yaml -f docker-compose.build.yaml build
docker stack rm docker-clean
docker stack deploy --compose-file docker-compose.yaml -c docker-compose.build.yaml docker-clean
```

or by sh script
```bash:
./start-docker-apps-swarm.sh
```

## Links
* This repo is inspirated by ["Docker - How to cleanup (unused) resources"](https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430)
