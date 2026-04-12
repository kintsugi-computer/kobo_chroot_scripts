OSNAME := $(shell uname -s)
ifeq ($(OSNAME), Darwin)
	# Install gtar using MacPorts on MacOS
    GTAR := gtar
else
    GTAR := tar
endif
VERSION := $(shell git describe --tags)

kobo_chroot_$(VERSION).tgz: bin/mount_chroot.sh bin/run_chroot.sh bin/unmount_chroot.sh
	$(GTAR) --owner=root --group=root -zcf kobo_chroot_$(VERSION).tgz $^
