section .data
    msg     db "Hello world", 10
    msg_len equ $ - msg 

section .text
    global _start

_start:
    ; write(stdout, msg, msg_len)
    ;  syscall: write
    mov     rax, 1          
    ;  file descriptor: stdout
    mov     rdi, 1          
    ;  adresse du message
    mov     rsi, msg        
    ;  taille du message
    mov     rdx, msg_len    
    syscall

    ; exit(0)
    ;  syscall: exit
    mov     rax, 60         
    ;  code retour: 0
    xor     rdi, rdi        
    syscall
