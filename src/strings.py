#!/bin/python3

import re

def write_decrypt_str() -> str:
	return '; rax: char *_decrypt_str(rsi: char *to_decrypt, rdi: len)\n_decrypt_str:\n; rax	== div quotient\n; rbx	-> to_decrypt\n; rcx	== counter\n; rdx	== div modulo\n; r9	== len key\n; r10	-> key_char\n; r11	-> decrypted str (mmap)\n; r12	== len to_decrypt\n; rsi	-> key\npush rbx\npush rcx\npush rdx\npush r8\npush r9\npush r10\npush r11\npush r12\nmov rbx, rdi\nmov r12, rsi\nxor rdi, rdi                    ; addr = NULL (let kernel choose)\nmov rdx, 0x03                   ; PROT_READ | PROT_WRITE = 1 | 2 = 3\nmov r10, 0x22                   ; MAP_PRIVATE | MAP_ANONYMOUS = 0x2 | 0x20 = 0x22\nmov r8, -1                      ; fd = -1\nxor r9, r9                      ; offset = 0\nmov rax, 9                      ; syscall number for mmap\nsyscall\ncmp rax, 0\njl _decrypt_loop_end\nmov r11, rax\nlea rsi, key\ncall _strlen\nmov r9, rax\nxor rcx, rcx\nxor rdx, rdx\n_decrypt_loop:\ncmp rcx, r12\njge	_decrypt_loop_end\nmov rax, rcx\nxor rdx, rdx\ncmp rcx, 0\njne _no_zero\nxor rax, rax\njmp _end_div\n_no_zero:\ndiv r9\n_end_div:\nmovzx r10, byte [rsi + rdx]	; r10 == key[rcx % key_len]\nxor r10b, [rbx+rcx]\nmov [r11+rcx], r10b\ninc rcx\njmp _decrypt_loop\n_decrypt_loop_end:\nmov rax, r11\npop r12\npop r11\npop r10\npop r9\npop r8\npop rdx\npop rcx\npop rbx\nret\n'

def line_declares_var(line: str) -> bool:
	keywords = {"db", "dw", "dd", "dq", "dt", "equ"}
	split_line = re.split(r'[ \t]', line)
	for step in split_line:
		if step in keywords:
			return True
	return False

def crypt_string(to_encpryt: str, key: str) -> str:
	crypted = ""

	for i, char in enumerate(to_encpryt):
		key_char = key[i % len(key)]
		encrypt_char: int = ord(key_char) ^ ord(char)
		crypted += ", " + f'0x{encrypt_char:02X}'
	crypted = crypted[2:]
	return crypted

def split_key(key: str):
	b_key: str = ""
	for char in key:
		b_key += ", " + f'0x{ord(char):02X}'
	b_key = b_key[2:]
	return b_key

def encrypt_strings(line: str, key:str) -> str:
	# list all groups inside double quotes
	to_encrypt: str = re.findall(r'"([^"]*)"', line)[0]
	to_encrypt += '\0'
	# if found the key -> change the defualt value to the actual key
	encrypted = ""
	if to_encrypt == "mykey\0":
		encrypted = split_key(key)
	elif to_encrypt[:6] == "Famine":
		return line
	else:
		encrypted = crypt_string(to_encrypt, key)
	# print("encrypted -> [", encrypted, "]", sep="")
	line = re.sub(re.escape(to_encrypt[: len(to_encrypt) - 1]), encrypted, line)
	line = re.sub("\"", "", line)
	line = line[:line.rfind(", ")]
	return line

def encrypt_bytes(line: str, key: str) -> str:
	to_encrypt: list[str] = re.split(r'^, $', line)
	return line

def obf_strings(line: str, key: str):
	if line_declares_var(line) == False:
		return line
	print(f"=============== \n string line -> {line}")
	final_line: str = line
	index = final_line.find('"')
	if index == -1 and final_line[index:].find('"') == -1:
		final_line = encrypt_bytes(final_line, key)
	else:
		final_line = encrypt_strings(final_line, key)
	print(f"string final_line -> {final_line}")
	return final_line