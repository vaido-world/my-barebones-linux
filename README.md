# my-barebones-linux
![image](https://user-images.githubusercontent.com/21064622/135717759-275a0bc3-e919-4880-a8a5-32beb64a6e8a.png)

Originally by: https://suchprogramming.com/barebones-linux-system/

This fork does not depend on BusyBox and BusyBox Bash shell.

My barebones linux build and testing scripts

1. Boot into Ubuntu 19.04
2. Use `make` command when in the `my-barebones-linux-master/` folder to produce Linux Kernel and Initfram.
3. To test the Linux Kernel and Init binary use this command line: `make runvm` or `make runiso`
```
qemu-system-x86_64 -m 2048 -kernel vmlinuz -initrd initramfs
```
To test the Live CD:
```
qemu-system-x86_64 -m 2048 -cdrom barebones.iso -boot d
```

Visit Wiki for something useful. [Wiki on GitHub](https://github.com/vaido-world/my-barebones-linux/wiki)


## Requirements [Ubuntu 21.04] Live CD
```
sudo apt install make
sudo apt install gcc
sudo apt install flex
sudo apt install bison
sudo apt install libssl-dev 
sudo apt install libelf-dev

```
