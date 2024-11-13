#!/bin/bash

# Update package lists
sudo apt-get update

# Install tools and libraries for the picotool needed to flash the Raspberry Pi Pico
sudo apt install -y build-essential \
                    pkg-config \
                    libusb-1.0-0-dev \
                    gcc-arm-none-eabi \
                    libnewlib-arm-none-eabi \
                    libstdc++-arm-none-eabi-newlib


# The PICO_SDK_PATH environment variable is used by the CMakeLists.txt file to locate the Pico SDK
PICO_SDK_PATH="/opt/pico_sdk"
export PICO_SDK_PATH

# Get the current user's ID and group ID
USER_ID=$(id -u)
GROUP_ID=$(id -g)

# Create the Pico SDK directory and set the owner to the current user
sudo rm -rf ${PICO_SDK_PATH} \
&& sudo mkdir -p ${PICO_SDK_PATH} \
&& sudo chown -R ${USER_ID}:${GROUP_ID} ${PICO_SDK_PATH}

# Clone the Pico SDK and picotool repositories, build picotool, and install it
cd /tmp \
&& git clone https://github.com/raspberrypi/pico-sdk.git ${PICO_SDK_PATH} \
&& cd ${PICO_SDK_PATH} \
&& git switch -c v2.0.0 2.0.0 \
&& git submodule update --init \
&& cd /tmp \
&& rm -rf picotool \
&& git clone https://github.com/raspberrypi/picotool.git \
&& cd picotool \
&& git switch -c v2.0.0 2.0.0 \
&& mkdir build \
&& cd build \
&& cmake -GNinja .. \
&& ninja \
&& sudo ninja install \
&& cd /tmp \
&& rm -rf picotool


# Add any other installation commands here
