section .text
calculator16:
	mov word [result], 0
	mov word [num], 0
	mov si, msg_help
	call printString

.start:
	mov ax, 0
	mov byte [opr_mode], 0
	mov word [num], 0
	mov si, msg_result
	call printString
	mov ax, word [result]
	call WriteInt16
	mov si, msg_newLine
	call printString

	mov si, msg_calculator
	call printString
	
	mov di, get_string
	mov al, '$'
	stosb
	call getString
	dec di

.getNum:
	mov ch, 0	
	mov dx, 0

.loop:
	mov bx, 0
	dec di
	mov al, byte [di]
	cmp al, 'e'
	je .return
	cmp al, 'c'
	je .clean
	cmp al, '-'
	je .sub
	cmp al, '+'
	je .add
	cmp al, '*'
	je .mul
	cmp al, '/'
	je .div
	cmp al, '$'
	je .end
	and al, 11001111b
	mov bl, al

.backNum:
	mov ax, 1
	mov cl, ch
	
.loop2:
	cmp cl, 0
	je .get
	imul ax, 10
	dec cl
	jmp .loop2

.get:
	imul bx, ax
	add dx, bx
	inc ch
	jmp .loop

.add:
	add word [result], dx
	jmp .getNum

.sub:
	sub word [result], dx
	jmp .getNum

.mul:
	add word [num], dx
	mov byte [opr_mode], 1
	jmp .getNum	

.div:
	cmp dx, 0
	je .start
	add word [num], dx
	mov byte [opr_mode], 2
	jmp .getNum

.end:
	cmp byte [opr_mode], 1
	je .end_mul
	cmp byte [opr_mode], 2
	je .end_div

	add word [result], dx
	jmp .start

.end_mul:
	cmp byte [di + 1], '-'
	jne .pos
	sub word [result], dx 
	jmp .cont

.pos:
	add word [result], dx

.cont:
	mov dx, word [result]
	imul dx, word [num]
	mov word [result], dx
	jmp .start

.end_div:
	cmp byte [di + 1], '-'
	jne .pos1
	sub word [result], dx 
	jmp .cont1

.pos1:
	add word [result], dx

.cont1:
	mov dx, 0
	mov ax, word [result]
	idiv word [num]
	mov word [result], ax
	jmp .start

.clean:
	mov word [result], 0
	jmp .start	

.return:
	ret

calculator32:
	mov dword [result32], 0
	mov dword [num32], 0
	mov si, msg_help
	call printString

.start:
	mov eax, 0
	mov byte [opr_mode], 0
	mov dword [num32], 0
	mov si, msg_result
	call printString
	mov eax, dword [result32]
	call WriteInt32
	mov si, msg_newLine
	call printString

	mov si, msg_calculator
	call printString
	
	mov di, get_string
	mov al, '$'
	stosb
	call getString
	dec di

.getNum:
	mov ch, 0	
	mov edx, 0

.loop:
	mov ebx, 0
	dec di
	mov al, byte [di]
	cmp al, 'e'
	je .return
	cmp al, 'c'
	je .clean
	cmp al, '-'
	je .sub
	cmp al, '+'
	je .add
	cmp al, '*'
	je .mul
	cmp al, '/'
	je .div
	cmp al, '$'
	je .end
	and al, 11001111b
	mov bl, al

.backNum:
	mov eax, 1
	mov cl, ch
	
.loop2:
	cmp cl, 0
	je .get
	imul eax, 10
	dec cl
	jmp .loop2

.get:
	imul ebx, eax
	add edx, ebx
	inc ch
	jmp .loop

.add:
	add dword [result32], edx
	jmp .getNum

.sub:
	sub dword [result32], edx
	jmp .getNum

.mul:
	add dword [num32], edx
	mov byte [opr_mode], 1
	jmp .getNum	

.div:
	cmp edx, 0
	je .start
	add dword [num32], edx
	mov byte [opr_mode], 2
	jmp .getNum

.end:
	cmp byte [opr_mode], 1
	je .end_mul
	cmp byte [opr_mode], 2
	je .end_div

	add dword [result32], edx
	jmp .start

.end_mul:
	cmp byte [di + 1], '-'
	jne .pos
	sub dword [result32], edx 
	jmp .cont

.pos:
	add dword [result32], edx

.cont:
	mov edx, dword [result32]
	imul edx, dword [num32]
	mov dword [result32], edx
	jmp .start

.end_div:
	cmp byte [di + 1], '-'
	jne .pos1
	sub dword [result32], edx 
	jmp .cont1

.pos1:
	add dword [result32], edx

.cont1:
	mov edx, 0
	mov eax, dword [result32]
	idiv dword [num32]
	mov dword [result32], eax
	jmp .start

.clean:
	mov dword [result32], 0
	jmp .start	

.return:
	ret

section .text
calG16:
	call scrollUpWindow
	call setCursorPosition1
	mov word [result], 0
	mov word [num], 0

.start:
	call scrollUpWindow
	call setCursorPosition1
	mov ax, 0
	mov byte [opr_mode], 0
	mov word [num], 0
	mov bh, 0
	mov bl, 0Fh
	mov si, msg_result
	call printString
	mov ax, word [result]
	call WriteInt16
	mov si, msg_newLine
	call printString

	mov bh, 0
	mov bl, 0Fh
	mov si, msg_calculator
	call printString
	
	mov di, get_string
	mov al, '$'
	stosb
	call getStringG
	dec di

.getNum:
	mov ch, 0	
	mov dx, 0

.loop:
	mov bx, 0
	dec di
	mov al, byte [di]
	cmp al, 'c'
	je .clean
	cmp al, 'e'
	je .return
	cmp al, '-'
	je .sub
	cmp al, '+'
	je .add
	cmp al, '*'
	je .mul
	cmp al, '/'
	je .div
	cmp al, '$'
	je .end
	and al, 11001111b
	mov bl, al

.backNum:
	mov ax, 1
	mov cl, ch
	
.loop2:
	cmp cl, 0
	je .get
	imul ax, 10
	dec cl
	jmp .loop2

.get:
	imul bx, ax
	add dx, bx
	inc ch
	jmp .loop

.add:
	add word [result], dx
	jmp .getNum

.sub:
	sub word [result], dx
	jmp .getNum

.mul:
	add word [num], dx
	mov byte [opr_mode], 1
	jmp .getNum	

.div:
	cmp edx, 0
	je .start
	add word [num], dx
	mov byte [opr_mode], 2
	jmp .getNum

.end:
	cmp byte [opr_mode], 1
	je .end_mul
	cmp byte [opr_mode], 2
	je .end_div

	add word [result], dx
	jmp .start

.end_mul:
	cmp byte [di + 1], '-'
	jne .pos
	sub word [result], dx 
	jmp .cont

.pos:
	add word [result], dx

.cont:
	mov dx, word [result]
	imul dx, word [num]
	mov word [result], dx
	jmp .start

.end_div:
	cmp byte [di + 1], '-'
	jne .pos1
	sub word [result], dx 
	jmp .cont1

.pos1:
	add word [result], dx

.cont1:
	mov dx, 0
	mov ax, word [result]
	idiv word [num]
	mov word [result], ax
	jmp .start

.clean:
	mov word [result], 0
	jmp .start	

.return:
	ret

section .text
calG32:
	call scrollUpWindow
	call setCursorPosition1
	mov dword [result32], 0
	mov dword [num32], 0

.start:
	call scrollUpWindow
	call setCursorPosition1
	mov eax, 0
	mov byte [opr_mode], 0
	mov dword [num32], 0
	mov bh, 0
	mov bl, 0Fh
	mov si, msg_result
	call printString
	mov eax, dword [result32]
	call WriteInt32
	mov si, msg_newLine
	call printString

	mov bh, 0
	mov bl, 0Fh
	mov si, msg_calculator
	call printString
	
	mov di, get_string
	mov al, '$'
	stosb
	call getStringG
	dec di

.getNum:
	mov ch, 0	
	mov dx, 0

.loop:
	mov ebx, 0
	dec di
	mov al, byte [di]
	cmp al, 'e'
	je .return
	cmp al, 'c'
	je .clean
	cmp al, '-'
	je .sub
	cmp al, '+'
	je .add
	cmp al, '*'
	je .mul
	cmp al, '/'
	je .div
	cmp al, '$'
	je .end
	and al, 11001111b
	mov bl, al

.backNum:
	mov eax, 1
	mov cl, ch
	
.loop2:
	cmp cl, 0
	je .get
	imul eax, 10
	dec cl
	jmp .loop2

.get:
	imul ebx, eax
	add edx, ebx
	inc ch
	jmp .loop

.add:
	add dword [result32], edx
	jmp .getNum

.sub:
	sub dword [result32], edx
	jmp .getNum

.mul:
	add dword [num32], edx
	mov byte [opr_mode], 1
	jmp .getNum	

.div:
	cmp edx, 0
	je .start
	add dword [num32], edx
	mov byte [opr_mode], 2
	jmp .getNum

.end:
	cmp byte [opr_mode], 1
	je .end_mul
	cmp byte [opr_mode], 2
	je .end_div

	add dword [result32], edx
	jmp .start

.end_mul:
	cmp byte [di + 1], '-'
	jne .pos
	sub dword [result32], edx 
	jmp .cont

.pos:
	add dword [result32], edx

.cont:
	mov edx, dword [result32]
	imul edx, dword [num32]
	mov dword [result32], edx
	jmp .start

.end_div:
	cmp byte [di + 1], '-'
	jne .pos1
	sub dword [result32], edx 
	jmp .cont1

.pos1:
	add dword [result32], edx

.cont1:
	mov edx, 0
	mov eax, dword [result32]
	idiv dword [num32]
	mov dword [result32], eax
	jmp .start

.clean:
	mov dword [result32], 0
	jmp .start	

.return:
	ret

section .data
	msg_result:		DB	"result is: ", 0
	msg_calculator:		DB	"Enter string: ", 0
	msg_help:		DB	"Welcome to calculator", 0Dh, 0Ah,
				DB	"enter c for clear result / enter e for exit from calculator", 0Dh, 0Ah, 0Dh, 0Ah, 0
	opr_mode:		DB	0
	
section .bss
	num:			RESW	1
	result: 		RESW	1
	get_string:		RESB	32
	num32:			RESD	1
	result32: 		RESD	1
