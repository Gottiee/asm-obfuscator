#!/bin/python3

import sys
import random
import pprint
from typing import Dict
import string
import re

def generate_random_label() -> str:
	length = random.randint(5, 10)
	characters = string.ascii_letters + string.digits
	return ''.join(random.choices(characters, k=length))

def label_found(line: str, labels) -> bool:
	for label in labels:
		if line == label:
			return (True)
	return (False)

def line_declares_var(line: str) -> bool:
	keywords = {"db", "dw", "dd", "dq", "dt", "equ"}
	split_line = re.split(r'[ \t]', line)
	for step in split_line:
		for word in keywords:
			if step == word:
				return True
	return False

def crypt_string(to_encpryt: str) -> str:
	crypted = ""
	key: str = "buF'Mu.Fk^m7CD0"

	for i, char in enumerate(to_encpryt):
		key_char = key[i % len(key)]
		encrypt_char = chr(ord(key_char) ^ ord(char))
		crypted += encrypt_char
	return crypted

def encrypt_strings(line) -> str:
	print("isolate line -> ", line)
	to_encrypt = re.findall(r'"([^"]*)"', line)[0]
	if to_encrypt == "buF'Mu.Fk^m7CD0":
		return line
	print("to_encrypt -> [", to_encrypt, "]", sep="")
	encrypted = crypt_string(to_encrypt)
	print("crypted -> ", encrypted)
	line = re.sub(re.escape(to_encrypt), encrypted, line)
	print("line encrypted -> [", line, "]", sep="")
	return line

def randomize_labels(file_name: str) -> dict[str, str]:
	labels: dict[str, str] = {}

	with open(file_name, "r") as file:
		for line in file:
			line = line.strip()
			if not line or line == "_start:":
				continue
			elif line[-1] == ':':
				labels[line[:len(line) - 1]] = generate_random_label()
			elif line_declares_var(line) == True:
				# split_line = re.split(r'[ \t]', line)
				split_line = re.findall(r'"[^"]*"|\S+', line)
				print("split_line ->", split_line)
				# if split_line[0] is None:
				# 	continue
				labels[split_line[0]] = generate_random_label()
	return labels

def	modify_word(word: str, labels:dict[str, str]) -> str:
	clean_word: str = word.strip()
	clean_word = clean_word.strip('()[]')
	if len(clean_word) == 0:
		return word
	elif clean_word[-1:] == ':' or clean_word[-1:] == ',':
		clean_word = clean_word[:len(clean_word) - 1]
	modified_word: str = ""
	if clean_word in labels:
		modified_word = word.replace(clean_word, labels[clean_word], 1)
		return modified_word
	return word

def modify_labels(file_name: str):
	labels: dict[str, str] = randomize_labels(file_name)
	print(labels)
	final_file = ""

	with open(file_name, "r") as file, open("obf_file.asm", "w") as w_file:
		for line in file:
			line = line.strip(' \t')
			final_line = ""
			splitted_line = re.split(r'[ \t]', line)
			for word in splitted_line:
				if (word[:0] == ';'):
					break
				word = modify_word(word, labels)
				# print("word -> [", word, "]", sep="")
				if (word[-1:] == '\n'):
					final_line += word
				else:
					final_line += word + " "
			# print("final_line == [", final_line, "]", sep="")
			if line_declares_var(line) == True:
				index = final_line.find('"')
				if index != -1 and final_line[index:].find('"') != -1:
					final_line = encrypt_strings(final_line)
			final_file += final_line
		w_file.write(final_file)
		# print(final_file)
	return 

def main (argv, argc):
	if argc != 2:
		print("No arguments given -> Leaving ... ")
	else:
		modify_labels(argv[1])


if __name__ == "__main__":
    main(sys.argv, len(sys.argv))