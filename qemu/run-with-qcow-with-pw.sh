#!/bin/sh
printf "change vnc password\ndummy-hogehoge\n" | \
qemu-system-x86_64 \
  -enable-kvm \
  -m 9216 \
  -s \
  -smp 1 \
  -nic model=e1000 \
  -boot d \
  -hda ~/Documents/virt-img/test-ubuntu-server-20200923.qcow2 \
  -vnc :0,password \
  -monitor stdio
#-k "en-us" \
#-nographic \
#-serial mon:stdio \
#-object tls-creds-x509,id=tls0,dir=/etc/pki/qemu,endpoint=server,verify-peer=no \
#  -vnc :0,password,tls-creds=tls0 \
