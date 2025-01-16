[BITS 16]                   ; We're working in 16-bit mode
[ORG 0x7C00]                ; Standard bootloader origin point

start:
    ; Set up segments
    xor ax, ax              ; Zero AX register
    mov ds, ax              ; Set Data Segment to 0
    mov es, ax              ; Set Extra Segment to 0
    mov ss, ax              ; Set Stack Segment to 0
    mov sp, 0x7C00         ; Set Stack Pointer to 0x7C00

    ; Print welcome message
    mov si, msg            ; Load message address
    call print_string      ; Call print routine

    ; Infinite loop
    jmp $                  ; Jump to current location (loop forever)

; Print string routine
print_string:
    pusha                  ; Save all registers
    mov ah, 0x0E          ; BIOS teletype output

.loop:
    lodsb                  ; Load next character
    test al, al           ; Check if character is null
    jz .done              ; If null, we're done
    int 0x10              ; Print character
    jmp .loop             ; Repeat for next character

.done:
    popa                   ; Restore all registers
    ret                    ; Return to caller

msg: db 'Welcome to SimpleOS!', 13, 10, 0  ; Our message with newline and null terminator

times 510-($-$$) db 0     ; Pad with zeros until 510 bytes
dw 0xAA55                 ; Boot signature 