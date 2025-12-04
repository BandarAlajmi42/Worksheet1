# Worksheet 1: An echo of Assembler

This repository contains the solutions for Worksheet 1, implementing various Assembly language programs.

## Directory Structure
- `src/`: Contains all source code (`.asm`, `.c`, `.inc`)
- `Makefile`: Build configuration

## Building the Programs
To build all programs, run:
```bash
make
```
This will create the following executables in the root directory:
- `task1`
- `task1_2`
- `task2_1`
- `task2_2`
- `task2_3`

To clean build artifacts:
```bash
make clean
```

## Task 1: Basic Assembler

### Task 1.1: Add Two Integers
**File**: `src/task1.asm`
Adds two integers defined in the data section (10 and 20) and prints the result.
- Uses `mov` to load values.
- Uses `add` to perform addition.
- Uses `print_int` from `asm_io` to display the result.
  <img width="626" height="44" alt="task1" src="https://github.com/user-attachments/assets/e801e9ae-a70f-4897-95be-6fd591707390" />


### Task 1.2: Subtraction (Variation)
**File**: `src/task1_2.asm`
Subtracts two integers (50 - 20) and prints the result.
- Similar to Task 1.1 but uses `sub` instruction.
<img width="650" height="42" alt="task1_2" src="https://github.com/user-attachments/assets/0317685f-dcff-4381-be0e-4b53671f46fe" />

## Task 2: Loops and Conditionals

### Task 2.1: Welcome Message Loop
**File**: `src/task2_1.asm`
Asks the user for their name and a count (50-100), then prints a welcome message that many times.
- **Input Validation**: Checks if count is > 50 and < 100 using `cmp` and conditional jumps (`jle`, `jge`).
- **Loop**: Uses `loop` instruction with `ecx` register to repeat the message.
<img width="604" height="959" alt="task2_1" src="https://github.com/user-attachments/assets/24211d5e-032c-4ac7-86fc-e99194869c99" />

### Task 2.2: Array Sum
**File**: `src/task2_2.asm`
Initializes an array of 100 elements with values 1-100, sums them, and prints the result.
- **Initialization**: Loops 100 times, storing values into memory using indirect addressing `[edi]`.
- **Summation**: Loops through the array again, adding values to `eax`.
<img width="600" height="34" alt="task2_2" src="https://github.com/user-attachments/assets/cc05bb8a-dd92-42f3-8ee8-e1285a289ca8" />

### Task 2.3: Range Sum
**File**: `src/task2_3.asm`
Extends Task 2.2 to ask the user for a start and end index, then sums the array elements within that range.
- **Input**: Reads start and end indices.
- **Validation**: Checks if start >= 0, end < 100, and start <= end.
- **Calculation**: Calculates the number of elements to sum and the starting memory address dynamically.
<img width="628" height="67" alt="task2_3 invalid case" src="https://github.com/user-attachments/assets/0b4564eb-03b0-4a02-b5ae-0cfbfeca5e41" />
<img width="581" height="74" alt="task2_3 valid" src="https://github.com/user-attachments/assets/c6a07bdf-d210-4426-90ec-62848f3b8782" />

## Notes
- The code uses `asm_io.inc` for I/O operations.
- The `driver.c` acts as the entry point, calling `asm_main`.
- Compiled with `nasm` (ELF format) and linked with `gcc` (32-bit mode).
