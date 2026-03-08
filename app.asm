section .data
  text: db "TUOOT IS BETTER THAN SYHARIK", 0Ah
  textLen: equ $-text

section .text
	global _start
	
  _start:
    mov rax, 1
    mov rcx, 8
    
    push rax
    push rcx
    
  _loop_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [text]
    mov rdx, textLen
    syscall
    
    pop rcx
    pop rax
    
    cmp rax, rcx
    jz _end
    
    add rax, 1
    
    push rax
    push rcx
    
    jmp _loop_start
  
  _end:
    mov rax, 60
    mov rbx, 0
    syscall