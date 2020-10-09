#!/bin/sh
qemu-system-x86_64 \
  -enable-kvm \
  -m 9216 \
  -s \
  -smp 1 \
  -nic model=e1000 \
  -virtfs local,path=/home/wataru/vmshare,mount_tag=testmnt,security_model=none,id=host0 \
  -hda ~/Documents/virt-img/test-ubuntu-server-20200923.qcow2
#-k "en-us" \
#-serial mon:stdio \
#  -nographic \
#  -append "console=ttyS0" \
