#!/bin/sh
./configure --prefix=$(pwd)/build CPPFLAGS=-DDEBUG CFLAGS="-g -O0"
