print_str:
    push ax
    push bx

    mov ah, 0x0e
    loop:
    cmp [bx], byte 0
    je exit
    mov al, [bx]
    int 0x10
    inc bx
    jmp loop
    exit:
    pop ax
    pop bx
    ret