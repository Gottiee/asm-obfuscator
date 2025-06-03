from src.obf_instructions import ObfInstructions

def modify_mov(line:str, raw_line:str):
    get_prefix(raw_line)

def switch_instruction(line:str, raw_line:str, obf):
    line = line.replace(",", "")
    instruction = line.split(" ")
    match instruction[0]:
        case "mov":
            obf.mov(instruction[1], instruction[2])
        case _:
            obf.file.write(raw_line)

def get_prefix(s:str):
    prefix = ""
    for char in s:
        if char in (" ", "\t"):
            prefix += char
        else:
            break
    return prefix

def commentary(raw_line:str, obf) -> str | None:
    line = raw_line.lstrip(" \t")
    line = line.rstrip(" \t")
    if line.startswith(";"):
        obf.file.write(raw_line)
        return
    splited = raw_line.split(";")
    if len(splited) >= 2:
        prefix = get_prefix(raw_line)
        obf.file.write(prefix + "; " + "".join(splited[1:]))
        return splited[0] + "\n"
    return raw_line

def modify_line(raw_line:str, obf):
    raw_line += "\n"
    no_comm_line = commentary(raw_line, obf)
    if no_comm_line == None:
        return
    line = no_comm_line.lstrip(" \t")
    line = line.rstrip(" \t")
    switch_instruction(line, no_comm_line, obf)

