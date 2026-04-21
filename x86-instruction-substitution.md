# Instruction Substitution Techniques

Details on how each x86_64 instruction is replaced by an obfuscated equivalent using alternative CPU instructions.

## Calling Convention for Obfuscated Functions

The first value pushed onto the stack is the first parameter.

- **Before the call:**
    - if the return value is not stored in `rax`, or `rax` is a parameter: `push rax`
    - otherwise: `nop`
    - Push required values onto the stack
    - `call` the function
- **Inside the function:**
    - Push registers that will be modified
    - Load parameters from the stack:
      `mov rax, [rsp + 16 + x]` where 16 accounts for the pushed registers + the return address pushed by `call`, and `x` is a multiple of 8 for each additional pushed register
    - Execute the obfuscated logic
    - Store return value in `rax`
    - Pop saved registers
    - `ret`
- **After the call:**
    - Pop the original arguments
    - if `rax` was pushed and the return register is not `rax`: `mov dest, rax` then `pop rax`
    - if `rax` was pushed and the return register is `rax`: `add rsp, 8`
    - if `rax` was not pushed: `nop`

**Example:**

```asm
; Load the result of the function into rbx
push rax            ; save rax
push rbx            ; param
push rcx            ; param
call modify_x
pop rcx
pop rbx
mov rbx, rax
pop rax

_modify_x:
    push r11        ; register modified inside the function
    push r12        ; register modified inside the function
    mov r11, [rsp + 16 + 16]   ; param rbx
    mov r12, [rsp + 8 + 16]    ; param rcx

    add r11, r12    ; obfuscated logic here

    mov rax, r11    ; return value
    pop r12
    pop r11
    ret
```

## mov

### Variant 1 — BEXTR (Bit Field Extract)

```asm
bextr dest, src, control
dest = ExtractBits(src, control)
```

- **dest**: destination register (stores the result)
- **src**: source register (bits are extracted from here)
- **control**: specifies the start bit and length to extract

```c
// Bits 0-7  = Start (bit offset in src)
// Bits 8-15 = Length (number of bits to extract)
start  = control & 0xFF
length = (control >> 8) & 0xFF
```

By setting start=0 and length=64, this effectively copies the full 64-bit value — equivalent to `mov`.

```asm
; mov rcx, rbx
push rax                ; save rax
push rbx                ; param
call _mov1
mov rcx, rax
pop rbx
pop rax

_mov1:
    push rcx
    push rdx
    mov rcx, [rsp + 8 + 16]

    mov rdx, (64 << 8) | 0     ; extract all 64 bits
    bextr rax, rcx, rdx        ; effectively: mov rax, rcx

    pop rdx
    pop rcx
    ret
```

### Variant 2 — BZHI (Zero High Bits)

Clears all bits above a given position. With index=-1, all bits are preserved — equivalent to a full copy.

```asm
BZHI dest, src, index
; dest = src & ((1 << index) - 1)
```

```asm
; mov rax, rcx
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

### Variant 3 & 4 — CMPXCHG (Compare and Exchange)

```asm
cmpxchg reg_dest, reg_src
```

Compares the accumulator (RAX) with `reg_dest`:
- If equal: `reg_dest = reg_src`
- If not equal: `RAX = reg_dest`

Flags: ZF=1 if equal (exchange performed), ZF=0 otherwise.

**Variant 3:**

```asm
; mov r12, rcx
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
    cmpxchg rbx, rcx       ; RAX != rbx, so RAX = rbx

    pop rbx
    pop rcx
    ret
```

**Variant 4:**

```asm
; mov rcx, r12
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
    cmpxchg rbx, rcx       ; RAX == rbx (both 0), so rbx = rcx
    mov rax, rbx
    pop rcx
    pop rbx
    ret
```

## add

### ADC (Add With Carry)

```asm
ADC destination, source
; destination = destination + source + CF
```

Carry flag control instructions:

```asm
CLC     ; Clear Carry Flag  (CF=0)
STC     ; Set Carry Flag    (CF=1)
CMC     ; Complement Carry Flag (invert CF)
```

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

    test rcx, rcx           ; is rcx == 0?
    jnz sub
    jnc do_adc
    jmp reverseCF

    sub:
    sub rcx, 1
    jnc reverseCF           ; CF not set -> need to set it
    jmp do_adc
    reverseCF:
    cmc                     ; complement CF, making it 1
    do_adc:
    adc rax, rcx            ; RAX = RAX + rcx + CF

    pop rcx
    ret
```

## test

### BSF (Bit Scan Forward)

Scans the source operand from LSB to MSB (bit 0 to bit 63). Finds the index of the first set bit and stores it in the destination.

Key property: if source == 0, ZF is set to 1 — same behavior as `test reg, reg`.

```asm
mov rax, 0b00010000    ; Bit 4 is set
bsf rcx, rax           ; RCX = 4, ZF = 0
```

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

    bsf rdx, rax       ; if rax == 0: ZF = 1, else: ZF = 0

    pop rax
    pop rdx
    ret
```

## Stack Frame Setup

### ENTER

Compact replacement for the common function prologue:

```asm
; push rbp
; mov rbp, rsp
; sub rsp, 32

enter 32, 0
```

## ZF (Zero Flag)

### BSF for ZF manipulation

```asm
bsf rdx, rax
```
- If RAX == 0: ZF = 1
- If RAX != 0: ZF = 0, RDX = index of the first set bit

## References

- [x86 Instruction Reference](https://www.felixcloutier.com/x86/)
