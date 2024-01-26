%include "io.inc"


section .data
ler db "%f", 0xA, 0
escrever db "volume eh %0.2f ", 0xA, 0
quatro dd 4
divisao dd 3

section .bss
raio resd 1
vol resq 1


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    push raio
    push ler
    call scanf
    add esp, 8
    
    call volume
    
    push dword[vol+4]          
    push dword[vol]            
    push escrever                   
    call printf                 
    add esp,12
    
    xor eax, eax
    ret
    
    
    
    
    
    volume:
    
    finit
    fld dword[raio]
    fmul st0,st0
    fmul dword[raio]
    fild dword[quatro]
    fmul st0, st1
    fldpi
    fmul st0, st1
    fild dword[divisao]
    fdivp
    
    fstp qword[vol]
    
    ret