#!/bin/sh
echo "Should be execute in root of buildroot"
echo "kernel config should support 9p_virtio"
/home/wataru/qemu/bin/debug/native/x86_64-softmmu/qemu-system-x86_64 \
  -kernel $HOME/buildroot-2020.02.5/output/images/bzImage \
  -drive file=$HOME/buildroot-2020.02.5/output/images/rootfs.ext2,if=virtio,format=raw \
  -append "root=/dev/vda console=ttyS0 nokaslr" \
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

## To mount shared folder
# mkdir /tmp/shared
# mount -t 9p -o trans=virtio testmnt /tmp/shared/ -oversion=9p2000.L,posixacl,msize=104857600,cache=loose
