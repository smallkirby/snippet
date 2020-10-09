#!/bin/sh
echo "Should be execute in root of buildroot"
echo "kernel config should support 9p_virtio"
/home/wataru/qemu/bin/debug/native/x86_64-softmmu/qemu-system-x86_64 \
  -kernel output/images/bzImage \
  -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
  -append "root=/dev/vda console=ttyS0,115200 nokaslr kgdboc=ttyS0,115200" \
  -serial mon:stdio \
  -vnc :1 \
  -smp 1 \
  -s \
  -nic model=ne2k_pci, \
  -virtfs local,path=/home/wataru/vmshare,mount_tag=testmnt,security_model=none,id=host0 \
  --enable-kvm \
  -m 9216 \
  -nographic

## To login automatically as root
# cd ./output/images/
# cp ./rootfs.ext2 ./rootfs.ext2.bk
# mkdir /tmp/tmpmnt
# sudo mount ./rootfs.ext2 /tmp/tmpmnt
# sudo vim /tmp/tmpmnt/etc/inittab
#   change below:
#       console::respawn:/sbin/getty -L console 0 vt100
#   as below:
#       console::respawn:-/bin/sh
# sudo umount /tmp/tmpmnt
