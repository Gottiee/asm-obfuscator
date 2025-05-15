section .data
    msg     db "Hello world", 10

section .text
    global _start

_start:
 
    mov rax, 4
    mov rcx, rax
    add rcx, 3
    test rcx, 3
    test rdx, rdx

exit:
    ; exit(0)
    mov     rax, 60         ; syscall: exit
    xor     rdi, rdi        ; code retour: 0
    syscall


; insert

