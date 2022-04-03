# Deepstream 6.0.0

- Download file `deepstream-6.0_6.0.0-1_amd64.deb` from [developer.nvidia.com/deepstream-sdk](https://developer.nvidia.com/deepstream-sdk)
- GPU: `bash ./build_push.sh hiennguyen9874 ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-v0.2 ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-deepstream6.0-v0.2 deepstream-6.0_6.0.0-1_amd64.deb`

# Deepstream 6.0.1

- Download file `deepstream-6.0_6.0.1-1_amd64.deb` from [developer.nvidia.com/deepstream-sdk](https://developer.nvidia.com/deepstream-sdk)
- GPU: `bash ./build_push.sh hiennguyen9874 ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-v0.2 ubuntu18.04-py3.8-cuda11.4-tensorrt8.0.1-deepstream6.0.1-v0.2 deepstream-6.0_6.0.1-1_amd64.deb`

## Install deepstream python

- `sudo apt install -y git cmake g++ build-essential libglib2.0-dev libglib2.0-dev-bin libtool m4 autoconf automake`
- `mamba install --quiet --yes gst-python pycairo PyGObject`
- `mamba clean --all -f -y`

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
- `python3 -m pip3 install *.whl`
