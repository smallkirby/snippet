#!/bin/sh
echo "Should be execute in root of buildroot"
echo "kernel config should support 9p_virtio"
$1 \
  -M pc \
  -kernel output/images/bzImage \
  -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
  -serial mon:stdio \
  -vnc :1 \
  -append "root=/dev/vda console=ttyS0 nokaslr" \
  -smp 1 \
  -s \
  -nic model=ne2k_pci, \
  -virtfs local,path=/home/wataru/vmshare,mount_tag=testmnt,security_model=none,id=host0 \
  --enable-kvm \
  -m 9216 \
  -nographic

#  -append "root=/dev/vda console=ttyS0 nokaslr" \
#  -S \ # なんかこれつけたままだとattachしてSEGVになるのなんで?

# args
#   -M pc -kernel /home/wataru/buildroot-2020.02.5/output/images/bzImage -drive file=/home/wataru/buildroot-2020.02.5/output/images/rootfs.ext2,if=virtio,format=raw -serial mon:stdio -vnc :1 -append "root=/dev/vda console=ttyS0 nokaslr" -smp 1 -s -nic model=ne2k_pci, -virtfs local,path=/home/wataru/vmshare,mount_tag=testmnt,security_model=none,id=host0 --enable-kvm -m 9216 -nographic 
