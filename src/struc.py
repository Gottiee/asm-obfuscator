#!/bin/python3

import re
from src.labels import generate_random_label

def list_struc(file_name: str, obf_values: dict[str, str]):
	with open(file_name, "r") as file:
		for line in file:
			split_line:list[str] = re.split(r'[ \t\n\:]', line)
			split_line = list(filter(None, split_line))
			if len(split_line) == 0:
				continue
			if split_line[0] == "struc":
				obf_values[split_line[1]] = generate_random_label(obf_values)
				obf_values[split_line[1] + "_size"] = obf_values[split_line[1]] + "_size"
				# print(split_line[1], "->", obf_values[split_line[1]])
				# print(split_line[1] + "_size", "->", obf_values[split_line[1] + "_size"])
			elif split_line[0][0] == '.':
				obf_values[split_line[0][1:]] = generate_random_label(obf_values)
				# print(split_line[0][1:], "->", obf_values[split_line[0][1:]])
	# print("========================================")
	return 

def obf_struc(line: str, obf_values:dict[str, str]) -> str:
	split_line: list = re.split(r'[ \n\t.\(\)\[\]\:]', line)
	split_line = list(filter(None, split_line))

	if len(split_line) == 0:
		return line
	# print("split_line ->", split_line)
	for word in split_line:
		if word in obf_values:
			# print(word , "->", obf_values[word])
			line = re.sub(word, obf_values[word], line)
	return line