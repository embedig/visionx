#!/bin/sh
#set -e
VERSION=v1.0
SERVER=https://github.com/embedig/visionx
opkg update
mkdir visionx-tmp
cd visionx-tmp
wget ${SERVER}/releases/download/${VERSION}/visionx-coral.zip
unzip visionx-coral.zip
opkg install libcxx_6.0.1.ipk
opkg install python3-pil_6.1.ipk
opkg install libedgetpu1-std_13.0.ipk
opkg install edgetpu-compiler_13.0.ipk
opkg install edgetpu_13.0.ipk
opkg install libedgetpu-dev_13.0.ipk
opkg install python3-edgetpu_13.0.ipk
opkg install edgetpu-examples_13.0.ipk

opkg install python3
python3 get-pip.py
pip3 install tflite_runtime-2.1.0.post1-cp35-cp35m-linux_x86_64.whl
pip3 install edgetpu-2.13.0-py3-none-any.whl

unzip edgetpu_runtime_20200128.zip
./edgetpu_runtime/install.sh
python3 -c "import edgetpu; print(edgetpu.__version__)"
cd ..
rm -rf visionx-tmp

