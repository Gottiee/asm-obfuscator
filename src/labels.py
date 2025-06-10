#!/bin/python3

import random
import string
import re
from src.strings import line_declares_var

def generate_random_label(obf_values: dict[str,str]) -> str:
	length = random.randint(5, 10)
	characters = string.ascii_letters + string.digits
	
	while True:
		rdm_label:list = random.choices(characters, k=length)
		if rdm_label[0] in string.digits:
			rdm_label[0] = random.choice(string.ascii_letters)
		if rdm_label not in obf_values.values():
			break
	return ''.join(rdm_label)

def label_found(line: str, labels) -> bool:
	for label in labels:
		if line == label:
			return (True)
	return (False)

def randomize_labels(file_name: str, obf_values: dict[str, str]):
	illegal:list[str] = ["db", "dw", "dd", "dq", "sub"]
	with open(file_name, "r") as file:
		for line in file:
			line = line.strip()
			if not line or line == "_start:":
				continue
			if line[-1] == ':' and line[:len(line) - 1] not in illegal:
				obf_values[line[:len(line) - 1]] = generate_random_label(obf_values)
			elif line_declares_var(line) == True:
				split_line = re.findall(r'"[^"]*"|\S+', line)
				if split_line[0] not in illegal and split_line[0] not in obf_values.keys():
					obf_values[split_line[0]] = generate_random_label(obf_values)
	return

def	modify_word(word: str, obf_values:dict[str, str]) -> str:
	clean_word: str = word.strip()
	clean_word = clean_word.strip('()[]')
	if len(clean_word) == 0:
		return word
	elif clean_word[-1:] == ':' or clean_word[-1:] == ',':
		clean_word = clean_word[:len(clean_word) - 1]
	modified_word: str = ""
	if clean_word in obf_values:
		modified_word = word.replace(clean_word, obf_values[clean_word], 1)
		return modified_word
	return word

# def obf_labels(file_name: str):
def obf_labels(line: str, obf_values: dict[str, str]):
	line = line.strip(' \t')
	final_line = ""
	splitted_line = re.split(r'[ \t]', line)
	splitted_line = list(filter(len, splitted_line))
	for word in splitted_line:
		if (word[:0] == ';'):
			break
		word.strip('()[]')
		word = modify_word(word, obf_values)
		if (word[-1:] == '\n'):
			final_line += word
		else:
			final_line += word + " "
	return (final_line)
