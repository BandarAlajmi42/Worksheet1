%include "asm_io.inc"

segment .data
    prompt_name db "Enter your name: ", 0
    prompt_count db "Enter number of times to print (50-100): ", 0
    welcome_msg db "Welcome ", 0
    error_msg db "Error: Number must be between 50 and 100", 0

segment .bss
    name resb 100
    count resd 1

segment .text
    global asm_main

asm_main:
    enter 0,0
    pusha

    mov eax, prompt_name
    call print_string
    
    mov edi, name
read_loop:
    call read_char
    cmp al, 10
    je read_done
    mov [edi], al
    inc edi
    jmp read_loop
read_done:
    mov byte [edi], 0

    mov eax, prompt_count
    call print_string
    call read_int
    mov [count], eax

    mov eax, [count]
    cmp eax, 50
    jle invalid_input
    cmp eax, 100
    jge invalid_input

    mov ecx, [count]
print_loop:
    mov eax, welcome_msg
    call print_string
    mov eax, name
    call print_string
    call print_nl
    loop print_loop
    jmp end_program

invalid_input:
    mov eax, error_msg
    call print_string
    call print_nl

end_program:
    popa
    mov eax, 0
    leave
    ret
