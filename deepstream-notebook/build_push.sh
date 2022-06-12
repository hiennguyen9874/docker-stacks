DOCKER_BUILDKIT=1 docker build -t $1/deepstream-notebook:$2 --build-arg BASE_CONTAINER=$3 --build-arg DISTRO=$4 --build-arg ARCH=$5 .
docker push $1/deepstream-notebook:$2
