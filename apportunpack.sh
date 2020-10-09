#!/bin/sh
SOURCE_CRASH_FILE=$1
DEST_UNPACK_DIR=$2

apport-unpack $SOURCE_CRASH_FILE $DEST_UNPACK_DIR
cd $DEST_UNPACK_DIR
gdb `cat ExecutablePath` CoreDump
