#!/bin/python3

# pas oublier de skipe les lignes qui commence par ; et split les lignes avec ; et recuper le premier index (pour enlever les commentaires)

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

def obf_line(line: str, obf_values: dict[str, str], obf_nbs: dict[str, str], str_key: str, all_numbers:list[str]) -> str:
	final_line: str = ""

	final_line = obf_labels(line, obf_values)
	final_line = obf_struc(final_line, obf_values)
	final_line = obf_strings(final_line, str_key)
	if line_contains_nb(line) == True:
		final_line = replace_nb_aliases(final_line, obf_nbs)
		final_line = obf_numbers(final_line, all_numbers)
	return final_line

def main (argv, argc):
	if argc != 3:
		print_usage()
		return 

	characters = string.ascii_letters + string.digits + string.punctuation
	str_key: str = ''.join(random.choices(characters, k = 12))
	print(f"str_key -> {str_key}")
	# print("--------------------------")
	final_file: str = ""
	obf_values: dict[str, str] = {}
	randomize_labels(argv[1], obf_values)
	list_struc(argv[2], obf_values)
	number_dict: dict[str, str] = list_alias_nb(argv[2])
	all_numbers: list[str] = list_all_nb(argv[1], number_dict)
	func_add: str = write_tab_map(all_numbers)
	func_add += write_decrypt_str()
	
	with open(argv[1], "r") as r_file, open("obf_file.asm", "w") as w_file:
		for line in r_file:
			if line == ";;**;;\n":
				# final_file += func_add
				split_func:list[str] = re.split(r'(?<=\n)', func_add)
				for l in split_func:
					final_file += obf_labels(l, obf_values)
					# final_file += obf_line(l, obf_values, number_dict, str_key, all_numbers)
				print("add function")
			else:
				final_file += obf_line(line, obf_values, number_dict, str_key, all_numbers)
		w_file.write(final_file)
	
	print("------------------")
	final_line = ""
	final_file = ""
	with open(argv[2], "r") as r_file, open("obf_file.inc", "w") as w_file:
		for line in r_file:
			final_line = obf_labels(line, obf_values)
			final_line = obf_struc(final_line, obf_values)
			final_file += final_line
		w_file.write(final_file)
		

if __name__ == "__main__":
	main(sys.argv, len(sys.argv))