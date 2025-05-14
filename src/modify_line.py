def modify_mov(line:str, raw_line:str):
    get_prefix(raw_line)


def switch_instruction(line:str, raw_line:str, new_file):
    instruction = line.split(" ")[0]
    match instruction:
        case "mov":
            modify_mov(line, raw_line)
            new_file.write(raw_line)
        case _:
            new_file.write(raw_line)

def get_prefix(s:str):
    prefix = ""
    for char in s:
        if char in (" ", "\t"):
            prefix += char
        else:
            break
    return prefix

def commentary(raw_line:str, new_file) -> str | None:
    line = raw_line.lstrip(" \t")
    line = line.rstrip(" \t")
    if line.startswith(";"):
        new_file.write(raw_line)
        return
    splited = raw_line.split(";")
    if len(splited) >= 2:
        prefix = get_prefix(raw_line)
        new_file.write(prefix + "; " + "".join(splited[1:]))
        return splited[0] + "\n"
    return raw_line

def modify_line(raw_line:str, new_file):
    raw_line += "\n"
    no_comm_line = commentary(raw_line, new_file)
    if no_comm_line == None:
        return
    line = no_comm_line.lstrip(" \t")
    line = line.rstrip(" \t")
    switch_instruction(line, no_comm_line, new_file)