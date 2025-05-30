BITS 64

default rel

#include "test.inc"

section .text
global _start

_start:
	push rbp
	mov rbp, rsp
	mov rax, 0x20
	mov rax, rax + 7
	mov rax, 0x0
	mov rax, 3
	mov rax, AB
	mov rax, CC

_Famine_exit:
    mov rax, 60
    xor rdi, rdi
    syscall

key	db		"bonjour", 0x00
string1 db	"string1", 0x0A, 0x00
str1_len	equ $ - string1
string2	db	"string2", 0x0A, 0x00
str2_len	equ $ - string