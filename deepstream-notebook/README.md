# Deepstream 6.0.0

- Download file `deepstream-6.0_6.0.0-1_amd64.deb` from [developer.nvidia.com/deepstream-sdk](https://developer.nvidia.com/deepstream-sdk)
- GPU: `bash ./build_push.sh hiennguyen9874 ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-v0.2 ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-deepstream6.0-v0.2`

# Deepstream 6.0.1

- Download file
- GPU: `DOCKER_BUILDKIT=1 docker build -t hiennguyen9874/deepstream-notebook:ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-deepstream6.0.1-v0.2 --build-arg BASE_CONTAINER=hiennguyen9874/tensorrt-notebook:ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-v0.2 --build-arg DEEPSTREAM_DEB_FILE=deepstream-6.0_6.0.1-1_amd64.deb . && docker push hiennguyen9874/deepstream-notebook:ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-deepstream6.0.1-v0.2`
