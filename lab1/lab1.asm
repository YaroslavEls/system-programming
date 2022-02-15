.386
option casemap:none
include \masm32\include\masm32rt.inc
.data?
buff db 128 dup(?)
buffD db 32 dup(?)
buffMinD db 32 dup(?)
buffE db 32 dup(?)
buffMinE db 32 dup(?)
buffF db 32 dup(?)
buffMinF db 32 dup(?)
.data
DateStr db "25052003",0
ByteA db 25
ByteMinA db -25
WordA dw 25
WordMinA dw -25
WordB dw 2505
WordMinB dw -2505
ShortIntA dd 25
ShortIntMinA dd -25
ShortIntB dd 2505
ShortIntMinB dd -2505
ShortIntC dd 25052003
ShortIntMinC dd -25052003
LongIntA dq 25
LongIntMinA dq -25
LongIntB dq 2505
LongIntMinB dq -2505
LongIntC dq 25052003
LongIntMinC dq -25052003
SingleD dd 0.059
SingleMinD dd -0.059
DoubleE dq 5.908
DoubleMinE dq -5.908
ExtendedF dt 59084.913
ExtendedMinF dt -59084.913
DoubleD dq 0.059
DoubleMinD dq -0.059
DoubleF dq 59084.913
DoubleMinF dq -59084.913
MsgBoxCaption db "Lab1. Yaroslav Tereshchenko IP-04",0
form db "A = %d, -A = %d",10,"B = %d, -B = %d",10,"C = %d, -C = %d",10,
    "D = %s, -D = %s",10,"E = %s, -E = %s",10,"F = %s, -F = %s",0
.code
Main:
invoke FloatToStr2, DoubleD, addr buffD
invoke FloatToStr2, DoubleMinD, addr buffMinD
invoke FloatToStr2, DoubleE, addr buffE
invoke FloatToStr2, DoubleMinE, addr buffMinE
invoke FloatToStr2, DoubleF, addr buffF
invoke FloatToStr2, DoubleMinF, addr buffMinF
invoke wsprintf, addr buff, addr form, ShortIntA, ShortIntMinA, ShortIntB, ShortIntMinB, ShortIntC, ShortIntMinC, 
    addr buffD, addr buffMinD, addr buffE, addr buffMinE, addr buffF, addr buffMinF
invoke MessageBox, 0, addr buff, offset MsgBoxCaption, 0
invoke ExitProcess, 0
end Main