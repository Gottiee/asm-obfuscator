BITS 64

default rel

section .text
global _start

_start:
	mov rax, 0x01
	mov	rdi, 0x01
	lea rsi, string1
	mov rdx, str1_len
	syscall
	lea rsi, string1
	call _decrypt_str
	mov r10, rax
	mov rsi, rax
	mov rax, 0x01
	mov	rdi, 0x01
	mov rdx, str1_len
	mov r10, rsi
	call _decrypt_str
	mov rsi, rax
	mov rax, 0x01
	mov	rdi, 0x01
	mov rdx, str1_len
	syscall

	mov rax, 0x3C
	mov rdi, 0x00
	syscall


_decrypt_str:
	; rax	== div quotient
	; rbx	-> to_decrypt
	; rcx	== counter
	; rdx	== div modulo
	; r9	== len key
	; r10	-> key_char
	; r11	-> decrypted str (mmap)
	; r12	== len to_decrypt
	; rsi	-> key
	push rbx
	push rcx
	push rdx
	push r8
	push r9
	push r10
	push r11
	push r12
	mov rbx, rsi
	call _strlen
	mov r12, rax
    xor rdi, rdi                    ; addr = NULL (let kernel choose)
    mov rsi, r12                   ; length = 1 page
    mov rdx, 0x03                      ; PROT_READ | PROT_WRITE = 1 | 2 = 3
    mov r10, 0x22                   ; MAP_PRIVATE | MAP_ANONYMOUS = 0x2 | 0x20 = 0x22
    mov r8, -1                      ; fd = -1
    xor r9, r9                      ; offset = 0
    mov rax, 9                      ; syscall number for mmap
    syscall
	cmp rax, 0
	jl _decrypt_loop_end
	mov r11, rax
	lea rsi, key
	call _strlen
	mov r9, rax
	xor rcx, rcx
	xor rdx, rdx
	_decrypt_loop:
		cmp rcx, r12
		jge	_decrypt_loop_end
		mov rax, r9
		cmp rcx, 0
		jne _no_zero
		xor rax, rax
		jmp _end_div
		_no_zero:
		div rcx
		_end_div:
		movzx r10, byte [rsi + rdx]	; r10 == key[rcx % key_len]
		xor r10b, [rbx + rcx]
		mov [r11 + rcx], r10b
		inc rcx
		jmp _decrypt_loop
	_decrypt_loop_end:
		mov rax, r11
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8
		pop rdx
		pop rcx
		pop rbx
		ret

_strlen:
	xor rcx, rcx

	ft_strlen_loop:
		cmp	byte [rsi + rcx], 0
		je	ft_strlen_end
		inc rcx
		jmp	ft_strlen_loop

	ft_strlen_end:
		mov rax, rcx
		ret

key	db		"bonjour", 0x00
string1 db	"string1", 0x0A, 0x00
str1_len	equ $ - string1
string2	db	"string2", 0x0A, 0x00
str2_len	equ $ - string2