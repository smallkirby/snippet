#!/bin/sh 
mkdir ./build 
CFLAGS="-O0 -g" ./configure --prefix=/home/wataru/git/build all doc info
make
make install # no need sudo
