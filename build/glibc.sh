mkdir glibc-build # same-level directory of glibc src tree
cd ./glibc-build
../glibc/configure --prefix=$(pwd) CFLAGS="-O2 -g" # glibc cannot be compiled wihtout optimization
make -j6
make install
