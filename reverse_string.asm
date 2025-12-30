.MODEL SMALL
.STACK 100h

.DATA
    str DB 'HELLO$', 0
    msg DB 13,10,'Reversed: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA SI, str

PUSH_LOOP:
    MOV AL, [SI]
    CMP AL, '$'
    JE PRINT
    PUSH AX
    INC SI
    JMP PUSH_LOOP

PRINT:
    LEA DX, msg
    MOV AH, 09h
    INT 21h

POP_LOOP:
    POP DX
    MOV AH, 02h
    INT 21h
    CMP SP, 100h
    JNE POP_LOOP

    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN



