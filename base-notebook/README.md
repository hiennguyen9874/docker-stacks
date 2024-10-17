- CPU + Ubuntu 20.04 + Python3.8: `bash ./build_push.sh ubuntu:focal 3.8 hiennguyen9874 ubuntu20.04-py3.8-cpu-v0.2`

- CUDA11.2 + Ubuntu 20.04 + Python3.9: `bash ./build_push.sh nvidia/cuda:11.2.2-cudnn8-devel-ubuntu20.04 3.9 hiennguyen9874 ubuntu20.04-py3.9-cuda11.2-v0.2`

- CUDA11.3 + Ubuntu 20.04 + Python3.8: `bash ./build_push.sh nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04 3.8 hiennguyen9874 ubuntu20.04-py3.8-cuda11.3-v0.2`

- CUDA11.3 + Ubuntu 20.04 + Python3.9: `bash ./build_push.sh nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04 3.9 hiennguyen9874 ubuntu20.04-py3.9-cuda11.3-v0.2`

- Cuda11.4 + Ubuntu 20.04 + Python3.8: `bash ./build_push.sh nvidia/cuda:11.4.3-cudnn8-devel-ubuntu20.04 3.8 hiennguyen9874 ubuntu20.04-py3.8-cuda11.4-v0.2`

- Cuda11.4 + Ubuntu 18.04 + Python3.8: `bash ./build_push.sh nvidia/cuda:11.4.3-cudnn8-devel-ubuntu18.04 3.8 hiennguyen9874 ubuntu18.04-py3.8-cuda11.4-v0.2`

- Deepstream 6.0.1 + Python3.8: `bash ./build_push.sh hiennguyen9874/deepstream:deepstream_6.0.1-devel 3.8 hiennguyen9874 deepstream_6.0.1`

- Deepstream 6.1.1 + Python3.8: `bash ./build_push.sh hiennguyen9874/deepstream:deepstream_6.1.1-devel 3.8 hiennguyen9874 deepstream_6.1.1`

- TensorRT 21.10 + Python3.8: `bash ./build_push.sh nvcr.io/nvidia/tensorrt:21.10-py3 3.8 hiennguyen9874 tensorrt21.10`

- TensorRT 21.06 + Python3.9: `bash ./build_push.sh nvcr.io/nvidia/tensorrt:21.06-py3 3.9 hiennguyen9874 tensorrt21.06-py3.9`

- Build Deepstream 6.3: `DOCKER_BUILDKIT=1 docker build -t hiennguyen9874/base-notebook:deepstream_6.3-gc-triton-devel --build-arg ROOT_CONTAINER=nvcr.io/nvidia/deepstream:6.3-gc-triton-devel --build-arg PYTHON_VERSION=3.8 --build-arg NB_UID=1001 --build-arg NB_GID=101 .`
- Push Deepstream 6.3: `docker push hiennguyen9874/base-notebook:deepstream_6.3-gc-triton-devel`

- TensorRT 23.03 + Python3.8: `bash ./build_push.sh nvcr.io/nvidia/tensorrt:23.03-py3 3.8 hiennguyen9874 tensorrt23.03`

- TensorRT 23.03 + Python3.9: `bash ./build_push.sh nvcr.io/nvidia/tensorrt:23.03-py3 3.9 hiennguyen9874 tensorrt23.03-py3.9`

- Pytorch 23.02 + Python3.9: `bash ./build_push.sh nvcr.io/nvidia/pytorch:23.02-py3 3.9 hiennguyen9874 pytorch-23.02-py3`
