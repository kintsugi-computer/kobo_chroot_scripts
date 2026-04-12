#!/bin/sh

rootfs="/mnt/chroot/rootfs"
koboroot="${rootfs}/mnt/koboroot"

function unmount_directory {
    mnt_pt="${1}"
    mountpoint "${mnt_pt}" && echo "Unmounting ${mnt_pt}" && umount "${mnt_pt}"
}

unmount_directory "${koboroot}/mnt/onboard"
unmount_directory "${koboroot}/var/run"
unmount_directory "${koboroot}/var/log"
unmount_directory "${koboroot}/var/lib"
unmount_directory "${koboroot}/sys"
unmount_directory "${koboroot}/proc"
unmount_directory "${koboroot}/tmp"
unmount_directory "${koboroot}/dev"
unmount_directory "${koboroot}"

unmount_directory "${rootfs}/mnt/onboard"
unmount_directory "${rootfs}/dev/shm"
unmount_directory "${rootfs}/dev/pts"
unmount_directory "${rootfs}/run"
unmount_directory "${rootfs}/sys"
unmount_directory "${rootfs}/proc"
unmount_directory "${rootfs}/tmp"
unmount_directory "${rootfs}/dev"


