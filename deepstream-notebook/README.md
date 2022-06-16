## Build Deepstream container

- `bash ./build_push.sh hiennguyen9874 deepstream_6.0.1-devel nvcr.io/nvidia/deepstream:6.0.1-devel ubuntu1804 x86_64`

## Disable conda

- Add into .bashrc:

```
export PATH=/opt/tensorrt/bin:/usr/local/mpi/bin:/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/ucx/bin:${PATH}
```

- comment out line in .bashrc: `eval "$(command conda shell.bash hook 2> /dev/null)"`

<!-- ## Install python

### Install python3.8

- `sudo apt install python-dev python3 python3-pip python3.6-dev python3.8-dev`

### Set python3.8 as default

- `cd /usr/bin`
- `sudo unlink python3`
- `sudo ln -sv /usr/bin/python3.8 python3`
- `python3 --version` -->

## Install Deepstream python bindings

Follow guide from [github.com/NVIDIA-AI-IOT/deepstream_python_apps](https://github.com/NVIDIA-AI-IOT/deepstream_python_apps/tree/master/bindings)

- `sudo apt install libgirepository1.0-dev`
- `cmake .. -DPYTHON_MAJOR_VERSION=3 -DPYTHON_MINOR_VERSION=6 -DPIP_PLATFORM=linux_x86_64 -DDS_PATH=/opt/nvidia/deepstream/deepstream`
- `make`
- `python3 -m pip install *.whl`

<!--
# Deepstream 6.0.0

- Download file `deepstream-6.0_6.0.0-1_amd64.deb` from [developer.nvidia.com/deepstream-sdk](https://developer.nvidia.com/deepstream-sdk)
- GPU: `bash ./build_push.sh hiennguyen9874 ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-v0.2 ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-deepstream6.0-v0.2 deepstream-6.0_6.0.0-1_amd64.deb`

# Deepstream 6.0.1

- Download file `deepstream-6.0_6.0.1-1_amd64.deb` from [developer.nvidia.com/deepstream-sdk](https://developer.nvidia.com/deepstream-sdk)
- GPU: `bash ./build_push.sh hiennguyen9874 ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-v0.2 ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-deepstream6.0.1-v0.2 deepstream-6.0_6.0.1-1_amd64.deb`

## Install deepstream python

- `sudo apt install -y git cmake g++ build-essential libglib2.0-dev libglib2.0-dev-bin libtool m4 autoconf automake`
- `sudo apt-get install libgtk-3-dev`
- `sudo apt-get install libglib2.0-dev libjson-glib-dev uuid-dev`
- `mamba install --quiet --yes -c conda-forge gst-python pycairo PyGObject pybind11`
- `mamba clean --all -f -y`

- `git submodule update --init`
- `sudo apt-get install -y apt-transport-https ca-certificates -y`
- `sudo update-ca-certificates`

- `mkdir build`
- `cd build`
- Change

  ```
  /usr/include/python${PYTHON_VERSION}
  ```

  to

  ```
  /opt/conda/include
  /opt/conda/include/python${PYTHON_VERSION}
  ```

  Change

  ```
  target_link_libraries(pyds pthread dl ${PYTHON_LIB} gstreamer-1.0 glib-2.0)
  ```

  to

  ```
  target_link_libraries(pyds pthread dl ${PYTHON_LIB} gstreamer-1.0 /usr/lib/x86_64-linux-gnu/libglib-2.0.so)
  ```

  Change

  ```
  set(PYTHON_LIB python${PYTHON_VERSION})
  if(${PYTHON_MINOR_VERSION} EQUAL 6)
          set(PYTHON_LIB python${PYTHON_VERSION}m)
  endif()
  ```

  to

  ```
  set(PYTHON_LIB /opt/conda/lib/libpython${PYTHON_VERSION}.so)
  if(${PYTHON_MINOR_VERSION} EQUAL 6)
    set(PYTHON_LIB /opt/conda/lib/libpython${PYTHON_VERSION}m.so)
  endif()
  ```

- `cmake .. -DPYTHON_MAJOR_VERSION=3 -DPYTHON_MINOR_VERSION=8 -DPIP_PLATFORM=linux_x86_64 -DDS_PATH=/opt/nvidia/deepstream/deepstream`
- `make`
- `python3 -m pip install *.whl` -->
