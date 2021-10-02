# my-barebones-linux
![image](https://user-images.githubusercontent.com/21064622/135717759-275a0bc3-e919-4880-a8a5-32beb64a6e8a.png)

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
