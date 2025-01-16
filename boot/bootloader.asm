;----------------------------------------
; SimpleOS Bootloader
;----------------------------------------
; This is the first code that runs when our OS starts.
; The BIOS loads this bootloader into memory at address 0x7C00
; and jumps to it in 16-bit real mode.
;----------------------------------------

[BITS 16]                   ; Tell assembler we're using 16 bit mode
[ORG 0x7C00]               ; Tell assembler where this code will be loaded

;----------------------------------------
; Bootloader Entry Point
;----------------------------------------
start:
    ; Step 1: Initialize segment registers
    ; In real mode, we need to set up our own segments
    xor ax, ax              ; Zero AX register (faster than mov ax, 0)
    mov ds, ax              ; Data Segment = 0
    mov es, ax              ; Extra Segment = 0
    mov ss, ax              ; Stack Segment = 0
    mov sp, 0x7C00         ; Stack Pointer = 0x7C00 (stack grows down from here)

    ; Step 2: Print welcome message
    mov si, msg            ; SI = pointer to message
    call print_string      ; Call our string printing routine

    ; Step 3: Infinite loop
    ; At this point, we'd normally load the kernel and jump to it
    ; For now, we just hang here
    cli                    ; Clear interrupts
    hlt                    ; Halt the CPU
    jmp $                  ; Jump to current location (infinite loop)

;----------------------------------------
; print_string - Prints a null-terminated string
; Input: SI = pointer to string
; Output: None
; Affects: AX, SI
;----------------------------------------
print_string:
    pusha                  ; Save all registers
    mov ah, 0x0E          ; BIOS teletype output function

.loop:
    lodsb                  ; Load byte at SI into AL, increment SI
    test al, al           ; Check if character is null (0)
    jz .done              ; If null, we're done
    int 0x10              ; Otherwise, print character using BIOS
    jmp .loop             ; Repeat for next character

.done:
    popa                   ; Restore all registers
    ret                    ; Return to caller

;----------------------------------------
; Data Section
;----------------------------------------
msg: db 'Welcome to SimpleOS - Starting Boot Sequence...', 13, 10, 0  ; Our welcome message
                                                                     ; 13, 10 = CR/LF
                                                                     ; 0 = string terminator

;----------------------------------------
; Boot Sector Magic
;----------------------------------------
times 510-($-$$) db 0     ; Pad with zeros until 510 bytes
dw 0xAA55                 ; Boot signature for BIOS
                         ; 0xAA55 marks this as a bootable device 