OSNAME := $(shell uname -s)
ifeq ($(OSNAME), Darwin)
   GTAR := gtar
else
   GTAR := tar
endif
VERSION := $(shell git describe --tags)

kobo_chroot_$(VERSION).tgz: mount_chroot.sh run_chroot.sh unmount_chroot.sh
	$(GTAR) --owner=root --group=root -zcf kobo_chroot_$(VERSION).tgz $^
