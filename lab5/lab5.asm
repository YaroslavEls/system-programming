.386
option casemap:none
include \masm32\include\masm32rt.inc
.data?
buff db 128 dup(?)
.data                       ; res -13, 2, 1, -4, 2
arrA dd 8,6,2,6,4
arrC dd 6,9,5,3,8
arrD dd 6,-9,5,-3,2
tmp1 dd ?
tmp2 dd ?
MsgBoxCaption db "Lab5. Yaroslav Tereshchenko IP-04",0
form db "a = %d",10,"c = %d",10,"d = %d",10,"res = %d",0
.code
Main:
    mov ebx, 0
Calculate:
    mov eax, arrC[ebx*4]    ; c/d
    mov edx, 0
    idiv arrD[ebx*4]
    mov tmp1, eax
    mov eax, 3              ; 3*a/2
    imul arrA[ebx*4]
    mov edx, 0
    mov tmp2, 2
    idiv tmp2
    add eax, tmp1           ; tmp2+tmp1 = (3*a/2)+(c/d)
    mov tmp1, eax
    mov eax, arrC[ebx*4]    ; c-a+1
    sub eax, arrA[ebx*4]
    add eax, 1
    mov tmp2, eax                        
    mov eax, tmp1           ; tmp1/tmp2 = ((3*a/2)+(c/d))/(c-a+1)
    mov edx, 0
    idiv tmp2
    mov tmp1, eax           ; check for odd/even
    mov tmp2, 2
    cdq
    idiv tmp2
    cmp edx, 0
    je Output               ; if even
    mov eax, tmp1           ; if odd
    mov tmp2, 5
    mul tmp2
Output:
    invoke wsprintf, addr buff, addr form, arrA[ebx*4], arrC[ebx*4], arrD[ebx*4], eax
    invoke MessageBox, 0, addr buff, offset MsgBoxCaption, 0
    inc ebx
    cmp ebx, 5
    jl Calculate
Exit:
    invoke ExitProcess, 0
end Main