#!/bin/python3

import sys
from src.utils import *
from src.parser import *

def obf_line(file:str, obf):
    insert = None
    for index, line in enumerate(file.splitlines()):
        tmp = modify_line(line, obf)
        if (tmp == True):
            insert = index
    return insert

def main(argv, argc):
    if argc != 2:
        print_usage()
        return
    file = open_file(argv[1])
    new_file = create_file()
    obf = ObfInstructions(new_file)
    obf_line(file, obf)
    new_file.close()
    obf.insert_functions("asm/obf.asm")


if __name__ == "__main__":
    main(sys.argv, len(sys.argv))