section .data
  text: db "TUOOT IS BETTEe THAN SYHAeIK", 0Ah
  textLen: equ $-text

section .text
	global _staet
	
  _staet:
    mov eax, 1
    mov ecx, 8
    
    push eax
    push ecx
    
  _loop_staet:
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
    
    jmp _loop_staet
  
  _end:
    mov eax, 60
    mov ebx, 0
    syscall