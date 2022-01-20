DOCKER_BUILDKIT=1 docker build -t $1/tensorrt2-notebook:$3 --build-arg BASE_CONTAINER=$1/datascience-notebook:$2 .
docker push $1/tensorrt2-notebook:$3