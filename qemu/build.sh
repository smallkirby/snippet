#!/bin/sh
mkdir -p ./bin/debug/native
cd ./bin/debug/native
../../../configure --enable-debug --target-list=x86_64-softmmu --prefix=/home/wataru/qemu/bin --disable-werror --enable-debug-info --enable-debug-tcg --enable-kvm
# --disable-pie はつけるとエラーになるからいらなそう
make -j8
## test
# cd ../../../
# ./bin/debug/native/x86_64-softmmu/qemu-system-x86_64 -L pc-bios
