#!/bin/bash

###
# Create QCOW image
###

# $1: file name (eg: hogehoge.qcow2)
# $2: size (eg: 60G)
qemu-img create -f qcow2 -o preallocation=metadata $1 $2
