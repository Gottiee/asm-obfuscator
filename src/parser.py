from src.obf_instructions import ObfInstructions

def modify_mov(line:str, raw_line:str):
	get_prefix(raw_line)

def switch_instruction(line:str, raw_line:str, obf):
	sizes = [
		"byte", "BYTE",
		"word", "WORD",
		"dword", "DWORD",
		"qword", "QWORD",
		"tword", "TWORD",
		"oword", "OWORD",  # 128-bit
		"xmmword", "XMMWORD",  # SSE 128-bit
		"ymmword", "YMMWORD",  # AVX 256-bit
		"zmmword", "ZMMWORD",  # AVX-512 512-bit
		"ptr", "PTR"
	] 

	illegal = [
		"r12d","cl", "r9d", "r8b", "r10b", "r11b", "r13b", "r14b", "al", "rsp"
	]

	instruction = line.split()
	if len(instruction) == 0:
		return
	line = " ".join(instruction[1:])
	arg = line.split(",")
	match instruction[0]:
		case "mov":
			if (instruction[1] in sizes):
				obf.file.write(raw_line)
				return
			elif instruction[2].startswith("FAM") or instruction[2].startswith("INF") or instruction[2] in illegal:
				obf.file.write(raw_line)
				return
			elif instruction[2].endswith("]") and "+" in instruction[2]:
				obf.file.write(raw_line)
				return
			obf.mov(arg[0], arg[1])
		case "add":
			if (instruction[1] in sizes):
				obf.file.write(raw_line)
				return
			elif instruction[2].startswith("FAM") or instruction[2].startswith("INF") or instruction[2] in illegal:
				obf.file.write(raw_line)
				return
			obf.add(arg[0], arg[1])
		# case "test":
		# 	if (arg[0].lstrip(" \t") != arg[1].lstrip(" \t")):
		# 		obf.file.write(raw_line)
		# 		return
		# 	obf.test(arg[0])
		case _:
			obf.file.write(raw_line)
			# print(f"'{raw_line}'")

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
	line = line.rstrip(" \t\n")
	switch_instruction(line, no_comm_line, obf)

