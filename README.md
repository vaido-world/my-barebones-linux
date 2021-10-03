# my-barebones-linux
![image](https://user-images.githubusercontent.com/21064622/135717759-275a0bc3-e919-4880-a8a5-32beb64a6e8a.png)  
Tested on a physical x86-64 computer and QEMU emulator.
Originally by: https://suchprogramming.com/barebones-linux-system/
___
This fork does not depend on BusyBox and BusyBox Bash shell.

My barebones linux build and testing scripts
> **Note**  
> It seems that Host system have errors when compiling Linux Kernel of version other than one existing on the Host system
> Always use `uname -r` to get the host kernel version and change KERNEL_VERSION in the Makefile to the one that your host system uses to avoid errors.

1. Boot into Ubuntu 19.04
2. Use `make` command when in the `my-barebones-linux-master/` folder to produce Linux Kernel and Initfram.
3. To test the Linux Kernel and Init binary use this command line: `make runvm` or `make runiso`


Visit Wiki for something useful. [Wiki on GitHub](https://github.com/vaido-world/my-barebones-linux/wiki)


## Requirements [Ubuntu 21.04] Live CD
Change the KERNEL_VERSION variable inside the `Makefile ` to `KERNEL_VERSION=5.11.1`

Then install these dependencies:
```
sudo apt install make       --yes
sudo apt install gcc        --yes
sudo apt install flex       --yes
sudo apt install bison      --yes
sudo apt install libssl-dev --yes
sudo apt install libelf-dev --yes

# required by grub-mkrescue 
echo | sudo add-apt-repository universe
sudo apt-get update
sudo apt install xorriso --yes
sudo apt install mtools  --yes


# Optional dependency
sudo apt install qemu-system-x86 --yes

```
