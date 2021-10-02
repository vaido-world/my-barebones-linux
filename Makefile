KERNEL_VERSION=5.0.1
KERNEL_DIRECTORY=linux-$(KERNEL_VERSION)
KERNEL_ARCHIVE=$(KERNEL_DIRECTORY).tar.xz
KERNEL_URL=https://cdn.kernel.org/pub/linux/kernel/v5.x/$(KERNEL_ARCHIVE)

# These are the default targets when using make. 
# First the vmlinuz of this makefile then the others.
# at the end of this makefile, there are unused targets for launching Linux Kernel using Qemu Emulator.
all: vmlinuz initramfs barebones.iso


# Kernel build targets
vmlinuz: $(KERNEL_DIRECTORY)
	cd "$(KERNEL_DIRECTORY)" && make "defconfig" && make --jobs=`nproc`
	cp "$(KERNEL_DIRECTORY)/arch/x86_64/boot/bzImage" "vmlinuz"

$(KERNEL_DIRECTORY):
	wget "$(KERNEL_URL)"
	tar xf "$(KERNEL_ARCHIVE)"


# Initramfs build targets
initramfs: initfs initfs/init
	cd "./initfs/" && find "." | cpio --create --format="newc" > "../initramfs"

initfs/init: initfs init-source-code.c
	gcc -static "./init-source-code.c" -o "./initfs/init"

	
initfs:
	mkdir -p "./initfs/bin" "./initfs/proc" "./initfs/dev" "./initfs/sys"

barebones.iso: vmlinuz initramfs
	mkdir -p "./iso/boot/grub"
	cp "./vmlinuz" "./initramfs" "./iso/boot/."
	grub-mkrescue -o "./barebones.iso" "./iso"

# Utility targets
runvm: vmlinuz initramfs
	qemu-system-x86_64 -m "2048" -kernel "./vmlinuz" -initrd "./initramfs"

runiso: barebones.iso
	qemu-system-x86_64 -m "2048" -cdrom "./barebones.iso" -boot d

clean:
	rm -rf "./vmlinuz" "./initramfs" $(KERNEL_DIRECTORY) $(KERNEL_ARCHIVE) \
	"./iso/boot/vmlinuz" \
	"./iso/boot/initramfs" "./barebones.iso"
