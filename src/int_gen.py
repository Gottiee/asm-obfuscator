import re
from src.nbrs import is_hex

def list_all_nb(asm_file: str, obf_numbers: dict[str, str]) -> list[str]:
	all_numbers: list[str] = []

	with open(asm_file, "r") as r_file:
		for line in r_file:
			split_line: list[str] = re.split(r'[ \t\n\,\[\]\(\)]', line)
			split_line = list(filter(len, split_line))
			# print("split_line ->", split_line)
			for word in split_line:
				if (is_hex(word) == True or word.isnumeric() == True) and word not in all_numbers:
					all_numbers.append(word)
					# print("word -> ", word)
					print("all_numbers.append(", word, ")", sep="")
	for nb in obf_numbers.values():
		if nb not in all_numbers:
			all_numbers.append(nb)
			# print("all_numbers.append(", nb, ")", sep="")
	print("\n--------------\nall_numbers ->", all_numbers)
	return all_numbers

def write_tab_map(all_numbers: list[str]) -> str:
	mov_nb:bytearray = bytearray(4)
	l_list = len(all_numbers)
	func: str = '; rax: int *_map_int_table( void )\n_map_int_table:\n	; rax	-> new map\n	push rdi\n	push rsi\npush rdx\npush r10\npush r8\npush r9\nmov rax, SYS_MMAP\nmov	rdi, 0x0\n	mov rsi, ' + str(hex(l_list * 4)) + '\n	mov rdx, PROT_READ | PROT_WRITE\n	mov r10, MAP_SHARED\n	mov r8, -1\n	mov r9, 0x0\n	syscall\n	cmp rax, -1\n	jl _end_map_int\n	movq xmm15, rax\n'

	for byte in range(4):
		for i, nb in enumerate(all_numbers):
			mov_nb[i % 4] = int(nb, 16).to_bytes(4)[byte]
			if i % 4 == 3 or i == l_list:
				func += 'mov qword [rax + ' + str(byte * l_list + (i - 3)) + '], 0x' + str(mov_nb.hex()) + '\n'
				mov_nb = bytearray(4)
	func += '_end_map_int:\npop r9\npop r8\npop r10\npop rdx\npop rsi\npop rdi\nret\n'
	# print('final function ->', func)
	return func

def obf_numbers(line:str, all_numbers: list[str]) -> str:
	clean_word:str = ""
	op_sizes:list[str] = ['qword', 'QWORD', 'dword', 'DWORD', 'word', 'WORD', 'byte', 'BYTE']
	op_size:str = ''
	index:int = ''
	split_line: list[str] = re.split(r'[ \t\n]', line)
	split_line = list(filter(len, split_line))
	# print("split_line -> ", split_line)

	if len(split_line) < 3 or split_line[2][0] == '-':
		return (line)
	elif split_line[1] in op_sizes:
		op_size = split_line[1]
	# int = all_numbers[index] << 24 | all_numbers[index + (len(all_numbers))] << 16 | all_numbers[index + (len(all_numbers) * 2)] << 8 | all_numbers[index + (len(all_numbers) * 3)]
	if split_line[0] != "mov" or len(split_line) > 3:
		return line
		#movq    r10, xmm15        ; Move the address from xmm15 to r10
		#movzx   eax, byte [r10 + offset_first]
		#shl     rax, 24
		#movzx   ecx, byte [r10 + offset_second]
		#shl     rcx, 16
		#or      rax, rcx
		#movzx   ecx, byte [r10 + offset_third]
		#shl     rcx, 8
		#or      rax, rcx
		#movzx   ecx, byte [r10 + offset_forth]
		#or      rax, rcx

	reg_dest = split_line[1][:len(split_line[1]) - 1]
	print('--------------\n line -> ', line)
	print("reg_dest ->", reg_dest)
	try:
		if (len(op_size) == 0):
			index = all_numbers.index(split_line[2])
		else:
			index = all_numbers.index(split_line[3])
# movzx r14, byte [r15 + ' + str(index + len(all_numbers)) + ']\nshl r14, 0x16\nor ' + reg_dest + ', r14\n
		final_line:str = 'push r15\npush r14\nmovq r15, xmm15\nmovzx r14, byte [r15 + ' + str(index) + ']\nshl r14, 0x18\nor ' + reg_dest + ', ' + op_size + ' r14\nmovzx r14, byte [r15 + ' + str(index + len(all_numbers)) + ']\nshl r14, 0x10\nor ' + reg_dest + ', ' + op_size + ' r14\nmovzx r14, byte [r15 + ' + str(index + (len(all_numbers) * 2)) + ']\nshl r14, 0x8\nor ' + reg_dest + ', ' + op_size + ' r14\nmovzx r14, byte [r15 + ' + str(index + (len(all_numbers) * 2)) + ']\nor ' + reg_dest + ', r14\npop r14\npop r15\n'
		print('final_line ->', final_line)
	except:
		final_line:str = line
	# print("final_line -> ", final_line)

	return final_line
