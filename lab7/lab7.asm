.386
option casemap:none
include \masm32\include\masm32rt.inc
.data?
buff    db 128 dup(?)
buffA   db 128 dup(?)
buffB   db 128 dup(?)
buffC   db 128 dup(?)
buffD   db 128 dup(?)
buffRes db 128 dup(?)
.data
arrA dq 4.9, 1.7, -3.2, 9.81, 4.2
arrB dq 3.112, -7.8, -2.9, 3.1, 6.6
arrC dq -2.61, 4.3, -8.154, 7.79, 2.1
arrD dq 7.5, 9.26, -2.8, 2.7, 7.3
res1 dt ?
res  dq ?
oper1 dq -2.0
oper2 dq 82.0
MsgBoxCaption db "Lab7. Yaroslav Tereshchenko IP-04",0
form db "a = %s",10,"b = %s",10,"c = %s",10,"d = %s",10,"res = %s",0
extern Proc3@0:near, res2:tbyte
public arrA, arrB
Proc1 proc
    push ebp
    mov ebp, esp
    fld qword ptr [eax[ebx*8]]
    fld qword ptr [ecx]
    fmul
    pop ebp
    ret 8
Proc1 endp
Proc2 proc
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    fld qword ptr [eax[ebx*8]]
    mov ecx, [ebp+12]
    fld qword ptr [ecx]
    fmul
    pop ebp
    ret 8
Proc2 endp
.code
Main:
    mov ebx, 0
Calculate:
    finit
    mov eax, offset arrC         ; -2*c
    mov ecx, offset oper1
    call Proc1
    push offset oper2            ; d*82
    push offset arrD
    call Proc2
    fsub                        ; (-2*c)-(d*82)
    fstp res1 
    call Proc3@0                ; tg(a/4-b)         
    fld res1                    ; res1/res2 = ((-2*c)-(d*82))/tg(a/4-b)
    fld res2
    fdiv
    fstp res            
    invoke FloatToStr2, arrA[ebx*8], addr buffA
    invoke FloatToStr2, arrB[ebx*8], addr buffB
    invoke FloatToStr2, arrC[ebx*8], addr buffC
    invoke FloatToStr2, arrD[ebx*8], addr buffD
    invoke FloatToStr2, res, addr buffRes
    invoke wsprintf, addr buff, addr form, addr buffA, addr buffB, addr buffC, addr buffD, addr buffRes
    invoke MessageBox, 0, addr buff, offset MsgBoxCaption, 0
    inc ebx
    cmp ebx, 5
    jl Calculate
    invoke ExitProcess, 0
end Main