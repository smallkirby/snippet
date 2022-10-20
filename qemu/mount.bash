#!/bin/bash

###
# Mount QCOW image
###

set -eu

MNTPOINT=/tmp/hoge
QCOW=$(realpath "${PWD}"/hoge.qcow2)

sudo modprobe nbd max_part=8
mkdir -p $MNTPOINT
sudo qemu-nbd --connect=/dev/nbd0 "$QCOW"
sudo fdisk -l /dev/nbd0
sudo mount /dev/nbd0 $MNTPOINT