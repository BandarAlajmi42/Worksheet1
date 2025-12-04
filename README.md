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

### Task 1.2: Subtraction (Variation)
**File**: `src/task1_2.asm`
Subtracts two integers (50 - 20) and prints the result.
- Similar to Task 1.1 but uses `sub` instruction.

## Task 2: Loops and Conditionals

### Task 2.1: Welcome Message Loop
**File**: `src/task2_1.asm`
Asks the user for their name and a count (50-100), then prints a welcome message that many times.
- **Input Validation**: Checks if count is > 50 and < 100 using `cmp` and conditional jumps (`jle`, `jge`).
- **Loop**: Uses `loop` instruction with `ecx` register to repeat the message.

### Task 2.2: Array Sum
**File**: `src/task2_2.asm`
Initializes an array of 100 elements with values 1-100, sums them, and prints the result.
- **Initialization**: Loops 100 times, storing values into memory using indirect addressing `[edi]`.
- **Summation**: Loops through the array again, adding values to `eax`.

### Task 2.3: Range Sum
**File**: `src/task2_3.asm`
Extends Task 2.2 to ask the user for a start and end index, then sums the array elements within that range.
- **Input**: Reads start and end indices.
- **Validation**: Checks if start >= 0, end < 100, and start <= end.
- **Calculation**: Calculates the number of elements to sum and the starting memory address dynamically.

## Notes
- The code uses `asm_io.inc` for I/O operations.
- The `driver.c` acts as the entry point, calling `asm_main`.
- Compiled with `nasm` (ELF format) and linked with `gcc` (32-bit mode).
