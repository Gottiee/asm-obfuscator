section .text
    global _start

_start:
push rax
push 2
call mov1
pop 2
mov rax, rbx
pop rax
push rax
push 2
push rbx
call mov1
pop rbx
pop 2
mov rax, rcx
pop rax

; insert
mov1:
push rcx
push rdx
mov rcx, [rsp + 8 + 16]

mov rdx, (64 << 8) | 0  ; flag pour le mov de bextr
bextr rax, rcx, rdx ; mov rax, rcx

pop rdx
pop rcx
ret
