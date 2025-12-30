.MODEL SMALL
.STACK 100h

.DATA
    exp DB '23+5*$', 0
    msg DB 13,10,'Result: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA SI, exp

NEXT:
    MOV AL, [SI]
    CMP AL, '$'
    JE DONE

    CMP AL, '+'
    JE ADD_OP
    CMP AL, '*'
    JE MUL_OP

    ; operand
    SUB AL, 30h
    PUSH AX
    JMP CONT

ADD_OP:
    POP BX
    POP AX
    ADD AX, BX
    PUSH AX
    JMP CONT

MUL_OP:
    POP BX
    POP AX
    MUL BX
    PUSH AX

CONT:
    INC SI
    JMP NEXT

DONE:
    POP AX

    LEA DX, msg
    MOV AH, 09h
    INT 21h

    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN




