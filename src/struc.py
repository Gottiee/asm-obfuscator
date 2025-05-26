#!/bin/python3

import re
from src.labels import generate_random_label

def list_struc(file_name: str, obf_values: dict[str, str]):
	with open(file_name, "r") as file:
		for line in file:
			split_line:list[str] = re.split(' \t\n', line)
			if split_line[0] == "struc":
				obf_values[split_line[1]] = generate_random_label()
			elif split_line[0][:0] == '.':
				obf_values[split_line[0][1:]] = generate_random_label()
	return 

def obf_struc(line: str, obf_values:dict[str, str]) -> str:
	final_line: str = line
	split_line: list[str] = re.split(r' \n\t', final_line)
	print("split_line ->", split_line)

	for word in split_line:
		print("word -> ", word)
		try:
			if word.index(".") != -1:
				split_word: list[str] = re.split(r'.', word)
				print("split_word -> ", split_word)
				for sub_word in split_word:
					if sub_word in obf_values:
						re.sub(obf_values[sub_word], sub_word, final_line)
		except:
			continue
	print("final_line ->", final_line)
	return final_line