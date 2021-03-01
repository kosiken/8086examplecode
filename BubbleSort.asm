
	push cs
	pop ds
	mov si, 0
	mov bx, array
	call count
 
	mov dx, cx
	xor si, si
	mov ch, 0
	mov [counts], dl
loop1:
	mov [temp], cl
	xor si, si
	sub dl, dh
	
	mov cl, dl
	mov dl, [counts]
	dec cl
	
	
	
loop2:
	mov al, [bx + si]
	mov ah, [bx + si + 1]
	cmp al, ah
	jg swap

cont:	
	inc si
	loop loop2
	
	mov cl, [temp]
	inc dh
	loop loop1
	
	jmp ends
swap:
	
	mov [bx + si], ah
	mov [bx + si + 1], al
	jmp cont
	

	

count:
	mov al, [bx + si]
	cmp al, -1
	je myret
	inc si
	inc cl	
	jmp count
	
myret:
	ret
	

array: db 6,2,5,8,1,7,9,3,10,4,-1
temp: db 0
counts: db 0
ends:
	nop ; open memory view to see sorted array