assume cs:code, ds:data
data segment
sir db 'paul'
len_s equ $-sir
final db 'ghicit$'
sircitit db 30, ?, 30 dup(0)
data ends

code segment
start:
;Sa se implementeze un program de autentificare. Programul are definit in segmentul de date un sir de 
;caractere numit 'parola'. Programul va cere utilizatorului sa introduca parola de la tastatura si va 
;verifica daca aceasta este identica cu sirul 'parola' din segmentul de date si va afisa un mesaj 
;corespunzator. Programul tot cere utilizatorului parola, pana cand acesta o ghiceste.
mov ax,data
mov ds,ax
citire:
mov ah,0ah
mov dx,offset sircitit
int 21h
mov bl,len_s
cmp bl , sircitit[1]
je compara
jne citire
compara:
mov cx, len_s
mov si,0
mov di,2
repeta:
mov al,sir[si]
cmp al,sircitit[di]
je egal
jne citire
egal:
inc si
inc di
loop repeta
mov ah,09h
mov dx,offset final
int 21h
mov ax , 4c00h
int 21h
code ends
end start