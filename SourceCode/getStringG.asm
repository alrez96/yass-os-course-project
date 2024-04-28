section .text
getStringG:
	mov cl, 0		; Counter number of characters
	mov byte [row_curP], 6
	mov byte [col_curP], 14
 
.get_key:
	call getCursorPosition
	mov byte [row_cur], dh
	mov byte [col_cur], dl

	mov byte [save_cl], cl
	call getKeyGrapgics
	mov cl, byte [save_cl]

	cmp al, 08h     	; Backspace pressed?
   	je .backspace   	; Yes, handle it
 
   	cmp al, '='  		; Enter pressed?
   	je .return     	        ; Yes, we're done

	cmp al, 'e'
	je .retexit

	cmp al, 'C'
	je .retclean
 
   	cmp cl, 1Fh    	        ; 31 chars inputted?
   	je .get_key     	; Yes, only let in backspace and enter
 	
   	mov ah, 0Eh		; Teletype output
	mov bh, 0
	mov bl, 0Fh
   	int 10h      		; Print character on the screen
 
   	stosb 		        ; Put character in buffer
   	inc cl
   	jmp .get_key
 
.backspace:
   	cmp cl, 0		; Beginning of string?
   	je .get_key		; Yes, ignore the key
 
   	dec di
   	mov byte [di], 0	; Delete character
   	dec cl			; Decrement counter as well
 
   	mov ah, 0Eh
   	mov al, 08h		; Backspace ASCII 
   	int 10h			; Backspace on the screen
 
   	mov al, ' '
   	int 10h			; Blank character out
 
   	mov al, 08h
   	int 10h			; Backspace again
 
   	jmp .get_key
 
.return:
   	mov al, 0		; Null terminator
   	stosb
 
   	mov ah, 0Eh
   	mov al, 0Dh
   	int 10h

   	mov al, 0Ah
   	int 10h			; New line
	 
   	ret			; Return to main proc

.retclean:
	mov al, 'c'		; Null terminator
   	stosb
	mov al, 0		; Null terminator
   	stosb
 
   	mov ah, 0Eh
   	mov al, 0Dh
   	int 10h

   	mov al, 0Ah
   	int 10h			; New line
	 
   	ret			; Return to main proc

.retexit:
	mov al, 'e'		; Null terminator
   	stosb
	mov al, 0		; Null terminator
   	stosb
 
   	mov ah, 0Eh
   	mov al, 0Dh
   	int 10h

   	mov al, 0Ah
   	int 10h			; New line
	 
   	ret			; Return to main proc

setCursorPositionP:
	mov ah, 02h
	mov bh, 0
	int 10h

	ret

getKeyGrapgics:
	mov byte [row_cur], dh
	mov byte [col_cur], dl	

	mov dh, byte [row_curP]
	mov dl, byte [col_curP]	

.loopmain:
	mov byte [row_curP], dh
	mov byte [col_curP], dl
	mov dh, 6
	mov dl, 14
	call setCursorPositionP
	call printNums
	mov dh, byte [row_curP]
	mov dl, byte [col_curP]	
	call setCursorPositionP
	call printNumCol
.getLoop:
	mov ah, 00h
	int 16h
	cmp al, 'w'
	je .goUp
	cmp al, 's'
	je .goDown
	cmp al, 'a'
	je .goLeft
	cmp al, 'd'
	je .goRight
	cmp al, 0Dh
	je .preeEn
	cmp al, 1Bh
	je .retex
	jmp .getLoop

.goUp:
	cmp dh, 6
	je .getLoop
	sub dh, 3
	jmp .loopmain

.goDown:
	cmp dh, 21
	je .getLoop
	cmp dh, 18
	je .goDownD
	add dh, 3
	jmp .loopmain
.goDownD:
	cmp dl, 19
	jne .getLoop
	add dh, 3
	jmp .loopmain

.goLeft:
	cmp dl, 14
	je .getLoop
	cmp dh, 21
	je .getLoop
	sub dl, 5
	jmp .loopmain

.goRight:
	cmp dl, 24
	je .getLoop
	cmp dh, 21
	je .getLoop
	add dl, 5
	jmp .loopmain

.preeEn:
	cmp al, '='
	je .retuq
	cmp al, 'C'
	je .retuq
	call printNumCol
	mov byte [row_curP], dh
	mov byte [col_curP], dl
	mov dh, byte [row_cur]
	mov dl, byte [col_cur]
	call setCursorPositionP

.retuq:
	ret
.retex:
	mov al, 'e'
	ret

priNumCol:
	mov bh, 0
	mov cx, 1
	int 10h

	ret

printNumCol:
	cmp dh, 6
	je .row1c
	cmp dh, 9
	je .row2c
	cmp dh, 12
	je .row3c
	cmp dh, 15
	je .row4c
	cmp dh, 18
	je .row5c
	cmp dh, 21
	je .row6c

.row1c:
	cmp dl, 19
	je .p2
	cmp dl, 24
	je .p3
	mov al, '1'
	jmp .retgh
.p2:
	mov al, '2'
	jmp .retgh
.p3:
	mov al, '3'
	jmp .retgh

.row2c:
	cmp dl, 19
	je .p5
	cmp dl, 24
	je .p6
	mov al, '4'
	jmp .retgh
.p5:
	mov al, '5'
	jmp .retgh
.p6:
	mov al, '6'
	jmp .retgh

.row3c:
	cmp dl, 19
	je .p8
	cmp dl, 24
	je .p9
	mov al, '7'
	jmp .retgh
.p8:
	mov al, '8'
	jmp .retgh
.p9:
	mov al, '9'
	jmp .retgh

.row4c:
	cmp dl, 19
	je .p0
	cmp dl, 24
	je .pc
	mov al, '+'
	jmp .retgh
.p0:
	mov al, '0'
	jmp .retgh
.pc:
	mov al, 'C'
	jmp .retgh

.row5c:
	cmp dl, 19
	je .pz
	cmp dl, 24
	je .pt
	mov al, '-'
	jmp .retgh
.pz:
	mov al, '*'
	jmp .retgh
.pt:
	mov al, '/'
	jmp .retgh

.row6c:
	mov al, '='

.retgh:
	mov ah, 09h
	mov bl, 04h
	call priNumCol
	ret

printNums:
	mov ah, 02h
	mov bh, 0
	int 10h	
	mov ah, 09h
	mov al, '1'
	mov bl, 07h
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	add dl, 5
	int 10h	
	mov ah, 09h
	mov al, '2'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	add dl, 5
	int 10h	
	mov ah, 09h
	mov al, '3'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	add dh, 3
	int 10h	
	mov ah, 09h
	mov al, '6'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	sub dl, 5
	int 10h	
	mov ah, 09h
	mov al, '5'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	sub dl, 5
	int 10h	
	mov ah, 09h
	mov al, '4'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	add dh, 3
	int 10h	
	mov ah, 09h
	mov al, '7'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	add dl, 5
	int 10h	
	mov ah, 09h
	mov al, '8'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	add dl, 5
	int 10h	
	mov ah, 09h
	mov al, '9'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	add dh, 3
	int 10h	
	mov ah, 09h
	mov al, 'C'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	sub dl, 5
	int 10h	
	mov ah, 09h
	mov al, '0'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	sub dl, 5
	int 10h	
	mov ah, 09h
	mov al, '+'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	add dh, 3
	int 10h	
	mov ah, 09h
	mov al, '-'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	add dl, 5
	int 10h	
	mov ah, 09h
	mov al, '*'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	add dl, 5
	int 10h	
	mov ah, 09h
	mov al, '/'
	call priNumCol
;************************************
	mov ah, 02h
	mov bh, 0
	add dh, 3
	sub dl, 5
	int 10h	
	mov ah, 09h
	mov al, '='
	call priNumCol

	ret

section .bss
	row_cur:	RESB	1
	col_cur:	RESB	1
	row_curS:	RESB	1
	col_curS:	RESB	1
	row_curP:	RESB	1
	col_curP:	RESB	1
	save_cl:	RESB	1
