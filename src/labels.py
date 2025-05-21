#!/bin/python3

import sys
import random
import pprint
from typing import Dict
import string
import re
from src.strings import line_declares_var

def generate_random_label() -> str:
	length = random.randint(5, 10)
	characters = string.ascii_letters + string.digits
	rdm_label:list = random.choices(characters, k=length)
	# rdm_label:list = list(''.join(random.choices(characters, k=length)))
	if rdm_label[0] in string.digits:
		rdm_label[0] = random.choice(string.ascii_letters)
	print("rdm_label ==", rdm_label)
	return ''.join(rdm_label)

def label_found(line: str, labels) -> bool:
	for label in labels:
		if line == label:
			return (True)
	return (False)

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
				split_line = re.findall(r'"[^"]*"|\S+', line)
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

# def obf_labels(file_name: str):
def obf_labels(line: str, labels: dict[str, str]):
	final_file = ""

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
	return (final_line)

# def main (argv, argc):
# 	if argc != 2:
# 		print("No arguments given -> Leaving ... ")
# 	else:
# 		obf_labels(argv[1])


# if __name__ == "__main__":
#     main(sys.argv, len(sys.argv))