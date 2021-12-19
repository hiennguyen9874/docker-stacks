DOCKER_BUILDKIT=1 docker build -t $1/datascience-notebook:$2 --build-arg BASE_CONTAINER=$1/scipy-notebook:$2 .
docker push $1/datascience-notebook:$2