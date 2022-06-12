DOCKER_BUILDKIT=1 docker build -t $1/deepstream-notebook:$2 --build-arg BASE_CONTAINER=$3 .
docker push $1/deepstream-notebook:$2
