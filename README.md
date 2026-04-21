# asm-obfuscator

A Python-based obfuscator for x86_64 NASM assembly. It transforms readable assembly source code into a functionally equivalent but significantly harder-to-reverse-engineer version through multiple obfuscation passes.

## Features

| Technique | Description |
|-----------|-------------|
| [Label randomization](#1-label--variable-randomization) | Labels and variable names replaced with random strings |
| [Struct randomization](#1-label--variable-randomization) | Struct names and field names renamed |
| [String encryption](#2-string-encryption) | XOR encryption with random key, runtime decryption via `mmap` |
| [Number alias resolution](#3-number-alias-resolution) | `%define` constants replaced with raw hex values |
| [Integer table](#4-integer-table) | All numeric literals stored in a byte table mapped at runtime |
| [Instruction substitution](#5-instruction-substitution) | `mov`, `add` replaced with equivalent alternative x86 instructions |
| [Comment extraction](#6-comment-extraction--indentation-stripping) | Inline comments separated from code |
| [Indentation stripping](#6-comment-extraction--indentation-stripping) | All whitespace formatting removed |

## Usage

```sh
./asm-obfuscator.py <input.asm> <input.inc> <output.asm>
```

This produces:
- `<output.asm>` — the obfuscated assembly source
- `obf_file.inc` — the obfuscated include file

> Read the [Prerequisites](#prerequisites) section before running the script.

---

## Obfuscation Techniques

### 1. Label & Variable Randomization

All labels (except `_start`) and variable names are replaced with random 5-10 character alphanumeric strings. Struct names and their field names from the `.inc` file are also renamed. All references throughout the code are updated to match.

```asm
; Before                              ; After
_my_loop:                             wbmHeFlp:
    jmp _my_loop                          jmp wbmHeFlp

num dq 25                             pDRozdEyG dq 0x19

struc famine                          struc hfyGa0cwF
    .pwdPtr resq 1                        .u398yKU: resq 1
endstruc                              endstruc
```

### 2. String Encryption

All strings declared with `db` are encrypted using a **XOR algorithm with a randomly generated 12-character symmetric key**. Each string is converted to its byte representation, then each byte is XOR'd with a cycling key character:

```
encrypted[i] = plaintext[i] XOR key[i % key_len]
```

The encrypted result is written as raw hex bytes. The key variable itself is also replaced with its encrypted byte form.

```asm
; Before
key db "mykey", 0
dir1 db "ssh-ed", 0

; After
Bd0uGw7Dbe db 0x11, 0x3D, 0x56, 0x36, 0x78, 0x39, 0x15, 0x4B, 0x1A, 0x4B, 0x42
Q0yOb3 db 0x6D, 0x30, 0x41, 0x30, 0x35, 0x29, 0x26, 0x31, 0x01, 0x3B, 0x1D, 0x2C
```

At runtime, strings are decrypted by `_decrypt_str()` which allocates a new memory region via `mmap`, XOR-decrypts into it, and returns the address in `rax`.

### 3. Number Alias Resolution

All `%define` constants from the `.inc` file (e.g. `SYS_READ`, `PROT_WRITE`) are replaced in-place with their raw hexadecimal value. This removes symbolic names that would help a reverse engineer understand the code's intent.

```asm
; Before
add r8, FINJMP_OFF          ; FINJMP_OFF is %define'd as 69 in .inc

; After
add r8, 0x45
```

### 4. Integer Table

This is the most involved obfuscation. **Every numeric literal** in the code is collected and stored in a runtime-mapped byte table, so that no raw constant appears in any instruction.

**How it works:**

1. **Collection** — The script scans the entire `.asm` file and collects every unique number (both hex literals and resolved `%define` values) into an ordered list. The list is padded to a multiple of 4 with random values.

2. **Table generation** — The `_map_int_table()` function is generated. It uses `mmap` to allocate `len(numbers) * 4` bytes, then writes **4 separate byte layers**:

   ```
   Layout (N = number of collected values):

   Offset 0..N-1      → byte 3 (MSB) of each number
   Offset N..2N-1     → byte 2 of each number
   Offset 2N..3N-1    → byte 1 of each number
   Offset 3N..4N-1    → byte 0 (LSB) of each number
   ```

   Each number is split into its 4 constituent bytes (big-endian) and each byte is stored at the corresponding layer offset. The bytes are written 4 at a time as `dword` values for efficiency.

3. **Address storage** — The base address of the table is stored in the `xmm15` SSE register (`movq xmm15, rax`), keeping it out of the general-purpose registers.

4. **Value reconstruction** — When the original code had `mov reg, 0x45`, it is replaced with a sequence that reconstructs the value byte-by-byte from the table:

   ```asm
   ; Original: mov rax, 0x45

   push r15
   push r14
   movq r15, xmm15                    ; load table base address
   movzx r14, byte [r15 + idx]        ; byte 3 (MSB)
   shl r14, 0x18                      ; shift to bits 31-24
   mov rax, r14
   movzx r14, byte [r15 + idx + N]    ; byte 2
   shl r14, 0x10                      ; shift to bits 23-16
   or rax, r14
   movzx r14, byte [r15 + idx + 2N]   ; byte 1
   shl r14, 0x8                       ; shift to bits 15-8
   or rax, r14
   movzx r14, byte [r15 + idx + 3N]   ; byte 0 (LSB)
   or rax, r14                        ; bits 7-0
   pop r14
   pop r15
   ```

   Where `idx` is the number's position in the collected list and `N` is the total count of numbers.

This makes static analysis significantly harder: no raw constants are visible, and the table itself is only populated at runtime.

### 5. Instruction Substitution

Common instructions are replaced by calls to generated helper functions that achieve the same result using alternative x86 instructions. The functions are inserted at the `;;**;;` marker in the source.

| Original | Variants | Technique |
|----------|----------|-----------|
| `mov` | 4 | `BEXTR` (bit field extract), `BZHI` (zero high bits), `CMPXCHG` (compare & exchange) |
| `add` | 1 | `ADC` (add with carry) + carry flag manipulation via `CMC` |
| `test` | 1 | `BSF` (bit scan forward) to set ZF *(currently disabled)* |

Each `mov` occurrence randomly picks one of the 4 variants (cycling through all 4 before repeating). Arguments are passed via the stack, and the calling convention handles saving/restoring registers automatically.

For detailed documentation of each variant, see [x86-instruction-substitution.md](x86-instruction-substitution.md).

### 6. Comment Extraction & Indentation Stripping

- Inline comments (after `;`) are extracted and placed on a separate line above the instruction
- All leading whitespace/indentation is stripped during processing

---

## Prerequisites

### Marker for generated functions

The assembly source must contain the marker `;;**;;` on its own line. The obfuscator inserts generated helper functions (instruction substitutions + `_map_int_table` + `_decrypt_str`) at this location. Place it somewhere that won't break execution flow (e.g. after your exit syscall).

### Key variable

A variable named `key` must exist in the source:

```asm
key db "mykey", 0
```

Its name will be randomized and its value replaced with the generated encryption key.

### Integer table mapping function

A stub for the integer table mapper must be present:

```asm
_map_int_table:

```

The obfuscator generates the full function body. Call it early in your program — the table address is stored in `xmm15` and used automatically by obfuscated number lookups.

### String decryption function

A `_decrypt_str` function must be present in your source code. It uses `mmap` to allocate memory and XOR-decrypts strings at runtime.

**Prototype:** `rax: char *_decrypt_str(rdi: char *to_decrypt, rsi: int len)`

The returned `rax` points to a newly `mmap`'d buffer. **It is up to the caller to `munmap` it after use.**

## Building the obfuscated output

```sh
# Obfuscate
./asm-obfuscator.py source.asm source.inc output.asm

# Assemble & link (example)
nasm -f elf64 -i srcs/ output.asm -o output.o
ld -o binary output.o
```

## Project Structure

```
asm-obfuscator/
├── asm-obfuscator.py                   # Entry point
├── src/
│   ├── utils.py                        # File I/O helpers
│   ├── labels.py                       # Label & variable randomization
│   ├── strings.py                      # String encryption & decryption codegen
│   ├── nbrs.py                         # Number alias extraction & replacement
│   ├── int_gen.py                      # Integer table generation
│   ├── struc.py                        # Struct/field name obfuscation
│   ├── parser.py                       # Line-level instruction parsing & routing
│   └── obf_instructions.py             # Instruction substitution engine
└── x86-instruction-substitution.md     # Detailed notes on instruction techniques
```

## References

- [x86 Instruction Reference](https://www.felixcloutier.com/x86/)
