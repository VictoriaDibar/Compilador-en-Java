.386
.MODEL flat, stdcall
option casemap:none
include \masm32\include\masm32rt.inc
includelib  \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
dll_dllcrt0 PROTO C
printf PROTO C : VARARG

.data
    _A_MAIN          DW 0
    _B_MAIN          DW 0
    _C_MAIN          DW 0
    CONST_6          DW 6
    CONST_4          DW 4
    CONST_2          DW 2
    CONST_22         DW 22
    CONST_25         DW 25
    CONST_1          DW 1
    CONST_38         DW 38
    CONST_10         DW 10
    @aux1            DW 0
    @aux2            DW 0
    @aux3            DW 0
    msgOverflowAdd    DB "Error: overflow en suma de enteros", 13, 10, 0
    msgOverflowMult   DB "Error: overflow en multiplicacion de enteros", 13, 10, 0
    msgNegativeSub    DB "Error: resta con resultado negativo en enteros sin signo", 13, 10, 0
    msgFinOk          DB "Programa termino sin errores", 13, 10, 0
    CONST_Mas_Grande_B DB "Mas Grande B", 13, 10, 0
    CONST_Mas_Grande_C DB "Mas Grande C", 13, 10, 0

.code
start:
    mov ax, CONST_6    ; valor UINT
    mov _A_MAIN, ax
    mov ax, CONST_4    ; valor UINT
    mov _B_MAIN, ax
    mov ax, CONST_2    ; valor UINT
    mov _C_MAIN, ax
L10:
    xor eax, eax
    mov ax, _C_MAIN    ; extender UINT16 -> UINT32 en EAX
    invoke printf, cfm$("%u \n"), eax
    mov ax, _C_MAIN    ; op1 UINT
    cmp ax, _B_MAIN    ; op1 ? op2
    mov ax, 0
    setb al                  ; op1 < op2 (unsigned)
    mov @aux1, ax     ; guardar bool 0/1 en @aux1
    mov ax, @aux1    ; cargar condicion
    cmp ax, 0
    je  L22                  ; BF -> salta si es falso
    invoke printf, ADDR CONST_Mas_Grande_B
    jmp L25                  ; BI incondicional
L22:
    invoke printf, ADDR CONST_Mas_Grande_C
L25:
    mov ax, _C_MAIN    ; op1 UINT
    add ax, CONST_1    ; op1 + op2
    jc  overflowAdd       ; overflow en suma UINT (16 bits)
    mov @aux2, ax     ; resultado
    mov ax, @aux2    ; valor UINT
    mov _C_MAIN, ax
    mov ax, _C_MAIN    ; op1 UINT
    cmp ax, _A_MAIN    ; op1 ? op2
    mov ax, 0
    setb al                  ; op1 < op2 (unsigned)
    mov @aux3, ax     ; guardar bool 0/1 en @aux3
    mov ax, @aux3    ; cargar condicion
    cmp ax, 0
    je  L38                  ; BF -> salta si es falso
    jmp L10                  ; BI incondicional
L38:
    invoke printf, ADDR msgFinOk
    exit

overflowAdd:
    invoke printf, ADDR msgOverflowAdd
    exit

overflowMult:
    invoke printf, ADDR msgOverflowMult
    exit

negativeSub:
    invoke printf, ADDR msgNegativeSub
    exit

end start
