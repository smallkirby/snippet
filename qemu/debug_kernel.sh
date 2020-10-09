#!/bin/sh
if [ -f "./hogehogehoge_ramdisk.img" ];
then
  echo "Using existing hogehogehoge_ramdisk.img"
else
  echo "Now, creating rootfs image..."
  mkinitramfs -o hogehogehoge_ramdisk.img
fi
echo "Now, booting kernel..."
qemu-system-x86_64 \
  -kernel ./arch/x86_64/boot/bzImage \
  -nographic \
  -append "console=ttyS0 nokaslr pti=on" \
  -initrd ./hogehogehoge_ramdisk.img \
  -m 512 \
  -s \
  -cpu host \
  -smp 1 \
  --enable-kvm

# press Ctr-A -> c -> q to terminate qemu.

# echo "add-auto-load-safe-path /home/wataru/linux-stable/scripts/gdb/vmlinux-gdb.py" >> ~/.gdbinit
# gdb # you can't use pwndbg.
# file ./vmlinux
# hbreak *0x100022
# c
# i r
# ni
# i r
