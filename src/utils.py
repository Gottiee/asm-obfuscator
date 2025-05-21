def print_usage():
    print("Usage: ./asm-obfuscator.py \"file_to_obf.asm\" \"include.inc\"")
    print("quit")

def open_file(file_name:str):
    with open(file_name, "r") as file:
        return file.read()

def create_file():
    f = open("asm/obf.asm", "w")
    return f