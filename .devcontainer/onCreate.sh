#!/bin/bash

west init -l app
west update
west zephyr-export
pip install -r deps/zephyr/scripts/requirements.txt --break-system-packages
west blobs fetch hal_espressif
west completion bash > $HOME/west-completion.bash
echo 'source $HOME/west-completion.bash' >> $HOME/.bashrc
echo "export ZEPHYR_SDK_INSTALL_DIR=/zephyr_toolchain/zephyr-sdk-0.16.8" >> $HOME/.bashrc
history -c