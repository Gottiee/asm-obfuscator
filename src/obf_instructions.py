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
        pass
    
    def mov(self, op1, op2):
        self.ret_reg = op1
        self.arg.append(op2)
        self.before_function()        

        # 4 mov diff choisi au hasard
        if (len(self.mov_tab) == 4):
            self.mov_tab = []
        # n = random.randint(0, 3)
        # while f"mov{n}" in self.mov_tab:
        #     n = random.randint(0, 3)
        n = 0
        func = f"mov{n + 1}"
        self.mov_tab.append(func)
        self.file.write(f"call {func}\n")
        self.after_function()
        if not func in self.fct_write:
            self.fct_write.append(func)


    def before_function(self):
        if (self.ret_reg and self.ret_reg != "rax"):
            self.file.write("push rax\n")
        for op in self.arg:
            self.file.write(f"push {op}")
    
    def after_function(self):
        for op in reversed(self.arg):
            if op == "rax":
                self.write("add rsp, 8\n")
            else:
                self.file.write(f"pop {op}")
        if (self.ret_reg and self.ret_reg != "rax"):
            self.file.write(f"mov rax, {self.ret_reg}\n")
            self.file.write(f"pop rax\n")


    def mov1(self):
        return ("mov1:\npush rcx\npush rdx\nmov rcx, [rsp + 8 + 16]\n\nmov rdx, (64 << 8) | 0  ; flag pour le mov de bextr\nbextr rax, rcx, rdx ; mov rax, rcx\n\npop rdx\npop rcx\nret\n")

    def return_functions(self):
        string = ""
        for func in self.fct_write:
            function = getattr(self, func, None)
            string += function()
        return string

    def insert_functions(self, path):
        with open(path, "r") as f:
            contents = f.readlines()

        for i, line in enumerate(contents):
            if ("; insert" in line):
                break
        contents.insert(i + 1, self.return_functions())
        with open(path, "w") as f:
            contents = "".join(contents)
            f.write(contents)