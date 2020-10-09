# $1: file name (hogehoge.qcow2)
# $2: size (60G)
qemu-img create -f qcow2 -o preallocation=metadata $1 $2
