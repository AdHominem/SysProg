.386
.model flat, stdcall
option casemap:none

include \masm32\include\msvcrt.inc
includelib \masm32\lib\msvcrt.lib
include \masm32\include\masm32rt.inc

.data
message db "Enter a number ", 10, 13, 0
number dword 0
scanfformat db "%d", 0
evenMessage db "%d is an even number!", 10, 13, 0
oddMessage db "%d is an odd number!", 10, 13, 0

.code

start:
    push offset message
    invoke crt_printf

    push offset number
    push offset scanfformat
    invoke crt_scanf

    ; Determine if number is odd or even
    push number
    mov eax, number
    shr eax, 1
    jc odl

    push offset evenMessage
    jmp fin

odl:push offset oddMessage
    
fin:invoke crt_printf
    inkey
    invoke ExitProcess, 0
    
end start