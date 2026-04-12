#!/bin/sh

rootfs="/mnt/chroot/rootfs"
koboroot="/mnt/chroot/rootfs/mnt/koboroot"

if [ ! -e "${rootfs}" ]
then
  echo "Rootfs is not present at ${rootfs}"
  exit 1
fi

mkdir -p "${rootfs}/dev"
mkdir -p "${rootfs}/tmp"
mkdir -p "${rootfs}/proc"
mkdir -p "${rootfs}/sys"
mkdir -p "${rootfs}/run"

mkdir -p "${rootfs}/mnt/onboard"
mkdir -p "${rootfs}/mnt/koboroot"

mount -v --bind /dev "${rootfs}/dev"
mkdir -p "${rootfs}/dev/shm"
mkdir -p "${rootfs}/dev/pts"

mount -v --bind /tmp  "${rootfs}/tmp"
mount -vt proc proc  "${rootfs}/proc"
mount -vt sysfs sysfs  "${rootfs}/sys"
mount -vt tmpfs tmpfs  "${rootfs}/run"
mount -vt tmpfs tmpfs  "${rootfs}/dev/shm"
mount -t devpts devpts "${rootfs}/dev/pts"
mount -v --bind /mnt/onboard "${rootfs}/mnt/onboard"

# inception...
mount -v --bind / "${koboroot}"
mount -v --bind /dev "${koboroot}/dev"
mount -v --bind /tmp "${koboroot}/tmp"
mount -v --bind /proc "${koboroot}/proc"
mount -v --bind /sys "${koboroot}/sys"
mount -v --bind /var/lib "${koboroot}/var/lib"
mount -v --bind /var/log "${koboroot}/var/log"
mount -v --bind /var/run "${koboroot}/var/run"
mount -v --bind /mnt/onboard "${koboroot}/mnt/onboard"

if [ ! -e ${rootfs}/etc/resolv.conf ]; then
    ln -s /mnt/koboroot/etc/resolv.conf ${rootfs}/etc/resolv.conf
fi

