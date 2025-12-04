%include "asm_io.inc"

segment .data
    sum_msg db "The sum of the array is: ", 0

segment .bss
    array resd 100

segment .text
    global asm_main

asm_main:
    enter 0,0
    pusha

    mov ecx, 100
    mov edi, array
    mov eax, 1

init_loop:
    mov [edi], eax
    add edi, 4
    inc eax
    loop init_loop

    mov ecx, 100
    mov edi, array
    mov eax, 0
    mov ebx, 0

sum_loop:
    add eax, [edi]
    add edi, 4
    loop sum_loop

    push eax
    mov eax, sum_msg
    call print_string
    pop eax
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret
