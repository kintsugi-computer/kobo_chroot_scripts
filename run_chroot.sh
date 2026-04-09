#!/bin/sh

rootfs="/mnt/chroot/rootfs"

if [ ! -e "${rootfs}" ]
then
  echo "Rootfs is not present at ${rootfs}"
  exit 1
fi

chroot "${rootfs}" "${@}"
