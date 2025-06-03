section .text
    global _start

_start:
	push rbp
    mov rbp, rsp
    sub rsp 32

    mov rax, 5
    mov rbx, 2
    add rax, rbx

    mov rcx, rbx

    mov rcx, 0xffffffffff56ff56     ; pour les test

    mov rax, rcx

    mov rax, 2  ; pour les test

    mov r12, rcx

    mov r12, 5 ; pour le test

    mov rcx, r12

    test rdx, rdx

    exit:
    ; exit(0)
    mov     rax, 60         ; syscall: exit
    xor     rdi, rdi        ; code retour: 0
    syscall

