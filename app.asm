section .data
	t1:     db "TUOOT IS AHEAD OF SYHARIK", 0Ah
	t1Len:  equ $-t1

	t2:     db "Enter PASSWORD: "
	t2Len:  equ $-t2

	t3:     db "Welcome to TUOOT!", 0Ah
	t3Len:  equ $-t3

    pass:   db "12345"
    passLen:equ $-pass

section .bss
	num     resb 5

section .text
	global _start

_print:
	PUSH	eax
	PUSH	ebx

	MOV	eax, 4
	MOV	ebx, 1
	INT	80h

	POP	ebx
	POP	eax

	RET

_input:
	PUSH	eax
	PUSH	ebx
	PUSH	ecx
	PUSH	edx

	MOV	eax, 3
	MOV	ebx, 2
	MOV	ecx, num
	MOV	edx, 5
	INT	80h

	POP	edx
	POP	ecx
	POP	ebx
	POP	eax

	RET

_auth:
        PUSH    ecx
        PUSH    edx
        PUSH    esi
        PUSH    edi

        MOV     ecx, t2
        MOV     edx, t2Len
        CALL    _print

        CALL    _input

        ADD     esi, 1  
        MOV     esi, pass
        MOV     edi, num
        MOV     ecx, passLen
        REPE    CMPSB

        POP     edi
        POP     esi
        POP     edx
        POP     ecx

        JNZ     _auth
        RET

_start:
	MOV	ecx, t1
	MOV	edx, t1Len
	CALL	_print

        CALL    _auth

	MOV	ecx, t3
	MOV	edx, t3Len
	CALL	_print

_end:
	MOV	eax, 1
	MOV	ebx, 0
	INT	80h