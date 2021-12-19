# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/datascience-notebook
FROM $BASE_CONTAINER

USER root

# Install requried libraries
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    wget \
    zlib1g-dev \
    git \
    pkg-config \
    sudo \
    ssh \
    libssl-dev \
    pbzip2 \
    pv \
    bzip2 \
    unzip \
    devscripts \
    lintian \
    fakeroot \
    dh-make \
    build-essential

USER ${NB_UID}

# Install TensorRT
ENV CUDA_VERSION=11.3.1
ENV CUDNN="cudnn8.2"
ENV PYTHON_VERSION=cp38
ENV TRT_VERSION=8.0.3.4
ENV ARCH=x86_64
ENV CUDA="cuda-11.3"

WORKDIR /workspace

COPY TensorRT-${TRT_VERSION}.Linux.${ARCH}-gnu.${CUDA}.${CUDNN}.tar.gz .

RUN tar xzvf TensorRT-${TRT_VERSION}.Linux.${ARCH}-gnu.${CUDA}.${CUDNN}.tar.gz && rm TensorRT-${TRT_VERSION}.Linux.${ARCH}-gnu.${CUDA}.${CUDNN}.tar.gz

ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/workspace/TensorRT-${TRT_VERSION}/lib"

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir /workspace/TensorRT-${TRT_VERSION}/python/tensorrt-${TRT_VERSION}-${PYTHON_VERSION}-none-linux_${ARCH}.whl && \
    pip3 install --no-cache-dir /workspace/TensorRT-${TRT_VERSION}/uff/*.whl && \
    pip3 install --no-cache-dir /workspace/TensorRT-${TRT_VERSION}/graphsurgeon/*.whl && \

