#!/bin/python3

# pas oublier de skipe les lignes qui commence par ; et split les lignes avec ; et recuper le premier index (pour enlever les commentaires)

import sys
import string
import random
from src.utils import *
from src.labels import obf_labels, randomize_labels
from src.nbrs import obf_numbers, list_alias_nb
from src.strings import obf_strings

def obf_line(file:str, new_file):
    for line in file:
        new_file.write(line)
        
# def main(argv, argc):
# 	if argc != 2:
# 		print_usage()
# 		return
# 	file = open_file(argv[1])
# 	print("argv[1] == ", argv[1])
	# new_file = create_file()
	# new_file.close()
	# obf_labels(argv[1])
	# obf_line(file, new_file)

def main (argv, argc):
	if argc != 3:
		print_usage()
		return 

	labels: dict[str, str] = randomize_labels(argv[1])
	aliases: dict[str, str] = list_alias_nb(argv[2])
	characters = string.ascii_letters + string.digits + string.punctuation
	str_key: str = ''.join(random.choices(characters, k= 12))
	print("str_key ->", str_key)

	# print("labels -> ", labels)
	# print()
	# print("labels -> ", aliases)
	# return 
	final_file: str = ""

	with open(argv[1], "r") as r_file, open("obf_file.asm", "w") as w_file:
		for line in r_file:
			final_line: str = obf_labels(line, labels)
			final_line = obf_strings(final_line, str_key)
			final_line = obf_numbers(final_line, aliases)
			final_file += final_line
		w_file.write(final_file)
	final_file = ""
	
	with open(argv[2], "r") as r_file, open("obf_file.inc", "w") as w_file:
		for line in r_file:
			final_line: str = obf_labels(line, labels)
			final_file += final_line
		w_file.write(final_file)
		

if __name__ == "__main__":
	main(sys.argv, len(sys.argv))