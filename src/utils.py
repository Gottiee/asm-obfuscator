def print_usage():
    print("Usage: ./asm-obfuscator.py \"file_to_obf.asm\" \"output_file.asm\" \"include.inc\"")
    print("quit")

def print_insert():
    print("To work correctly, you need to add a commentary \"; insert\" to specified where the script can add obfuscate functions")
    print("quit")

def open_file(file_name:str):
    with open(file_name, "r") as file:
        return file.read()

def create_file(path):
    f = open(path, "w")
    return f

