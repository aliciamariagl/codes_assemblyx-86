%include "io.inc"

section .data
str1 dd "%d", 0


section .bss
num1 resd 1 


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    push num1
    push str1
    call scanf
    add esp,8
    
    push dword[num1] 
    
    mov eax, [num1]
    mov ebx, 0
    mov ecx, [num1]
    cmp eax, 0
    ja fat
    mov eax, 1
    fim:
    PRINT_UDEC 4, eax
    xor eax, eax
    ret
    
    
    ;============================================
    fat:
    push ecx
    cmp ecx, 1
    ja mult
    jmp fim
    
    
    ;============================================
    mult:
    dec ecx
    l1:
    add ebx, eax
    loop l1
    mov eax, ebx
    pop ecx
    dec ecx
    mov ebx, 0
    jmp fat