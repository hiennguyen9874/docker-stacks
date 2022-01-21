# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/tensorrt2-notebook
FROM $BASE_CONTAINER

USER root

# Install dependenciesRUN v="${TRT_VERSION%.*}-1+cuda${CUDA_VERSION%.*}" &&\
RUN v="${TRT_VERSION%.*}-1+cuda${CUDA_VERSION%.*}" &&\
      apt-get update && \
      DEBIAN_FRONTEND=noninteractive      apt-get install -y --no-install-recommends \
      linux-libc-dev \
      # libglew2.0 libssl1.0.0 libjpeg8 libjson-glib-1.0-0 \
      libjpeg8 libjson-glib-1.0-0 \
      gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-tools gstreamer1.0-libav \
      gstreamer1.0-alsa \
      # libcurl3 \
      libuuid1 \
      libjansson4 \
      libjansson-dev \
      librabbitmq4 \
      libgles2-mesa \
      libgstrtspserver-1.0-0 \
      libv4l-dev \
      gdb bash-completion libboost-dev \
      uuid-dev libgstrtspserver-1.0-0 libgstrtspserver-1.0-0-dbg libgstrtspserver-1.0-dev \
      libgstreamer1.0-dev \
      libgstreamer-plugins-base1.0-dev \
      libglew-dev \
      libopencv-dev \
      freeglut3-dev \
      libjpeg-dev \
      libcurl4-gnutls-dev \
      libjson-glib-dev \
      libboost-dev \
      librabbitmq-dev \
      libgles2-mesa-dev libgtk-3-dev libgdk3.0-cil-dev \
      libnvinfer8=${v} \
      libnvinfer-dev=${v} \
      libnvparsers8=${v} \
      libnvparsers-dev=${v} \
      libnvonnxparsers8=${v} \
      libnvonnxparsers-dev=${v} \
      libnvinfer-plugin8=${v} \
      libnvinfer-plugin-dev=${v} \
      # python-libnvinfer=${v} \
      python3-libnvinfer=${v} \
      # python-libnvinfer-dev=${v} \
      python3-libnvinfer-dev=${v} && \
      rm -rf /var/lib/apt/lists/* && \
      apt autoremove

WORKDIR /workspace

COPY deepstream-6.0_6.0.0-1_amd64.deb .

RUN apt-get update && \
      DEBIAN_FRONTEND=noninteractive  apt-get install -y --no-install-recommends \
      /workspace/deepstream-6.0_6.0.0-1_amd64.deb

WORKDIR /opt/nvidia/deepstream/deepstream

RUN ln -s /usr/lib/x86_64-linux-gnu/libnvcuvid.so.1 /usr/lib/x86_64-linux-gnu/libnvcuvid.so
RUN ln -s /usr/lib/x86_64-linux-gnu/libnvidia-encode.so.1 /usr/lib/x86_64-linux-gnu/libnvidia-encode.so

USER ${NB_UID}
