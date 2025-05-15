# asm-obfuscator
> Python script that obfusacates an assembly file

## Summary
- [Usage](#usage)
- [Presentation](#presentation)
- [Prerequisites](#prerequisites)


## Usage
```sh
./asm-obfuscator.py /path/to/.asm /path/to/.inc
```
This will produce two files : *obf_file.asm* and *obf_file.inc* containing the obfuscate version of each file.  
> Please, read the [Prerequisites](#prerequisites) before running the script

## Presentation
The script will read through the two files given as arguments to :  
- Suppress all indentation
- Randomize variables names :
	- ```num dq 25``` -> ```pDRozdEyG dq 0x45```  
	- ``` struc famine .pwdPtr resq    1 endstruc``` -> ```struc hfyGa0cwF .u398yKU:  resq 1 endstruc```
- Randomize labels names (except _start) :
	- ```_ALabel:``` -> ```wbmHeFlp:```  
	- ```jmp _ALabel``` -> ```jmp wbmHeFlp```  
- Encrypt and obfuscate strings :
	- encryption uses a random generated symmetrical key xor algorithm
	- Obfuscation is done by splitting a string in bytes
	- strings will be decrypted using a function that has to be implemented in .asm file
	- ```string db "ASimpleString", 0``` -> ```Q0yOb3 db 0x6D, 0x30, 0x41, 0x30, 0x35, 0x29, 0x26, 0x31, 0x01, 0x3B, 0x1D, 0x2C, 0x4B, 0x63```  
- Obfuscate numbers :
	- Replace number aliases by raw value
	- ```add r8, FINJMP_OFF``` -> ```add r8, 0x45```
	- (Put int generator)

## Prerequisites

### Strings en/decryption :
The strings once encrypted will have to be decrypted before use. To do so, the following function has to be copied in the source code. The encryption is using a *xor algorithm* with a symmetrical key. 
```asm
; rax: char *_decrypt_str(rsi: char *to_decrypt, rdi: len)
_decrypt_str:
	; rax	== div quotient
	; rbx	-> to_decrypt
	; rcx	== counter
	; rdx	== div modulo
	; r9	== len key
	; r10	-> key_char
	; r11	-> decrypted str (mmap)
	; r12	== len to_decrypt
	; rsi	-> key
	push rbx
	push rcx
	push rdx
	push r8
	push r9
	push r10
	push r11
	push r12
	mov rbx, rdi
	mov r12, rsi
    xor rdi, rdi                    ; addr = NULL (let kernel choose)
    mov rdx, 0x03                      ; PROT_READ | PROT_WRITE = 1 | 2 = 3
    mov r10, 0x22                   ; MAP_PRIVATE | MAP_ANONYMOUS = 0x2 | 0x20 = 0x22
    mov r8, -1                      ; fd = -1
    xor r9, r9                      ; offset = 0
    mov rax, 9                      ; syscall number for mmap
    syscall
	cmp rax, 0
	jl _decrypt_loop_end
	mov r11, rax
	lea rsi, key
	call _strlen
	mov r9, rax
	xor rcx, rcx
	xor rdx, rdx
	_decrypt_loop:
		cmp rcx, r12
		jge	_decrypt_loop_end
		mov rax, rcx
		xor rdx, rdx
		cmp rcx, 0
		jne _no_zero
		xor rax, rax
		jmp _end_div
		_no_zero:
		div r9
		_end_div:
		movzx r10, byte [rsi + rdx]	; r10 == key[rcx % key_len]
		xor r10b, [rbx + rcx]
		mov [r11 + rcx], r10b
		inc rcx
		jmp _decrypt_loop
	_decrypt_loop_end:
		mov rax, r11
		pop r12
		pop r11
		pop r10
		pop r9
		pop r8
		pop rdx
		pop rcx
		pop rbx
		ret
```
- A specific variable as to be present in the code before running the script: ```key db "mykey"```  
This variable's name will be randomize and its value will be replaces by the key  
```key db "mykey", 0``` -> ```Bd0uGw7Dbe db 0x11, 0x3D, 0x56, 0x36, 0x78, 0x39, 0x15, 0x4B, 0x1A, 0x4B, 0x42```  
- As the "prototype" ```rax: char *_decrypt_str (rdi: char* to_decrypt, rsi: int len)``` describes, the returns value is stocked in ```rax```. This returns value is an address pointing at a **new allocated map** containing the decrypted string. Registers used in ```_decrypt_str``` are handled by the function.  
> **It is up to the user to handle the ```rax``` register and ```unmap``` the new allocated map**.   

### Number obfuscation
> This is done with a "int generator"

The "int generator" is a table containing all raw numbers in the code.
A table containing all raw numbers and labels defining numbers will be mapped at the very beginning of the program. Its address will be stocked in a variable at run time.
When a raw value is in an instruction, the line will be modified to load the value from the table. With this, no raw value is easily readable without running the program.

To map the table, the user must **copy** the following function to its clean code. The function will be then modified by the script.  
It is to the user to call the function and handle the address returned on rax.

```asm
rax: int *_map_int_table( void )
_map_int_table:

```


## Mise en place 

- peut etre qu'il faut stipuler avec un commentarie precis un endroit ou on peut mettre les nouvelles fonctions en etatn sur de ne pas casser le flow d'execution du programmes

## TODO

- [ ] fichier qui parse la ligne `def parse_line(file: str, new_file) -> str | None:`
    - split les lignes en deux et reecrire les commentaire en haut si y'en a et return la str a modifier
- [ ] fichier qui s'occupe de modifier les lignes selon l'instruction (switch l'instruction appel differentes fonctions)
    - `def modify_asm(line:str, new_file):`
- [x] fichier qui modifie les labels (prendre le fichier complet en entree)
- [x] obfuscateur de string
    - meme algo
    - meme clee
    - pas ecrire la clee en dur
- [ ] createur de int
    - mov rax, rsp + 0x56
    - mmap un tableau de int [2,2,3,3,5,5,1,3,3,60,6]
    - push dans la fonction start l'address du tableau
- [ ] control flow flattening
    - mdr jamais

exemple control flow flattening
```py
fonction b(
)

fonction a (
)

a()
b()

fonction ab(param)
{
    switch param
    case(a.1)
        param + 2
        ab(param)
    case(b.1)
        param + 2
        ab(param)
        ...
    case(a.2)
        ...
    case(b.2)
        ...
}
ab(b.1)
ab(a.1)
```
