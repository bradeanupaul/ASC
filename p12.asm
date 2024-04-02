assume cs:code, ds:data
data segment
a dw 55CAh
b dw 0F0Fh
c dw ?
data ends

code segment
start:
;5. Se dau cuvintele A si B. Sa se obtina cuvântul C:
;- bitii 0-3 ai lui C coincid cu bitii 8-11 ai lui A
;- bitii 4-10 ai lui C au valoarea 0
;- bitii 11-15 ai lui C coincid cu bitii 11-15 ai lui B
mov ax,data
mov ds,ax
;calculam in bx rezultatul
mov bx,0
mov ax,a
and ax,0000111100000000b
mov cl,8
ror ax,cl
or bx,ax;bitii 8-11 din a sunt pe poz 0-3 in bx

and bx,1111100000001111b
;pe poz 4-10 este bitul 0

mov ax,b
and ax,1111100000000000b
or bx,ax
;in bx avem rezultatul final
mov c,bx
mov ax , 4c00h
int 21h
code ends
end start