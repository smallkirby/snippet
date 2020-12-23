#!/bin/sh;
make clean
./configure --prefix=/home/wataru/ruby/build optflags="-g -O0"
make
make install
notify-send --urgency=low "Ruby Build End"
