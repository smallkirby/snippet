#!/bin/sh
qemu-system-x86_64 \
  -kernel output/images/bzImage \
  -hda output/images/rootfs.ext2 \
  -append "root=/dev/hda console=ttyS1 nokaslr"
