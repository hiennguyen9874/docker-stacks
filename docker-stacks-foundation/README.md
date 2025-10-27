# Docker stacks foundation

## Deepstream 6.3

- Build Deepstream 6.3: `DOCKER_BUILDKIT=1 docker build -t hiennguyen9874/docker-stacks-foundation:deepstream_6.3-gc-triton-devel --build-arg ROOT_IMAGE=nvcr.io/nvidia/deepstream:6.3-gc-triton-devel --build-arg PYTHON_VERSION=3.8 .`
- Push Deepstream 6.3: `docker push hiennguyen9874/docker-stacks-foundation:deepstream_6.3-gc-triton-devel`

## Deepstream 8.0

- Build Deepstream 8.0: `DOCKER_BUILDKIT=1 docker build -t hiennguyen9874/docker-stacks-foundation:deepstream_8.0-gc-triton-devel --build-arg ROOT_IMAGE=nvcr.io/nvidia/deepstream:8.0-gc-triton-devel --build-arg PYTHON_VERSION=3.12 .`
- Push Deepstream 8.0: `docker push hiennguyen9874/docker-stacks-foundation:deepstream_8.0-gc-triton-devel`
