# FastAPI App

Run this before the docker build to ensure requirements.txt is generated from up-to-date
dependencies.

```sh
pdm export -f requirements --without-hashes > requirements.txt
```