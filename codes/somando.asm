%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4, ebx
    push ebx
    mov eax, 0
    call soma
    pop ebx
    add eax, ebx
    PRINT_UDEC 4, eax
    xor eax, eax
    ret
    
    
    
    
    soma:
    push ebp
    mov ebp, esp
    
    mov ebx, [ebp+8]
    sub ebx, 1
    cmp ebx, 0
    je calc
    push ebx
    call soma
    pop ebx
    
    
    calc:
    mov esp, ebp
    add eax, ebx
    pop ebp
    ret
    