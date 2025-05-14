section .data
    msg     db "Hello world", 10
    msg_len equ $ - msg 

section .text
    global _start

_start:
    ; write(stdout, msg, msg_len)
    mov     rax, 1          ; syscall: write
    mov     rdi, 1          ; file descriptor: stdout
    mov     rsi, msg        ; adresse du message
    mov     rdx, msg_len    ; taille du message
    syscall

    ; exit(0)
    mov     rax, 60         ; syscall: exit
    xor     rdi, rdi        ; code retour: 0
    syscall
