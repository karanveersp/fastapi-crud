Build and start the container

```sh
docker-compose up -d --build
```

Run tests inside container

```sh
docker-compose exec web pytest .
```