section .text
time:
	mov byte [re1], 0
	mov dword [re], __TIME__
	mov si, re
	mov bl, 0Ah
	call printString
	mov byte [hours], 0
	mov byte [mins], 0
	mov byte [secs], 0

	mov ah, 02h
	int 1Ah

	mov byte [hours], ch
	mov byte [mins], cl
	mov byte [secs], dh

	mov ax, 0
	mov al, byte [hours]
	and al, 11110000b
	shr al, 4
	;call WriteInt16
	mov ax, 0
	mov al, byte [hours]
	and al, 00001111b
	;call WriteInt16

	mov si, colon
	;call printString

	mov ax, 0
	mov al, byte [mins]
	and al, 11110000b
	shr al, 4
	;call WriteInt16
	mov ax, 0
	mov al, byte [mins]
	and al, 00001111b
	call WriteInt16

	mov si, colon
	call printString

	mov ax, 0
	mov al, byte [secs]
	and al, 11110000b
	shr al, 4
	call WriteInt16
	mov ax, 0
	mov al, byte [secs]
	and al, 00001111b
	call WriteInt16

	mov si, msg_newLine
	call printString

	ret

section .data
	colon: DB ":", 0

section .bss
	re:	RESD	1
	re1:	RESB	1
	hours:	RESB	1
	mins:	RESB	1
	secs:	RESB	1
