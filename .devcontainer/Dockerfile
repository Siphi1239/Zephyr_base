FROM mcr.microsoft.com/devcontainers/cpp
RUN apt-get update

RUN sudo apt-get install -y --no-install-recommends gperf \
    ccache dfu-util device-tree-compiler wget \
    python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
    make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1

#GET ZEPHYR SDK
RUN mkdir /zephyr_toolchain && cd /zephyr_toolchain &&\
    wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.16.8/zephyr-sdk-0.16.8_linux-x86_64.tar.xz && \
    wget -O - https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.16.8/sha256.sum | shasum --check --ignore-missing &&\
    tar xvf zephyr-sdk-0.16.8_linux-x86_64.tar.xz &&\
    cd zephyr-sdk-0.16.8 && \
    ./setup.sh -t xtensa-espressif_esp32_zephyr-elf && \
    ./setup.sh -t xtensa-espressif_esp32s2_zephyr-elf && \
    ./setup.sh -t xtensa-espressif_esp32s3_zephyr-elf && \
    ./setup.sh -t arm-zephyr-eabi && \
    ./setup.sh -c -h &&\
    cd .. && rm zephyr-sdk-0.16.8_linux-x86_64.tar.xz &&\
    export ZEPHYR_TOOLCHAIN_VARIANT=zephyr &&\
    export ZEPHYR_SDK_INSTALL_DIR=/zephyr_toolchain/zephyr-sdk-0.16.8

#INSTALL WEST
RUN pip3 install --break-system-packages west

#FOLDER SETUP
RUN mkdir /project_root && chown vscode:vscode /project_root
