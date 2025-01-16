# SimpleOS Development Project

A learning-focused operating system development project. This project aims to create a simple operating system from scratch while learning core OS concepts.

## Learning Objectives

- Understanding computer architecture and boot process
- Memory management and virtual memory
- Process scheduling and management
- File systems and I/O operations
- Interrupt handling and device drivers
- System calls implementation

## Prerequisites

- QEMU emulator
- NASM assembler
- GCC cross-compiler
- Make build system

## Project Structure

```
.
├── boot/           # Bootloader code
├── kernel/         # Kernel source code
├── drivers/        # Device drivers
├── include/        # Header files
└── tools/          # Build tools and scripts
```

## Building and Running

(Instructions will be added as we implement each component)

## Development Phases

1. **Phase 1: Bootloader**
   - Basic bootloader implementation
   - Real mode to protected mode transition
   - Basic screen output

2. **Phase 2: Kernel Basics**
   - GDT (Global Descriptor Table) setup
   - IDT (Interrupt Descriptor Table) setup
   - Basic interrupt handling
   - Memory segmentation

3. **Phase 3: Memory Management**
   - Physical memory manager
   - Virtual memory setup
   - Paging implementation
   - Memory allocation

4. **Phase 4: Process Management**
   - Process scheduling
   - Task switching
   - System calls
   - Basic shell implementation

## Resources

- [OSDev Wiki](https://wiki.osdev.org/)
- [Writing an OS in Rust](https://os.phil-opp.com/)
- [Little OS Book](https://littleosbook.github.io/)
- [xv6 Operating System](https://pdos.csail.mit.edu/6.828/2019/xv6.html)

## Contributing

This is an educational project. Feel free to fork and experiment! 