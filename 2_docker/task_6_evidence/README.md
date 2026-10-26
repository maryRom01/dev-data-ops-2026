```aiignore
$ docker volume create my-shared-volume
$ docker volume inspect my-shared-volume

$ docker run --rm -v my-shared-volume:/app/data --name cont-1 alpine:3.20 sh -c "echo 'Evidence: Data successfully written' > /app/data/evidence.txt"
$ MSYS_NO_PATHCONV=1 docker run --rm -v my-shared-volume:/app/data --name cont-2 alpine:3.20 cat /app/data/evidence.txt

```