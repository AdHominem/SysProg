.386
.model flat, stdcall
option casemap:none

include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib
include \masm32\include\masm32rt.inc

.data
first db "Enter first number ", 10, 13, 0
second db "Enter second number ", 10, 13, 0
firstnumber dword 0
secondnumber dword 0
scanfformat db "%d", 0
printfformat db "Sum: %d", 10, 13, 0

.code

start:
    push offset first
    invoke crt_printf

    push offset firstnumber
    push offset scanfformat
    invoke crt_scanf

    push offset second
    invoke crt_printf

    push offset secondnumber
    push offset scanfformat
    invoke crt_scanf

    mov eax, firstnumber
    add eax, secondnumber
    push eax
    push offset printfformat
    invoke crt_printf

    inkey
    invoke ExitProcess, 0
end start