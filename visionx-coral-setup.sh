#!/bin/sh
set -e
VERSION=v1.0
SERVER=https://github.com/embedig/visionx
opkg update
opkg install git
opkg install ${SERVER}/releases/download/${VERSION}/libcxx_6.0.1.ipk
opkg install ${SERVER}/releases/download/${VERSION}/python3-pil_6.1.ipk
opkg install python3
wget ${SERVER}/raw/master/get-pip.py
python3 get-pip.py

opkg install ${SERVER}/releases/download/${VERSION}/libedgetpu1-std_13.0.ipk
opkg install ${SERVER}/releases/download/${VERSION}/edgetpu-compiler_13.0.ipk
opkg install ${SERVER}/releases/download/${VERSION}/edgetpu_13.0.ipk
opkg install ${SERVER}/releases/download/${VERSION}/libedgetpu-dev_13.0.ipk
opkg install ${SERVER}/releases/download/${VERSION}/python3-edgetpu_13.0.ipk
opkg install ${SERVER}/releases/download/${VERSION}/edgetpu-examples_13.0.ipk

pip3 install ${SERVER}/releases/download/${VERSION}/tflite_runtime-2.1.0.post1-cp35-cp35m-linux_x86_64.whl
pip3 install ${SERVER}/releases/download/${VERSION}/edgetpu-2.13.0-py3-none-any.whl
wget ${SERVER}/releases/download/${VERSION}/edgetpu_runtime_20200128.zip -O edgetpu_runtime.zip
unzip edgetpu_runtime.zip
./edgetpu_runtime/install.sh
python3 -c "import edgetpu; print(edgetpu.__version__)"
