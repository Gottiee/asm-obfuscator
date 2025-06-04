# Instruction to modify

## Appelle a un fonction modifier:

L'ordre des parametre passer est le premier push sur la stack = le premier parametre

- avant l'appelle a la fonction
    - if ( la valeur de retour de la fonction n'est pas stocker dans rax || rax est un parametre)
        -  `push rax`
    - else if (pas de valeur de retour)
        - `nop`
    - else
        - `nop`
    - push les valeurs necessaire sur la stack
    - appeller la fonction (call)
- dans la fonction:
    - push les registres qu'on va modifier
    - charger les parametre de la fonction stocké dans la stack
    - `mov rax, [rsp + 16 + x]` ou 16 correspond au paramettre push sur la stack en sautant rip push avec l'instruction call precedement et x correspond a un multiple de 8 du nombre de registre que tu as pop sur la stack
    - `mov rdx, [rsp + 8 + x]`
    - ... ect selon le nombre de param passee
    - code ici
    - valeur de retour dans rax
    - pop les registre
    - ret
- apres l'appelle a la fonction
    - pop les arguments passer a l'origine
    - if (`push rax` avant && rax != le registre dans lequel on sauvegarde la valeur de retour)
        - `mov rax, x` ou x est le registre dans le quel on veut enregistrer la valeur de retour de la fonction
        - `pop rax`
    - else if (`push rax` avant && rax == le registre dans lequel on sauvegarde la valeur de retour)
        - `add rsp, 8`
    - else (on a pas push `rax)
        - `nop`

pseudo code:

```asm
; je veux load le resultat de ma fonction dans rbx
push rax ; save rax
push rbx ; param
push rcx ; param
call modify_x
pop rcx
pop rbx
mov rax, rbx
pop rax

_modify_x:
    push r11 ; registre qu'on va modifier au cour de la fonction
    push r12 ; registre qu'on va modifier au cour de la fonction
    mov r11, [rsp + 16 + 16] ; param rbx
    mov r12, [rsp + 8 + 16] ; param rcx

    add r11, r12 ; (obf code ici)

    mov rax, r11 ; valeur de retour si besoins
    pop r12
    pop r11
    ret
```

## mov

### BEXTR — Bit Field Extract

```asm
bextr dest, src, control
dest ← ExtractBits(src, control)
```

- dest : registre destination (là où tu stockes le résultat)
- src : registre source (là où tu vas extraire les bits)
- control : registre contrôle, qui indique à partir de quel bit et combien de bits tu veux extraire de src

```c
// Bits 0–7   = Start (décalage de départ dans src)
// Bits 8–15  = Length (combien de bits tu veux extraire)
// Autrement dit :

start  = control & 0xFF
length = (control >> 8) & 0xFF
```

code :

```asm
;mov rcx, rbx
push rax                ; sauvegarde de la valeur de rax
push rbx                ; param 1
call _mov1
mov rcx, rax
pop rbx
pop rax

_mov1:
    push rcx
    push rdx
    mov rcx, [rsp + 8 + 16]

    mov rdx, (64 << 8) | 0      ; flag pour le mov de bextr
    bextr rax, rcx, rdx         ; mov rax, rcx        

    pop rdx
    pop rcx
    ret
```

### BZHI - Bit Zero High Immediate

It clears (zeros) all the bits in a source operand above a certain bit position, specified by another register.

So:

`BZHI dest, src, index`

- Copy bits from src into dest
- Zero all bits starting at bit index and above
- Keep only the lower index bits
- It’s equivalent to: dest = src & ((1 << index) - 1)

```asm
;mov rax, rcx
push rcx
call _mov2
pop rcx

_mov2:
    push rcx
    push rdx
    mov rcx, [rsp + 8 + 16]

    mov rdx, -1
    bzhi rax, rcx, rdx

    pop rdx
    pop rcx
    ret
```

### CMPXCHG — Compare and Exchange

`cmpxchg reg_dest, reg_src`

Cela compare le registre accumulateur (AL/AX/EAX/RAX) avec `reg_dest`.

- Si égal, alors reg_dest ← reg_src
- Sinon, accumulateur ← reg_dest

Et comme toujours :
- ZF = 1 si égal (échange effectué)
- ZF = 0 sinon (pas d’échange)

```asm
;mov r12, rcx
push rax
push rcx
call _mov3
mov r12, rax
pop rcx
pop rax

_mov3:
    push rcx
    push rbx
    mov rbx, [rsp + 8 + 16]

    mov rax, 0
    mov rcx, 0x3dfd3342f
    cmpxchg rbx, rcx

    pop rbx
    pop rcx
    ret
```

```asm
;mov rcx, r12
push rax
push r12
call _mov4
mov rcx, rax
pop r12
pop rax

_mov4:
    push rbx
    push rcx
    mov rcx, [rsp + 8 + 16]
    
    mov rax, 0
    mov rbx, 0
    cmpxchg rbx, rcx
    mov rax, rbx
    pop rcx
    pop rbx
    ret
```

## add

### ADC — Add With Carry

destination = destination + source + CF

Syntax:

```asm
ADC destination, source
```

Pour controller le carry flag:

```asm
CLC             ; Clear Carry Flag - sets CF=0
STC             ; Set Carry Flag - sets CF=1
CMC             ; Complement Carry Flag - inverts the current value of CF
```

code:

```asm
; add rax, rbx
push rax
push rbx
call    _add1
pop rbx
add rsp, 8

_add1:
    push rcx
    mov rax, [rsp + 16 + 8]
    mov rcx, [rsp + 8 + 8]
    
    test rcx, rcx       ;  is rcx == 0 ?
    jnz sub
    jnc do_adc
    jmp reverseCF

    sub:
    sub rcx, 1
    jnc reverseCF       ; Jump if Carry Flag is Not set (CF=0)
    jmp do_adc          ; Jump to ADC instruction
    reverseCF:           
    cmc                 ; Complement CF, making it 1
    do_adc:             ; Perform ADC with prepared carry flag
    adc rax, rcx        ; RAX = RAX + rcx + CF
    
    pop rcx
    ret
```

## test

### BSR — Bit Scan Reverse

`BSF destination, source`

- Scans the source operand from LSB to MSB (i.e., from bit 0 to bit 63 on 64-bit)
- It finds the index of the first set bit (1)
- It stores that bit index in the destination operand.

```asm
mov rax, 0b00010000    ; Bit 4 is set
bsf rcx, rax           ; RCX = 4
```

code

```asm
; test rdx, rdx
push rdx
call _test1
pop rdx
jnz exit


_test1:
    push rdx
    push rax
    mov rax, [rsp + 8 + 16]

    bsf rdx, rax    ; si rax == 0 ? zf == 1 : zf == 0

    pop rax
    pop rdx
    ret
```

## push rbp ; mov rbp, rsp ; sub rsp x

### Enter

The ENTER instruction is used to set up a stack frame for a procedure (function/subroutine). It’s a compact way to prepare space for local variables and optionally create a stack frame chain for nested procedures.

```asm
	;push rbp
    ;mov rbp, rsp
    ;sub rsp 32

    enter 32, 0
```

## ZF

### BSR — Bit Scan Reverse

```asm
bsf rdx, rax
```
- Si RAX == 0 → ZF = 1
- Si RAX != 0 → ZF = 0 et RDX = index du premier bit à 1

## Docu

[asm instruction](https://www.felixcloutier.com/x86/)