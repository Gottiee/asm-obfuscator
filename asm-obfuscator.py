#!/bin/python3

import sys
import string
import random
import re
from src.utils import *
from src.labels import obf_labels, randomize_labels
from src.nbrs import replace_nb_aliases, list_alias_nb, line_contains_nb 
from src.strings import obf_strings, write_decrypt_str
from src.struc import list_struc, obf_struc
from src.int_gen import  list_all_nb, write_tab_map, obf_numbers
from src.parser import *

def obf_number_line(in_file:str, out_file:str, obf_values:dict[str, str], all_numbers:list[str]):
	# print("--------------------------")
	final_file: str = ""
	func_add: str = write_tab_map(all_numbers)
	func_add += write_decrypt_str()
	
	with open(in_file, "r") as r_file, open(out_file, "w") as w_file:
		final_line: str = ""
		for line in r_file:
			if line_contains_nb(line) == True:
				final_line = replace_nb_aliases(line, obf_values)
				final_line = obf_numbers(final_line, all_numbers)
				final_file += final_line
			elif line == ";;**;;\n":
				final_file += line + func_add
			else:
				if "/tmp/test" in line:
					print(f"f_line(else) -> {line[:len(line) -1 ]}")
				final_file += line
		w_file.write(final_file)

def obf_string_line(in_file: str, out_file:str, inc_file:str, obf_values:dict[str, str], str_key:str):
	final_file:str = ""
	final_line:str = ""
	with open(in_file, "r") as r_file:
		for line in r_file:
			final_line = obf_strings(line, str_key)
			final_line = obf_labels(final_line, obf_values)
			final_line = obf_struc(final_line, obf_values)
			# print(f"final_line -> {final_line}")
			final_file += final_line
	
	# print(f"finalfile -> {final_file}")
	with open(out_file, "w") as w_file:
		w_file.write(final_file)


# def obf_line(line: str, obf_values: dict[str, str], obf_nbs: dict[str, str], str_key: str, all_numbers:list[str]) -> str:
# 	final_line: str = ""

# 	final_line = obf_labels(line, obf_values)
# 	final_line = obf_struc(final_line, obf_values)
# 	final_line = obf_strings(final_line, str_key)
# 	if line_contains_nb(line) == True:
# 		final_line = replace_nb_aliases(final_line, obf_nbs)
# 		final_line = obf_numbers(final_line, all_numbers)
# 	return final_line

def obf_line_instruct(file:str, obf):
	insert = None
	for index, line in enumerate(file.splitlines()):
		tmp = modify_line(line, obf)
		if (tmp == True):
			insert = index
	return insert

def obf_include(inc_file:str, obf_values:dict[str, str]):
	final_line = ""
	final_file = ""
	print("======================================")
	with open(inc_file, "r") as r_file, open("obf_file.inc", "w") as w_file:
		for line in r_file:
			final_line = obf_labels(line, obf_values)
			final_line = obf_struc(final_line, obf_values)
			final_file += final_line
		w_file.write(final_file)

def main (argv, argc):
	if argc != 4:
		print_usage()
		return 

	obf_values: dict[str, str] = {}
	# randomize_labels(argv[1], obf_values)
	list_struc(argv[2], obf_values)
	number_dict: dict[str, str] = list_alias_nb(argv[2])
	all_numbers: list[str] = list_all_nb(argv[1], number_dict)
	characters:str = string.ascii_letters + string.digits + string.punctuation
	print(f"character -> {characters}")
	str_key: str = ''.join(random.choices(characters, k = 12))
	print(f"str_key -> {str_key}")

	obf_number_line(argv[1], argv[3], obf_values, all_numbers)

	# file = open_file(argv[3])
	# new_file = create_file(argv[3])
	# obf = ObfInstructions(new_file)
	# obf_line_instruct(file, obf)
	# new_file.close()
	# obf.insert_functions(argv[3])

	# randomize_labels(argv[3], obf_values)
	obf_string_line(argv[3], argv[3], argv[2], obf_values, str_key)
	
	obf_include(argv[2], obf_values)
	# print("------------------")
		

if __name__ == "__main__":
	main(sys.argv, len(sys.argv))