mkdir /tmp/shared/
mount -t 9p -o trans=virtio testmnt /tmp/shared/ -oversion=9p2000.L,posixacl,cache=loose
cd /tmp/shared
