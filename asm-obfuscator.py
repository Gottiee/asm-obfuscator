#!/bin/python3

# pas oublier de skipe les lignes qui commence par ; et split les lignes avec ; et recuper le premier index (pour enlever les commentaires)

import sys
import string
import random
from src.utils import *
from src.labels import obf_labels, randomize_labels
from src.nbrs import obf_numbers, list_alias_nb, line_contains_nb, make_int_table, get_int_index
from src.strings import obf_strings
from src.struc import list_struc, obf_struc

def obf_line(line: str, obf_values: dict[str, str], obf_nbs: dict[str, str], str_key: str) -> str:
	final_line: str = ""

	final_line = obf_labels(line, obf_values)
	final_line = obf_strings(final_line, str_key)
	final_line = obf_struc(final_line, obf_values)
	if final_line == "_start:\0":
		add_int_tab()
	if line_contains_nb(final_line) == True:
		final_line = obf_numbers(final_line, obf_nbs)
	return final_line

def main (argv, argc):
	if argc != 3:
		print_usage()
		return 

	characters = string.ascii_letters + string.digits + string.punctuation
	str_key: str = ''.join(random.choices(characters, k = 12))
	int_tab: list[int] = make_int_table()
	int_indexes: list[int] = get_int_index(int_tab)
	print("int_tab -> ", int_tab)
	print("--------------------------")
	print("indexes ->", int_indexes)
	final_file: str = ""
	obf_values: dict[str, str] = {}
	randomize_labels(argv[1], obf_values)
	list_struc(argv[2], obf_values)
	obf_numbers: dict[str, str] = {}
	list_alias_nb(argv[2], obf_numbers)

	with open(argv[1], "r") as r_file, open("obf_file.asm", "w") as w_file:
		for line in r_file:
			final_file += obf_line(line, obf_values, obf_numbers, str_key)
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