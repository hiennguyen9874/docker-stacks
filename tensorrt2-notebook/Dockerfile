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
ARG CUDA_VERSION=11.3.1
ENV TRT_VERSION=8.0.3.4

USER root

RUN v="${TRT_VERSION%.*}-1+cuda${CUDA_VERSION%.*}" &&\
    apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub &&\
    apt-get update &&\
    sudo apt-get install libnvinfer8=${v} libnvonnxparsers8=${v} libnvparsers8=${v} libnvinfer-plugin8=${v} \
    libnvinfer-dev=${v} libnvonnxparsers-dev=${v} libnvparsers-dev=${v} libnvinfer-plugin-dev=${v} \
    python3-libnvinfer=${v} python3-libnvinfer-dev=${v}

USER ${NB_UID}

# Install Python 3 packages
# RUN mamba install --quiet --yes -c anaconda -c conda-forge \
#     'onnx=1.9' \
#     'onnxruntime=1.8' \
#     'Pillow>=8.3' \
#     'pycuda<2021.1' && \
#     mamba clean --all -f -y && \
#     fix-permissions "${CONDA_DIR}" && \
#     fix-permissions "/home/${NB_USER}"

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir setuptools>=41.0.0 && \
    pip3 install --no-cache-dir 'onnx==1.8.1' \
    'onnxruntime==1.8.0'  \
    'Pillow==8.3.2' \
    'pycuda<2020.1' \
    'numpy' \
    'pytest' \
    # 'nvidia-tensorrt==8.0.3.4' \
    # 'nvidia-pyindex' \
    --extra-index-url https://pypi.ngc.nvidia.com

RUN pip3 install --no-cache-dir 'torch==1.10.1+cu113' \
    'torchvision==0.11.2+cu113' \
    'torchaudio==0.10.1+cu113' \
    -f https://download.pytorch.org/whl/cu113/torch_stable.html

RUN pip3 install --no-cache-dir torch-tensorrt -f https://github.com/NVIDIA/Torch-TensorRT/releases

USER root

# Install Cmake
RUN cd /tmp && \
    wget https://github.com/Kitware/CMake/releases/download/v3.14.4/cmake-3.14.4-Linux-x86_64.sh && \
    chmod +x cmake-3.14.4-Linux-x86_64.sh && \
    ./cmake-3.14.4-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir --skip-license && \
    rm ./cmake-3.14.4-Linux-x86_64.sh

# Download NGC client
RUN cd /usr/local/bin && wget https://ngc.nvidia.com/downloads/ngccli_cat_linux.zip && unzip ngccli_cat_linux.zip && chmod u+x ngc && rm ngccli_cat_linux.zip ngc.md5 && echo "no-apikey\nascii\n" | ngc config set

# Set environment and working directory
ENV TRT_LIBPATH /usr/lib/x86_64-linux-gnu
ENV TRT_OSSPATH /workspace/TensorRT
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${TRT_OSSPATH}/build/out:${TRT_LIBPATH}"

# Jupyterlab not load LD_LIBRARY_PATH, hacked from https://github.com/jupyterhub/jupyterhub/issues/2630#issuecomment-839826001
RUN echo LD_LIBRARY_PATH="${LD_LIBRARY_PATH}" >> /etc/environment

WORKDIR /workspace

RUN fix-permissions "/home/${NB_USER}"

USER ${NB_UID}
