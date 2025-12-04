%include "asm_io.inc"

segment .data
    prompt_start db "Enter start index (0-99): ", 0
    prompt_end   db "Enter end index (0-99): ", 0
    error_msg    db "Invalid range!", 0
    sum_msg      db "The sum of the range is: ", 0

segment .bss
    array resd 100
    start_idx resd 1
    end_idx   resd 1

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

    mov eax, prompt_start
    call print_string
    call read_int
    mov [start_idx], eax

    mov eax, prompt_end
    call print_string
    call read_int
    mov [end_idx], eax

    mov eax, [start_idx]
    cmp eax, 0
    jl invalid_range
    
    mov eax, [end_idx]
    cmp eax, 100
    jge invalid_range

    mov ebx, [end_idx]
    cmp eax, ebx
    jg invalid_range

    mov ecx, [end_idx]
    sub ecx, [start_idx]
    inc ecx

    mov edi, array
    mov eax, [start_idx]
    imul eax, 4
    add edi, eax

    mov eax, 0

range_sum_loop:
    add eax, [edi]
    add edi, 4
    loop range_sum_loop

    push eax
    mov eax, sum_msg
    call print_string
    pop eax
    call print_int
    call print_nl
    jmp end_program

invalid_range:
    mov eax, error_msg
    call print_string
    call print_nl

end_program:
    popa
    mov eax, 0
    leave
    ret
