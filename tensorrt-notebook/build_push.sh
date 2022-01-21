DOCKER_BUILDKIT=1 docker build -t $1/tensorrt-notebook:$3 --build-arg BASE_CONTAINER=$1/datascience-notebook:$2 CUDA_VERSION=$4 TRT_VERSION=$5 CUDA=$6 .
docker push $1/tensorrt-notebook:$3