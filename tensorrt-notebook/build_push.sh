DOCKER_BUILDKIT=1 docker build -t $2/tensorrt-notebook:$4 --build-arg BASE_CONTAINER=$2/datascience-notebook:$3 --build-arg CUDA_VERSION=$1 .
docker push $2/tensorrt-notebook:$4