section .data
    hello: db "TUOOT IS BETTER THAN SYHARIK", 0
    helloLen: equ   $-hello

section .text
    global _start

    _start:
        mov rax,1
        mov rdi,1
        mov rsi,hello
        mov rdx,helloLen
        syscall

        moc rax,60
        mov rdi,0
        syscall