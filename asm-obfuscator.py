#!/bin/python3

# pas oublier de skipe les lignes qui commence par ; et split les lignes avec ; et recuper le premier index (pour enlever les commentaires)

import sys
from src.utils import *

def obf_line(file:str, new_file):
    for line in file:
        new_file.write(line)
        

def main(argv, argc):
    if argc != 2:
        print_usage()
        return
    file = open_file(argv[1])
    new_file = create_file()
    obf_line(file, new_file)
    new_file.close()


if __name__ == "__main__":
    main(sys.argv, len(sys.argv))