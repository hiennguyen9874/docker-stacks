DOCKER_BUILDKIT=1 docker build -t $1/deepstream-notebook:$3 --build-arg BASE_CONTAINER=$1/tensorrt-notebook:$2 .
docker push $1/deepstream-notebook:$3