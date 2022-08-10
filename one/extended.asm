[org 0x7e00]
jmp enter_prot_mode

%include"print.asm"
%include"gdt.asm"

enter_prot_mode:
    call enable_a20
    cli
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    jmp CODE_SEG:start_pm

enable_a20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret

[bits 32]
start_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ebp, 0x90000
    mov esp, ebp
    mov [0xb8000], byte 'h'
    jmp $

times 2048-($-$$) db 0