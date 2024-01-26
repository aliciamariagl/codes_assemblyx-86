%include "io.inc"

section .data
num0 dd 1
num1 dd 1
result dd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4, edx
    dec edx
    
    mov eax, [num0]
    mov ebx, [num1]
    push eax
    push ebx
    call fib
    
    add esp, 8
    PRINT_UDEC 4, eax
    xor eax, eax
    ret
    
    
    
    
    fib:
    enter 0,0
    cmp edx, 0
    je final
    add eax, ebx
    mov ebx, [ebp+12]
    push eax
    push ebx
    dec edx
    call fib
    
    
    final:
    leave
    ret
    
    
    