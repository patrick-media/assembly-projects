gdt_start:
    dd 0
    dd 0
gdt_code:
    dw 0xFFFF    ; limit
    dw 0x0000    ; base low
    db 0x00      ; base medium
    db 10011010b ; flags
    db 11001111b ; flags + upper limit
    db 0x00      ; base high
gdt_data:
    dw 0xFFFF    ; limit
    dw 0x0000    ; base low
    db 0x00      ; base medium
    db 10010010b ; flags
    db 11001111b ; flags + upper limit
    db 0x00      ; base high
gdt_end:
gdt_descriptor:
    gdt_size:
        dw gdt_end - gdt_start - 1
        dd gdt_start
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start