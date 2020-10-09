#!/bin/sh
qemu-system-x86_64 \
  -enable-kvm \
  -m 9216 \
  -s \
  -smp 1 \
  -nic model=e1000 \
  -boot d \
  -hda ~/Documents/virt-img/test-ubuntu-server-20200923.qcow2
#-k "en-us" \
#-nographic \
#-serial mon:stdio \
