section .data
    msg     db "Hello world", 10
    msg_len equ $ - msg 

section .text
    global _start

_start:
	;push rbp
    ;mov rbp, rsp
    ;sub rsp 32

    enter 32, 0

    mov rax, 5
    mov rbx, 2

    ; add rax, rbx
    push rax
    push rbx
    call    _add1
    pop rbx
    add rsp, 8

    ;mov rcx, rbx
    push rax                ; sauvegarde de la valeur de rax
    push rbx                ; param 1
    call _mov1
    mov rcx, rax
    pop rbx
    pop rax

    mov rcx, 0xffffffffff56ff56     ; pour les test

    ;mov rax, rcx
    push rcx
    call _mov2
    pop rcx

    mov rax, 2  ; pour les test

    ;mov r12, rcx
    push rax
    push rcx
    call _mov3
    mov r12, rax
    pop rcx
    pop rax

    mov r12, 5 ; pour le test

    ;mov rcx, r12
    push rax
    push r12
    call _mov4
    mov rcx, rax
    pop r12
    pop rax

    ;test rdx, rdx
    push rdx
    call _test1
    pop rdx
    jnz exit

    exit:
    ; exit(0)
    mov     rax, 60         ; syscall: exit
    xor     rdi, rdi        ; code retour: 0
    syscall

; mov rax, param 1
_mov1:
    push rcx
    push rdx
    mov rcx, [rsp + 8 + 16]

    mov rdx, (64 << 8) | 0      ; flag pour le mov de bextr
    bextr rax, rcx, rdx         ; mov rax, rcx        

    pop rdx
    pop rcx
    ret

_mov2:
    push rcx
    push rdx
    mov rcx, [rsp + 8 + 16]

    mov rdx, -1
    bzhi rax, rcx, rdx

    pop rdx
    pop rcx
    ret

_mov3:
    push rcx
    push rbx
    mov rbx, [rsp + 8 + 16]

    mov rax, 0
    mov rcx, 0x3dfd3342f
    cmpxchg rbx, rcx

    pop rbx
    pop rcx
    ret

_mov4:
    push rbx
    push rcx
    mov rcx, [rsp + 8 + 16]
    
    mov rax, 0
    mov rbx, 0
    cmpxchg rbx, rcx
    mov rax, rbx
    pop rcx
    pop rbx
    ret


; add param 1, param 2
_add1:
    push rcx
    mov rax, [rsp + 16 + 8]
    mov rcx, [rsp + 8 + 8]
    
    test rcx, rcx       ;  is rcx == 0 ?
    jnz sub
    jnc do_adc
    jmp reverseCF

    sub:
    sub rcx, 1
    jnc reverseCF       ; Jump if Carry Flag is Not set (CF=0)
    jmp do_adc          ; Jump to ADC instruction
    reverseCF:           
    cmc                 ; Complement CF, making it 1
    do_adc:             ; Perform ADC with prepared carry flag
    adc rax, rcx        ; RAX = RAX + rcx + CF
    
    pop rcx
    ret

_test1:
    push rdx
    push rax
    mov rax, [rsp + 8 + 16]

    bsf rdx, rax    ; si rax == 0 ? zf == 1 : zf == 0

    pop rax
    pop rdx
    ret