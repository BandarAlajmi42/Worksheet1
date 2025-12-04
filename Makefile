CC = gcc
NASM = nasm
CFLAGS = -m32
ASMFLAGS = -f elf -I src/

TARGETS = task1 task1_2 task2_1 task2_2 task2_3

all: $(TARGETS)

task1: src/task1.o src/driver.o src/asm_io.o
	$(CC) $(CFLAGS) $^ -o $@

task1_2: src/task1_2.o src/driver.o src/asm_io.o
	$(CC) $(CFLAGS) $^ -o $@

task2_1: src/task2_1.o src/driver.o src/asm_io.o
	$(CC) $(CFLAGS) $^ -o $@

task2_2: src/task2_2.o src/driver.o src/asm_io.o
	$(CC) $(CFLAGS) $^ -o $@

task2_3: src/task2_3.o src/driver.o src/asm_io.o
	$(CC) $(CFLAGS) $^ -o $@

src/%.o: src/%.asm
	$(NASM) $(ASMFLAGS) $< -o $@

src/driver.o: src/driver.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f src/*.o $(TARGETS)

