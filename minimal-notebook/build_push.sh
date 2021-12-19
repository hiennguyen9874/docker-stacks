DOCKER_BUILDKIT=1 docker build -t $1/minimal-notebook:$2 --build-arg BASE_CONTAINER=$1/base-notebook:$2 .
docker push $1/minimal-notebook:$2