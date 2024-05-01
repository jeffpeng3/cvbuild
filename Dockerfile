from quay.io/pypa/manylinux_2_28_aarch64:latest as base

# Install dependencies
RUN pwd

RUN dnf install ninja-build gstreamer1* -y

RUN git clone --depth 1 --recurse-submodules --shallow-submodules https://github.com/opencv/opencv-python.git

ARG ENABLE_CONTRIB=1
ARG ENABLE_HEADLESS=1
ARG CMAKE_ARGS="-DWITH_GSTREAMER=ON"

WORKDIR "/opencv-python"
RUN /opt/python/cp38-cp38/bin/python -m pip wheel . --verbose

CMD ["/bin/bash"]
