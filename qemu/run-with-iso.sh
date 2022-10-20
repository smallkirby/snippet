#!/bin/bash

###
# Run QEMU with ISO image
###

qemu-system-x86_64 \
  -enable-kvm \
  -m 9216 \
  -s \
  -smp 1 \
  -nic model=e1000 \
  -virtfs local,path=$HOME/vmshare,mount_tag=testmnt,security_model=none,id=host0 \
  -hda $HOME/Documents/virt-img/test-ubuntu-server-20200923.qcow2
#-k "en-us" \
#-serial mon:stdio \
#  -nographic \
#  -append "console=ttyS0" \
