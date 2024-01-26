%include "io.inc"
extern printf
extern scanf

section .data
fms db "%d", 0
fixo dd 0
tam dd 0
dois dd 2

section .bss
var resd 1
array resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    
    
    
    
    ;====================================
    ;leitura do tamanho do vetor e do vetor
    push var
    push fms
    call scanf
    add esp,8
    
    mov ecx, [var]
    mov [tam], ecx
    mov esi, array
    ler:
    mov [fixo], ecx
    push esi
    push fms
    call scanf
    add esp, 8
    add esi, 4
    mov ecx, [fixo]
    loop ler
    mov esi, array 
    ;====================================
    
    
    
    
    
    ;====================================
    ;andar pelo vetor e pegar numero por numero
    mov eax, 0
    mov ecx, [tam]
    l1:
    mov [fixo], ecx
    mov ebx, [esi]
    call impar
    add esi, 4
    mov ecx, [fixo]
    loop l1
    
    push eax
    push fms
    call printf
    add esp, 8
    
    xor eax, eax
    ret
    ;====================================
    
    
    
    
    
    ;====================================
    ;confirmar se o numero é impar e somar, senão for retornar sem somar nada
    impar:
    mov edx, 0
    l2:
    add edx, [dois]
    cmp edx, ebx
    jg soma
    cmp edx, ebx
    je fim_impar
    jmp l2
    
    soma:
    add eax, ebx
    fim_impar:
    ret
    ;====================================