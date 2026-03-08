section .data
  text: db "TUOOT IS BETTER THAN SYHARIK", 0Ah
  textLen: equ $-text

section .text
	global _start
	
  _start:
    mov eax, 1
    mov ecx, 8
    
    push eax
    push ecx
    
  _loop_start:
    mov eax, 1
    mov edi, 1
    lea esi, [text]
    mov edx, textLen
    syscall
    
    pop ecx
    pop eax
    
    cmp eax, ecx
    jz _end
    
    add eax, 1
    
    push eax
    push ecx
    
    jmp _loop_start
  
  _end:
    mov eax, 60
    mov ebx, 0
    syscall