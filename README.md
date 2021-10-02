# my-barebones-linux
My barebones linux build and testing scripts

Use `make` command when in the `my-barebones-linux-master/` folder to produce Linux Kernel and Initfram.

To test the Linux Kernel and Init binary use this command line:
```
qemu-system-x86_64 -m 2048 -kernel vmlinuz -initrd initramfs
```
To test the Live CD:
```
qemu-system-x86_64 -m 2048 -cdrom barebones.iso -boot d
```
