#First steps in assembler

#build guide for Linux:
```
nasm -f elf app.asm
ld app.o -o app
```

#build guide for Windows:
```
nasm -f win32 app.asm -o app.o
ld app.o -o app.exe
```