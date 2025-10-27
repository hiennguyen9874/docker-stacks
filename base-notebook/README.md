# Docker Base Notebook

## Deepstream 8.0

- Build Deepstream 8.0: `DOCKER_BUILDKIT=1 docker build -t hiennguyen9874/base-notebook:deepstream_8.0-gc-triton-devel --build-arg BASE_IMAGE=hiennguyen9874/docker-stacks-foundation:deepstream_8.0-gc-triton-devel .`
- Push Deepstream 8.0: `docker push hiennguyen9874/base-notebook:deepstream_8.0-gc-triton-devel`
