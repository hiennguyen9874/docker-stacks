DOCKER_BUILDKIT=1 docker build -t $1/deepstream-notebook:$3 --build-arg BASE_CONTAINER=$1/tensorrt-notebook:$2 --build-arg DEEPSTREAM_DEB_FILE=$4 .
docker push $1/deepstream-notebook:$3
