#!/bin/python3

import sys
import string
import random
import re

def line_declares_var(line: str) -> bool:
	keywords = {"db", "dw", "dd", "dq", "dt", "equ"}
	split_line = re.split(r'[ \t]', line)
	for step in split_line:
		for word in keywords:
			if step == word:
				return True
	return False

def crypt_string(to_encpryt: str, key: str) -> str:
	crypted = ""
	# key: str = "buF'Mu.Fk^m7CD0"

	for i, char in enumerate(to_encpryt):
		key_char = key[i % len(key)]
		encrypt_char = chr(ord(key_char) ^ ord(char))
		crypted += encrypt_char
	return crypted

def encrypt_strings(line: str, key:str) -> str:
	to_encrypt = re.findall(r'"([^"]*)"', line)[0]
	print("to encrypt == ", to_encrypt, " | key -==", key)
	if to_encrypt == "mykey":
		line = re.sub(re.escape("mykey"), key, line)
		return line
	encrypted = crypt_string(to_encrypt, key)
	line = re.sub(re.escape(to_encrypt), encrypted, line)
	return line

def obf_strings(line: str, key: str):
	if line_declares_var(line) == False:
		return line
	final_line: str = line
	index = final_line.find('"')
	if index != -1 and final_line[index:].find('"') != -1:
		final_line = encrypt_strings(final_line, key)
	return final_line