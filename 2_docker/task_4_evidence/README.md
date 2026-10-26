```aiignore
$ docker build -f Dockerfile -t 2_docker .
$ docker run -d -p 8050:8050 --name sample-app-container 2_docker
$ docker stop sample-app-container
```