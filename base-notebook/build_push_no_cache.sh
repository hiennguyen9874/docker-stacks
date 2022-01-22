DOCKER_BUILDKIT=1 docker build --no-cache -t $3/base-notebook:$4 --build-arg ROOT_CONTAINER=$1 --build-arg PYTHON_VERSION=$2 .
docker push $3/base-notebook:$4