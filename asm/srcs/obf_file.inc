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

%define CODE_LEN (_end - _start)
%define FINJMP_OFF (_bf_exit - _start)
%define PAGE_SIZE 0x1000

%define FAM(x) [(rbp - zxOZkA_size) + x]
%define SOCK(x) [(rbp - sock_size) + x]
%define INF(x) [(rbp - kYUbCohU_size) + x]

%define CODE_LEN (_end - _start)
%define FINJMP_OFF (_bf_exit - _start)
%define PAGE_SIZE 0x1000

struc zxOZkA
.haUkB resb PAGE_SIZE
.ihadZrNt: resb PAGE_SIZE
.mAlZN resq 1
.Oqbj5UNm: resd 1
.GyQ45i: resd 1
.em76UiFD5 resq 1
endstruc

struc kYUbCohU
.ArmPp1A6xD resq 1
.fBEK0owvp resq 1
.lk2eKo resq 1
.la5hS resb 1
.kAoNvY resq 1
.Te6H5pBbwA resq 1
.H8g9sz resq 1
.To8v5 resq 1
.as1TnFdOM resq 1 
.vduAsO resq 1
.bYpgX resq 1
.qj8vkYwEi resb 1
.VzEDSkNs5J resq 1
.BorhL resq 1
.efxggNL resq 1
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

struc Tzbf1yARX9
.jtZ8oewda: resb 16
.DSsK2FL: resw 1
.BzlLJ3K: resw 1
.bMSThzm: resd 1
.k9A7SUa9: resq 1
.yJMhJuiSq: resq 1
.QsDSta: resq 1
.a941HQEXh: resd 1
.bQpd83A3y: resw 1
.bpENuiarZ: resw 1
.jC6i2sdAo: resw 1
.XPsF1: resw 1
.EeCKTG2YX: resw 1
.GRV5u167N: resw 1
endstruc

struc M8f3Z
.NI6N5cFP: resd 1
.ZbmRce9L3a: resd 1
.h0GaSE4cF: resq 1
.TDEERGx: resq 1
.jwhMDhaGB: resq 1
.VPdE25Nabr: resq 1
.CMN5KYCr: resq 1
.qhLq3iaS: resq 1
endstruc

struc CNLtGo
.t9VcIfehaS: resd 1
.kPHkib: resd 1
.L3U9C7eFJ: resq 1
.I2jOj5f6D: resq 1
.ENERSsTl: resq 1
.x8tu2Q: resq 1
.Q6Ue39jmkw: resd 1
.hwldu: resd 1
.xSFgpqZ9 resq 1
.oYcjpEQOW8 resq 1
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