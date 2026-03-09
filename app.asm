section .data
	text1:	db "TUOOT IS AHEAD OF SYHARIK", 0Ah
	text1Len: equ $-text1

	text2: db "Enter number: "
	text2Len: equ $-text2

	text3: db "Your number: "
	text3Len: equ $-text3

section .bss
	num resb 5

section .text
	global _start

_print:
	PUSH	eax
	PUSH	ebx

	MOV	eax,4
	MOV	ebx,1
	INT	80h

	POP	ebx
	POP	eax

	RET

_input:
	PUSH	eax
	PUSH	ebx
	PUSH	ecx
	PUSH	edx

	MOV	eax,3
	MOV	ebx,2
	MOV	ecx,num
	MOV	edx,5
	INT	80h

	POP	edx
	POP	ecx
	POP	ebx
	POP	eax

	RET

_start:
	MOV	ecx,text1
	MOV	edx,text1Len
	CALL	_print

	MOV	ecx,text2
	MOV	edx,text2Len
	CALL	_print

	CALL	_input

	MOV	ecx,text3
	MOV	edx,text3Len
	CALL	_print

	MOV	ecx,num
	MOV	edx,5
	CALL	_print

_end:
	MOV	eax, 1
	MOV	ebx, 0
	INT	80h
