```aiignore
$ docker build -f Dockerfile-entrypoint -t 2_docker_5 .
$ docker run -d -p 8054:8050 2_docker_5
$ docker run -d -p 8053:8050 2_docker_5 obj_dependency_data.csv

$ docker run -d -p 8050:8050 -v $(pwd):/app --name bound-sample-app 2_docker_5
$ MSYS_NO_PATHCONV=1 docker exec -it bound-sample-app ls -la /app
$ docker logs bound-sample-app

```