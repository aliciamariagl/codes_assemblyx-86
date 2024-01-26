extern printf
extern scanf
%include "io.inc"


section .data
Base db 1
dd Dom
Entrada EQU ($ - Base)
db 2
dd Segunda
db 3
dd Ter
db 4
dd Qua
db 5
dd Qui
db 6
dd Sex
db 7
dd Sab
tam EQU ($ - Base)/Entrada
msg1 db "Domingo", 0
msg2 db "Segunda-feira", 0
msg3 db "Terca-feira", 0
msg4 db "Quarta-feira", 0
msg5 db "Quinta-feira", 0
msg6 db "Sexta-feira", 0
msg7 db "Sabado", 0
msgInvalido db "Dia Invalido", 0
fms db "%d", 0  


section .bss
dia resw 1


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    push dia
    push fms
    call scanf
    add esp, 8
    
    mov eax,[dia]
    mov ecx, tam
    mov ebx, Base
    
    l1:
    cmp al, [ebx]
    je printa
    add ebx, Entrada
    loop l1
    
    push msgInvalido
    call printf
    add esp, 4
    
    fim:
    xor eax, eax
    ret
    
    printa:
    call [ebx+1]
    
    push edx
    call printf
    add esp, 4
    
    jmp fim
    
    Dom:
    mov edx, msg1
    ret
    
    Segunda:
    mov edx, msg2
    ret
    
    Ter:
    mov edx, msg3
    ret
    
    Qua:
    mov edx, msg4
    ret
    
    Qui:
    mov edx, msg5
    ret
    
    Sex:
    mov edx, msg6
    ret
    
    Sab:
    mov edx, msg7
    ret