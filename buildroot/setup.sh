#!/bin/sh
make list-defconfigs
make qemu_x86_64_defconfig
make menuconfig
make linux-menuconfig
make -j4
