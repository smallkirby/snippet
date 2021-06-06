#!/bin/bash

sudo strace -e trace=open,openat $1
