#!/bin/sh
mkdir /tmp/ex1
sudo mount /home/wataru/buildroot-2020.02.5/output/images/rootfs.ext2 /tmp/ex1
sudo cp ~/snipet/buildroot/inittab /tmp/ex1/etc/
sudo umount /tmp/ex1
