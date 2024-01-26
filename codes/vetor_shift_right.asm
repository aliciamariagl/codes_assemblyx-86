%include "io.inc"

section .data
;array dd 10, 20, 30, 40, 50, 60, 70, 80, 90 ;pode colocar quantos numeros quiser
;tam dd 9                                    ;aqui tem que colocar a quantidade de numeros que tem no vetor        


section .bss
array resd 100000
tam resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    GET_UDEC 4, tam
    mov ecx, [tam]
    mov esi, array
    
    l1:
    
    GET_UDEC 4, [esi]
    add esi, 4
   
    loop l1
    
    mov ecx, [tam]
    dec ecx
    mov esi, array
    mov eax, [esi]
    add esi, 4
    
    l2:
    mov ebx, [esi]
    mov [esi], eax
    mov eax, ebx
    
    add esi, 4
    loop l2
    
    mov esi, array
    mov [esi], eax
    
    mov esi, array
    mov ecx, [tam]
    
    l3:
    
    PRINT_UDEC 4, [esi]
    add esi, 4
    
    loop l3
    
    xor eax, eax
    ret