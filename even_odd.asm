.MODEL SMALL
.STACK 100h

.DATA
    num DB 7
    even DB 13,10,'The Number is Even$'
    odd  DB 13,10,'The Number is Odd$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, num
    AND AL, 01h
    JZ IS_EVEN

    LEA DX, odd
    JMP PRINT

IS_EVEN:
    LEA DX, even

PRINT:
    MOV AH, 09h
    INT 21h

    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN




