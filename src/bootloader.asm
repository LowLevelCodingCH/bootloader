org 0x7C00 ; Set the origin of the bootloader to 0x7C00
jmp mainbl
read_disk: ; Reads disk (HDD/FLOPPY)
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, 0x80
    mov bx, 0x1000
    int 0x13
    ret
mainbl: ; Jump to kernel (first line in kernel needs to be "org 0x1000" for an offset/origin)
    call read_disk
    call 0x1000
times 510-($-$$) db 0 ; Pads the bootloader
dw 0xAA55 ; Closes the bootloader
