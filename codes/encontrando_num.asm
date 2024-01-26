%include "io.inc"
extern scanf
extern printf

section .data
ler db "%d", 0ah, 0dh, 0
escrever db "%d", 0ah, 0
contA dd 0
contB dd 0
contC dd 0


section .bss
vetor resd 10
varA resd 1
varB resd 1
varC resd 1
aux resd 1


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    mov ecx, 10
    mov esi, vetor
    
    lendonum:
    push ecx
    
    push esi
    push ler
    call scanf
    add esp, 8
    
    add esi, 4
    pop ecx
    loop lendonum
    
    
    ;lendo variaveis
    push varA
    push ler
    call scanf
    add esp, 8
    
    push varB
    push ler
    call scanf
    add esp, 8
    
    push varC
    push ler
    call scanf
    add esp, 8
    
    ;chamar funçao
    mov ecx, 10
    mov esi, vetor
    call for
    
    push dword[contA]
    push escrever
    call printf
    add esp, 8
    
    push dword[contB]
    push escrever
    call printf
    add esp, 8
    
    push dword[contC]
    push escrever
    call printf
    add esp, 8
    
    xor eax, eax
    ret
    
    
    
    
    ;=========================================
    for:
    
    l1:
    mov ebx, [esi]
   
    cmp [varA], ebx
    je contadorA
    cmp [varB], ebx
    je contadorB
    cmp [varC], ebx
    je contadorC
    
    fiml1:
    add esi, 4
    loop l1
    
    ret
    
    
    ;=========================================
    contadorA:
    add dword[contA], 1
    jmp fiml1
    
    
    ;=========================================
    contadorB:
    add dword[contB], 1
    jmp fiml1
    
    
    ;=========================================
    contadorC:
    add dword[contC], 1
    jmp fiml1