%include "asm_io.inc"

segment .data
    val1 dd 50
    val2 dd 20
    msg  db "The difference is: ", 0

segment .bss

segment .text
    global asm_main

asm_main:
    enter 0,0
    pusha

    mov eax, [val1]
    sub eax, [val2]
    
    push eax
    
    mov eax, msg
    call print_string
    
    pop eax
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret
