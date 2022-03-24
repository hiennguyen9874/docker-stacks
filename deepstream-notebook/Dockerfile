# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/tensorrt-notebook
FROM $BASE_CONTAINER

USER root

# Install Dependencies
RUN v="${TRT_VERSION%.*}-1+cuda${CUDA:5:8}" && \
      DEBIAN_FRONTEND=noninteractive apt-get update && \
      apt-get install -y --no-install-recommends \
      gstreamer1.0-plugins-good \
      gstreamer1.0-plugins-bad \
      gstreamer1.0-plugins-ugly \
      gstreamer1.0-tools \
      gstreamer1.0-libav \
      gstreamer1.0-alsa \
      libgstreamer1.0-0 \
      libgstreamer1.0-dev \
      libgstreamer-plugins-base1.0-dev \
      libssl1.1 \
      gstreamer1.0-rtsp \
      libgstrtspserver-1.0-0 \
      libgstrtspserver-1.0-0-dbg \
      libgstrtspserver-1.0-dev \
      libjansson4  \
      libjansson-dev  \
      librabbitmq4 \
      librabbitmq-dev \
      libuuid1 \
      libjson-glib-1.0 \
      libnvinfer8=${v} \
      libnvinfer-dev=${v} \
      libnvparsers8=${v} \
      libnvparsers-dev=${v} \
      libnvonnxparsers8=${v} \
      libnvonnxparsers-dev=${v} \
      libnvinfer-plugin8=${v} \
      libnvinfer-plugin-dev=${v} \
      libglib2.0 \
      libglib2.0-dev \
      librdkafka1=0.11.3-1build1

WORKDIR /workspace

ARG DEEPSTREAM_DEB_FILE=deepstream-6.0_6.0.0-1_amd64.deb

COPY $DEEPSTREAM_DEB_FILE .

RUN apt-get update && \
      DEBIAN_FRONTEND=noninteractive  apt-get install -y --no-install-recommends \
      /workspace/$DEEPSTREAM_DEB_FILE

RUN rm /workspace/$DEEPSTREAM_DEB_FILE

WORKDIR /opt/nvidia/deepstream/deepstream

RUN ln -s /usr/lib/x86_64-linux-gnu/libnvcuvid.so.1 /usr/lib/x86_64-linux-gnu/libnvcuvid.so
RUN ln -s /usr/lib/x86_64-linux-gnu/libnvidia-encode.so.1 /usr/lib/x86_64-linux-gnu/libnvidia-encode.so
RUN /opt/nvidia/deepstream/deepstream-6.0/install.sh
RUN ldconfig

# https://forums.developer.nvidia.com/t/customised-plugins-in-deepstream-4-0/110282/2
ENV GST_PLUGIN_PATH=${GST_PLUGIN_PATH}:/usr/lib/x86_64-linux-gnu/gstreamer-1.0

WORKDIR /workspace

RUN fix-permissions "/home/${NB_USER}"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
      apt-get install -y --no-install-recommends \
      libgirepository1.0-dev \
      gcc \
      libcairo2-dev \
      pkg-config \
      python3-dev \
      gir1.2-gtk-3.0 \
      gobject-introspection \
      gir1.2-gst-rtsp-server-1.0 \
      libopencv-dev

USER ${NB_UID}

WORKDIR /opt/nvidia/deepstream/deepstream/sources/
RUN git clone https://github.com/NVIDIA-AI-IOT/deepstream_python_apps

RUN cd deepstream_python_apps/bindings/

RUN git submodule update --init

# Install Python 3 packages
# RUN mamba install --quiet --yes \
#       'gst-python' \
#       'pycairo' \
#       'PyGObject' && \
#       mamba clean --all -f -y && \
#       fix-permissions "${CONDA_DIR}" && \
#       fix-permissions "/home/${NB_USER}"

RUN cd 3rdparty/gst-python/
RUN ./autogen.sh
RUN make
RUN make install

RUN mkdir build && cd build
RUN cmake ..  -DPYTHON_MAJOR_VERSION=3 -DPYTHON_MINOR_VERSION=8 -DPIP_PLATFORM=linux_x86_64 -DDS_PATH=/opt/nvidia/deepstream/deepstream
RUN make

# ADD pyds-1.1.0-py3-none-linux_x86_64.whl .
RUN pip3 install --no-cache-dir ./*.whl

USER root

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/conda/lib

# Jupyterlab not load LD_LIBRARY_PATH, hacked from https://github.com/jupyterhub/jupyterhub/issues/2630#issuecomment-839826001
RUN echo LD_LIBRARY_PATH="${LD_LIBRARY_PATH}" >> /etc/environment

USER ${NB_UID}
