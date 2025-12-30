.MODEL SMALL
.STACK 100h

.DATA
    arr DB 5, 3, 9, 2, 6
    max DB ?
    msg DB 13,10,'Largest: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA SI, arr
    MOV AL, [SI]
    MOV max, AL
    MOV CX, 5

NEXT:
    MOV AL, [SI]
    CMP AL, max
    JBE SKIP
    MOV max, AL

SKIP:
    INC SI
    LOOP NEXT

    LEA DX, msg
    MOV AH, 09h
    INT 21h

    MOV DL, max
    ADD DL, 30h
    MOV AH, 02h
    INT 21h

    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN





