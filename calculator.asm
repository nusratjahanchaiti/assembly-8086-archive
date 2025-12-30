.MODEL SMALL
.STACK 100h

.DATA
    msgA DB 13,10,'Enter value of A (0-9): $'
    msgB DB 13,10,'Enter value of B (0-9): $'

    msg1 DB 13,10,'Addition: $'
    msg2 DB 13,10,'Subtraction: $'
    msg3 DB 13,10,'Multiplication: $'
    msg4 DB 13,10,'Division: $'

    A DB ?
    B DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; -------- INPUT A --------
    LEA DX, msgA
    MOV AH, 09h
    INT 21h

    MOV AH, 01h        ; read character
    INT 21h
    SUB AL, 30h        ; ASCII to number
    MOV A, AL

    ; -------- INPUT B --------
    LEA DX, msgB
    MOV AH, 09h
    INT 21h

    MOV AH, 01h
    INT 21h
    SUB AL, 30h
    MOV B, AL

    ; -------- ADDITION --------
    MOV AL, A
    ADD AL, B

    LEA DX, msg1
    MOV AH, 09h
    INT 21h

    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    ; -------- SUBTRACTION --------
    MOV AL, A
    SUB AL, B

    LEA DX, msg2
    MOV AH, 09h
    INT 21h

    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    ; -------- MULTIPLICATION --------
    MOV AL, A
    MUL B

    LEA DX, msg3
    MOV AH, 09h
    INT 21h

    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    ; -------- DIVISION --------
    MOV AL, A
    MOV AH, 0
    DIV B

    LEA DX, msg4
    MOV AH, 09h
    INT 21h

    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    ; -------- WAIT & EXIT --------
    MOV AH, 01h
    INT 21h

    MOV AH, 4Ch
    INT 21h
MAIN ENDP

END MAIN

