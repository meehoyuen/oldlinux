#!/bin/bash

echo "sudo apt-get install qemu-kvm qemu-utils"

if [ ! -e bootdisk ]; then
  gunzip bootdisk.gz basedsk1.gz basedsk2.gz
fi

if [ ! -e debian.raw ];then
  qemu-img create -f raw debian.raw 50M
fi

qemu-system-i386 -M pc -monitor stdio -boot order=ac -drive file=bootdisk,if=floppy,format=raw -drive file=basedsk1,if=floppy,format=raw -drive file=debian.raw,if=ide,format=raw -serial msmouse -vga std
