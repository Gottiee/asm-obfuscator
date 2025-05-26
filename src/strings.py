#!/bin/python3

import re

def line_declares_var(line: str) -> bool:
	keywords = {"db", "dw", "dd", "dq", "dt", "equ"}
	split_line = re.split(r'[ \t]', line)
	for step in split_line:
		if step in keywords:
			return True
		# for word in keywords:
		# 	if step == word:
		# 		return True
	return False

def crypt_string(to_encpryt: str, key: str) -> str:
	crypted = ""
	# key: str = "buF'Mu.Fk^m7CD0"

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
	print("---Encrypt strings ---")
	print("line -> [", line, "]", sep="")
	# list all groups inside double quotes
	to_encrypt: str = re.findall(r'"([^"]*)"', line)[0]
	to_encrypt += '\0'
	print("to encrypt == [", to_encrypt, "]", sep="")
	# if found the key -> change the defualt value to the actual key
	encrypted = ""
	if to_encrypt == "mykey\0":
		print("In my key")
		encrypted = split_key(key)
		print("b_key -> [", encrypted, "]", sep="")
	else:
		encrypted = crypt_string(to_encrypt, key)
	# print("encrypted -> [", encrypted, "]", sep="")
	line = re.sub(re.escape(to_encrypt[: len(to_encrypt) - 1]), encrypted, line)
	line = re.sub("\"", "", line)
	line = line[:line.rfind(", ")]
	return line

def encrypt_bytes(line: str, key: str) -> str:
	# print("--- Encrypt bytes ---")
	to_encrypt: list[str] = re.split(r'^, $', line)
	# print("to_encrypt ->", to_encrypt)
	return line


def obf_strings(line: str, key: str):
	if line_declares_var(line) == False:
		return line
	final_line: str = line
	index = final_line.find('"')
	if index == -1 and final_line[index:].find('"') == -1:
		final_line = encrypt_bytes(final_line, key)
	else:
		final_line = encrypt_strings(final_line, key)
	return final_line