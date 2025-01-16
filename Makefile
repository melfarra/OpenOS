ASM=nasm
QEMU=qemu-system-x86_64

# Output files
BOOTLOADER=boot/bootloader.bin
OS_IMAGE=SimpleOS.img

# Build the bootloader
$(BOOTLOADER): boot/bootloader.asm
	$(ASM) -f bin -o $(BOOTLOADER) $<

# Create disk image
$(OS_IMAGE): $(BOOTLOADER)
	dd if=/dev/zero of=$(OS_IMAGE) bs=512 count=2880
	dd if=$(BOOTLOADER) of=$(OS_IMAGE) conv=notrunc

# Build all
all: $(OS_IMAGE)

# Run in QEMU
run: $(OS_IMAGE)
	$(QEMU) -drive format=raw,file=$(OS_IMAGE)

# Clean build files
clean:
	rm -f $(BOOTLOADER) $(OS_IMAGE)

.PHONY: all run clean 