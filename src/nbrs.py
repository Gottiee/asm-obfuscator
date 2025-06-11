#!/bin/python3

import re

def is_hex(nb: str) -> bool:
	return nb[:2] == "0x" and len(re.findall(r'[^0-9a-fA-Fx]', nb)) == 0

def line_contains_nb(line: str):
	split_line = re.split(r'[ \t\n,]', line)
	for word in split_line:
		if word.isdigit() == True or is_hex(word) == True or word.isupper():
			return True
	return False	

def list_alias_nb(inc_file_name: str) -> dict[str, str]:
	obf_values:dict[str, str] = {}
	with open(inc_file_name, "r") as inc_file:
		for line in inc_file:
			if line[:7] != "%define":
				continue
			split_line: list[str] = re.split(r'[ \t\n]', line)
			split_line = list(filter(len, split_line))
			if len(split_line) < 3 or split_line[1].isupper() == False \
				or ( is_hex(split_line[2]) == False and split_line[2].isdigit() == False ):
					continue
			if is_hex(split_line[2]) == False:
				obf_values[split_line[1]] = str(hex(int(split_line[2])))
			else:
				obf_values[split_line[1]] = split_line[2]
	return obf_values
	  
def replace_nb_aliases(line: str, number_dict: dict[str, str]) -> str:
	split_line: list[str] = re.split(r'[ \t\n]', line)
	split_line = list(filter(len, split_line))
	new_line: str = ""
	comma: bool = False
	clean_word: str = ""

	if len(split_line) < 2:
		return (line)
	for word in split_line:
		if word[0] == ';':
			break
		comma = (word[-1:] == ',')
		if comma == True:
			clean_word = word[:len(word) - 1]
		else:
			clean_word = word

		# Replace aliases by raw numbers
		if clean_word in number_dict:
			new_line += number_dict[clean_word] + " "
			if comma == True:
				new_line += ","
		elif clean_word == "\\":
			new_line += word
		else:
			new_line += word + " "
	new_line += "\n"
	if "/tmp/test" in new_line:
		print(f"replace nb aliases line -> {new_line}")
	return new_line
