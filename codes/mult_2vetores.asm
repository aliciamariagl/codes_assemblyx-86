%include "io.inc"


section .data
ler db "%f", 0xA, 0
escrever db "%lf", 0xA, 0
total dd 0

section .bss
N resd 80
M resd 80
result resd 80
var resq 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    
    ;lendo vetor N ============================================
    mov esi, N
    mov ecx, 80
    lerN:
    push ecx
    
    push esi
    push ler
    call scanf
    add esp, 8
    
    pop ecx
    add esi, 4
    loop lerN
    ;===========================================================
    
    ;lendo vetor M =============================================
    mov esi, M
    mov ecx, 80
    lerM:
    push ecx
    
    push esi
    push ler
    call scanf
    add esp, 8
    
    pop ecx
    add esi, 4
    loop lerM
    ;============================================================
    
    ;multiplicando ==============================================
    mov ecx, 10 ; 10 no ecx pois o avx pega somente os oito primeiros elementos dos vetores
    mov esi, N  ; esi irá começar no primeiro elemento do vetor N
    mov edi, M  ; edi irá começar no primeiro elemento do vetor M
    mov edx, result ; edx marcará a primeira posição do vetor onde ficará os resultados das multiplicações
    
    mult:
    
    vmovups ymm1, [esi] ;movendo o primeiro elemento do vetor N para ymm1
    vmovups ymm2, [edi] ;movendo o primeiro elemento do vetor M para ymm2
    vmulps ymm3, ymm1, ymm2 ; multiplicando os oitos primeiros valores dos dois vetores e guardando em ymm3
    vmovups [edx], ymm3 ; passando os valores de ymm3 para edx que esta apontando para o primeiro elemento do vetor resultado 
    
    ; soma 32 em todos os vetores pois queremos chegar ao nono elemento sabendo que cada elemento ocupa 4 bytes
    ; então: 4*8 = 32
    add esi, 32 
    add edi, 32
    add edx, 32
    
    ; faz o loop 10 vezes, pois pega 8 elementos de cada vetor de ma vez 
    ; então: 80/8 = 10
    loop mult
    ;=============================================================
    
    ;somando
    mov esi, result ; aqui coloquei esi apontando para o primeiro elemento do vetor resultado
    mov ecx, 80 ;coloquei 80 em ecx para o loop fazer a soma dos 80 elementos 
    
    soma:
    
    finit
    fld dword[esi]  ; aqui eu carrego o primeiro elemento do vetor
    fld dword[total]; aqui eu carrego a variavel que irá guardar as somas, iniciando a variavel por 0
    fadd st0, st1   ; aqui faz a soma do total com o novo elemento do vetor 
    fstp dword[total] ; aqui eu coloco o novo resultado da soma em total, atualizando a variável
    
    add esi, 4      ; aqui eu faço o vetor andar para o próximo elemento
    
    loop soma      ; aqui faz o loop 80 vezes
    fld dword[total] 
    fstp qword[var]
    
    ;imprimindo
    push dword[var+4]          
    push dword[var]            
    push escrever                   
    call printf                 
    add esp,12
    
    xor eax, eax
    ret
    