PROGRAM_SPACE equ 0x7e00
read_disk:
    mov ah, 0x02
    mov bx, PROGRAM_SPACE
    mov al, 4
    mov dl, [BOOT_DISK]
    mov ch, 0x00
    mov dh, 0x00
    mov cl, 0x02
    int 0x13
    jc disk_error
    ret
disk_error:
    mov bx, disk_error_str
    call print_str
    jmp $
disk_error_str:
    db 'Disk read failed',0
BOOT_DISK:
    db 0