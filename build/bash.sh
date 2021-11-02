#!/bin/sh
CFLAGS="-g -O0 -DPUSHD_AND_POPD" ./configure --prefix=/home/wataru/bash/build
make -j6
make install
