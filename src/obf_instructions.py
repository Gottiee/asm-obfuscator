import random

class ObfInstructions:
	def __init__(self, file):
		self.ret_reg = None
		self.arg = []
		self.file = file
		# tableau qui recapitules les fonctions que j'ai ecrites pour les copier a la fin
		self.fct_write = []
		# tableau pour recapituler les differents mov ecrite dans le desordre mais au moins tous ecris
		self.mov_tab = []
		self.reg = [
			# Registres généraux
			"al", "ah", "ax", "eax", "rax",
			"bl", "bh", "bx", "ebx", "rbx",
			"cl", "ch", "cx", "ecx", "rcx",
			"dl", "dh", "dx", "edx", "rdx",

			# Registres supplémentaires
			"sil", "si", "esi", "rsi",
			"dil", "di", "edi", "rdi",
			"bpl", "bp", "ebp", "rbp",
			"spl", "sp", "esp", "rsp",

			# Registres étendus (R8-R15)
			"r8b", "r8w", "r8d", "r8",
			"r9b", "r9w", "r9d", "r9",
			"r10b", "r10w", "r10d", "r10",
			"r11b", "r11w", "r11d", "r11",
			"r12b", "r12w", "r12d", "r12",
			"r13b", "r13w", "r13d", "r13",
			"r14b", "r14w", "r14d", "r14",
			"r15b", "r15w", "r15d", "r15",

			# Pointeurs d'instruction / flags (bonus)
			"rip", "eip", "ip",
			"eflags", "rflags"
		]
	
	def mov(self, op1, op2):
		self.ret_reg = op1
		self.arg.append(op2)
		self.before_function()		

		# 4 mov diff choisi au hasard
		if (len(self.mov_tab) == 4):
			self.mov_tab = []
		while True:
			n = random.randint(0, 3)
			func = f"mov{n + 1}"
			if func not in self.mov_tab:
				break
		self.mov_tab.append(func)
		self.file.write(f"call {func}\n")
		self.after_function()
		if not func in self.fct_write:
			self.fct_write.append(func)
		self.clean_tab()

	def add(self, op1, op2):
		self.ret_reg = op1
		self.arg.append(op1)
		self.arg.append(op2)
		self.before_function()
		self.file.write(f"call add1\n")
		self.after_function()
		if not "add1" in self.fct_write:
			self.fct_write.append("add1")
		self.clean_tab()

	def test(self, op1):
		self.arg.append(op1)
		self.before_function()
		self.file.write(f"call test1\n")
		self.after_function()
		if not "test1" in self.fct_write:
			self.fct_write.append("test1")
		self.clean_tab()

	def before_function(self):
		if (self.ret_reg and self.ret_reg != "rax"):
			self.file.write("push rax\n")
		for op in self.arg:
			self.file.write(f"push {op}\n")
	
	def after_function(self):
		for op in reversed(self.arg):
			if op == "rax" or op not in self.reg:
				self.file.write("add rsp, 8\n")
			else:
				self.file.write(f"pop {op}\n")
		if (self.ret_reg and self.ret_reg != "rax"):
			self.file.write(f"mov {self.ret_reg}, rax\n")
			self.file.write(f"pop rax\n")

	def mov1(self):
		return ("mov1:\npush rcx\npush rdx\nmov rcx, qword [rsp + 8 + 16]\n\nmov rdx, (64 << 8) | 0  ; flag pour le mov de bextr\nbextr rax, rcx, rdx ; mov rax, rcx\n\npop rdx\npop rcx\nret\n")
	
	def mov2(self):
		return ("mov2:\npush rcx\npush rdx\nmov rcx, qword [rsp + 8 + 16]\n\nmov rdx, -1\nbzhi rax, rcx, rdx\n\npop rdx\npop rcx\nret\n")
	
	def mov3(self):
		return ("mov3:\npush rcx\npush rbx\nmov rbx, qword [rsp + 8 + 16]\n\nmov rax, 0\nmov rcx, 0x3d42f\ncmpxchg rbx, rcx\n\npop rbx\npop rcx\nret\n")
		
	def mov4(self):
		return ("mov4:\npush rbx\npush rcx\nmov rcx, qword [rsp + 8 + 16]\n\nmov rax, 0\nmov rbx, 0\ncmpxchg rbx, rcx\nmov rax, rbx\npop rcx\npop rbx\nret\n")

	def add1(self):
		return ("add1:\npush rcx\nmov rax, qword [rsp + 16 + 8]\nmov rcx, qword [rsp + 8 + 8]\n\ntest rcx, rcx   ;  is rcx == 0 ?\njnz sub\njnc do_adc\njmp reverseCF\n\nsub:\nsub rcx, 1\njnc reverseCF   ; Jump if Carry Flag is Not set (CF=0)\njmp do_adc  ; Jump to ADC instruction\nreverseCF:   \ncmc ; Complement CF, making it 1\ndo_adc: ; Perform ADC with prepared carry flag\nadc rax, rcx; RAX = RAX + rcx + CF\n\npop rcx\nret\n")

	def test1(self):
		return ("test1:\npush rdx\npush rax\nmov rax, qword [rsp + 8 + 16]\n\nbsf rdx, rax; si rax == 0 ? zf == 1 : zf == 0\n\npop rax\npop rdx\nret\n")

	def return_functions(self):
		string = ""
		for func in self.fct_write:
			function = getattr(self, func, None)
			string += function()
		return string

	def insert_functions(self, path):
		with open(path, "r") as f:
			contents = f.readlines()

		i = 0
		for i, line in enumerate(contents):
			if (";;**;;\n" in line):
				break
		contents.insert(i + 1, self.return_functions())
		with open(path, "w") as f:
			contents = "".join(contents)
			f.write(contents)
			
	def clean_tab(self):
		self.arg = []
		self.ret_reg = None

