#!/bin/python3

import sys
import re

def is_hex(nb: str):
	return nb[:2] == "0x" and len(re.findall(r'[^0-9a-fA-Fx]', nb)) == 0

def line_contains_nb(line: str):
	split_line = re.split(r'[ \t\n,]', line)
	# print("split_line -> ", split_line)
	for word in split_line:
		if word.isdigit() == True or is_hex(word) == True or word.isupper():
			return True
	return False	

def list_alias_nb(inc_file_name: str) -> dict[str, str]:
	aliases: dict[str, str] = {}
	with open(inc_file_name, "r") as inc_file:
		for line in inc_file:
			if line[:7] != "%define":
				continue
			split_line: list[str] = re.split(r'[ \t\n]', line)
			split_line = list(filter(len, split_line))
			if len(split_line) < 3 or split_line[1].isupper() == False \
				or (is_hex(split_line[2]) == False and split_line[2].isdigit() == False ):
					continue
			aliases[split_line[1]] = split_line[2]
	return aliases
			
def modify_line(line: str, aliases: dict[str, str]):
	split_line: list[str] = re.split(r'[ \t\n]', line)
	split_line = list(filter(len, split_line))
	new_line: str = ""
	# print(split_line)
	if len(split_line) < 2:
		return (line)
	for word in split_line:
		clean_word: str = word
		if clean_word[-1:] == ',':
			clean_word = clean_word[:len(clean_word) - 1]
		if clean_word in aliases:
			# print("replacing")
			new_line += aliases[clean_word]
			# print("new_line += [", aliases[clean_word],"]", sep="")
			if word[-1:] == ',':
				new_line += ","
				# print("add comma")
		else:
			new_line += word + " "
			# print("new_line += [", word,"]", sep="")
	new_line += "\n"
	return new_line

def obf_numbers(line: str, aliases: dict[str, str]) -> str:
	# aliases: dict[str, str] = list_alias_nb(include_file)
	# modified_line: str = ""
	if line_contains_nb(line) == True:
		# print("line [", line, "] contains a nb")
		line = modify_line(line, aliases)
		# print("new_line [", line, "]")
		# print()
	return line
