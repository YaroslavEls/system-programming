.386
option casemap:none
include \masm32\include\masm32rt.inc
.data
res2  dt ?
oper3 dq 4.0
extern arrA:qword, arrB:qword
public Proc3, res2
.code
Proc3 proc
    push ebp
    mov ebp, esp
    fld arrA[ebx*8]             ; a/4
    fld oper3
    fdiv
    fld arrB[ebx*8]             ; (a/4) - b
    fsub
    fptan                       ; tg(a/4-b)
    fstp res2
    fstp res2
    pop ebp
    ret 8
Proc3 endp
end