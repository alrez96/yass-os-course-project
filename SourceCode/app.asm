section .text
gameText:
	mov word [game_score], 0
	mov byte [game_goal], 0
	mov byte [game_choice], 0

	mov si, msg_gameHelp
	call printString	

.gameLoop:
	mov ah, 02h
	int 1Ah
	imul dx, 29
	imul dx, 31
	shr dx, 2
	and dh, 03h
	cmp dh, 0
	jne .cont
	add dh, 1
.cont:
	mov byte [game_goal], dh
	mov si, msg_newLine
	call printString
	mov si, msg_score
	call printString
	mov ax, 0
	mov ax, word [game_score]
	call WriteInt16
	mov si, msg_newLine
	call printString
	mov si, msg_gameCh
	call printString

	mov di, game_choice
	call getString	

	mov si, msg_e
	mov di, game_choice
	call strcmp
	jc .return
	mov si, msg_1
	mov di, game_choice
	call strcmp
	jc .ch1
	mov si, msg_2
	mov di, game_choice
	call strcmp
	jc .ch2
	mov si, msg_3
	mov di, game_choice
	call strcmp
	jc .ch3
	jmp .gameLoop

.ch1:
	cmp byte [game_goal], 1
	jne .noCor
	add word [game_score], 1
	jmp .Cor
.ch2:
	cmp byte [game_goal], 2
	jne .noCor
	add word [game_score], 1
	jmp .Cor
.ch3:
	cmp byte [game_goal], 3
	jne .noCor
	add word [game_score], 1
	jmp .Cor

.noCor:
	mov si, msg_wro
	call printString
	mov ax, 0
	mov al, byte [game_goal]
	call WriteInt16
	mov si, msg_wro2
	call printString
	jmp .gameLoop
.Cor:
	mov si, msg_cor
	call printString
	jmp .gameLoop

.return:
	mov si, msg_newLine
	call printString
	ret	

gameG:
	mov word [game_score], 0
	mov byte [game_goal], 0
	mov byte [game_choice], 0
.drawZ:
	mov word [posx], 59
	mov word [posy], 99
	mov ah, 02h
	int 1Ah
	imul dx, 29
	imul dx, 31
	shr dx, 2
	and dh, 03h
	cmp dh, 0
	jne .cont2
	add dh, 1
.cont2:
	mov byte [game_goal], dh

.drawGM:

	call scrollUpWindow
.draw1:
	mov cx, 60
	mov dx, 100
	mov al, 07h
	call drawMora
.draw2:
	mov cx, 135
	mov dx, 100
	mov al, 07h
	call drawMora
.draw3:
	mov cx, 210
	mov dx, 100
	mov al, 07h
	call drawMora

	mov cx, word [posx]
	mov dx, word [posy]
	mov al, 04h
	call drawMora2

	mov dh, 1
	mov dl, 1
	call setCursorPositionP
	mov si, msg_score
	call printStringG
	mov ax, word [game_score]
	call WriteInt16

.getKp1:
	mov ah, 00h
	int 16h

	cmp al, 1Bh
	je .reto9
	cmp al, 0Dh
	je .enter2
	cmp al, 'd'
	je .right2
	cmp al, 'a'
	je .left2
	jmp .getKp1

.enter2:
	cmp word [posx], 134
	je .ch2P
	cmp word [posx], 209
	je .ch3P
	cmp byte [game_goal], 1
	je .win
	jmp .lost
.ch2P:
	cmp byte [game_goal], 2
	je .win
	jmp .lost
.ch3P:
	cmp byte [game_goal], 3
	je .win
	jmp .lost

.right2:
	cmp word [posx], 209
	je .getKp1
	add word [posx], 75
	jmp .drawGM
.left2:
	cmp word [posx], 59
	je .getKp1
	sub word [posx], 75
	jmp .drawGM

.win:
	add word [posx], 1
	add word [posy], 1
	mov cx, word [posx]
	mov dx, word [posy]
	mov al, 02h
	call drawMora
	add word [game_score], 1
.get6:
	mov ah, 00h
	int 16h
	cmp al, 1Bh
	je .reto9
	cmp al, 0Dh
	je .drawZ
	jmp .get6
.lost:
	add word [posx], 1
	add word [posy], 1
	mov cx, word [posx]
	mov dx, word [posy]
	mov al, 04h
	call drawMora
	cmp byte [game_goal], 1
	je .red1W
	cmp byte [game_goal], 2
	je .red2W
	cmp byte [game_goal], 3
	je .red3W
.red1W:
	mov cx, 85
	mov dx, 122
	mov al, 02h
	call Ball
	jmp .get7
.red2W:
	mov cx, 160
	mov dx, 122
	mov al, 02h
	call Ball
	jmp .get7
.red3W:
	mov cx, 235
	mov dx, 122
	mov al, 02h
	call Ball
	jmp .get7
.get7:
	mov ah, 00h
	int 16h
	cmp al, 1Bh
	je .reto9
	cmp al, 0Dh
	je .drawZ
	jmp .get7

.reto9:
	ret

section .data
	msg_gameHelp:	DB	"Welcome to Game", 0Dh, 0Ah,
			DB	"Enter a num 1, 2 or 3, for exit enter e", 0Dh, 0Ah, 0
	msg_wro:	DB	"Oh no! goal was in ", 0
	msg_wro2:	DB	", try again:)", 0Dh, 0Ah, 0
	msg_cor:	DB	"Excellet! you find goal, +1 score for you:)", 0Dh, 0Ah, 0
	msg_gameCh:	DB	"Enter choice: ", 0
	msg_score:	DB	"Your score: ", 0
	msg_1:		DB	"1", 0
	msg_2:		DB	"2", 0
	msg_3:		DB	"3", 0
	msg_e:		DB	"e", 0

section .bss
	game_score:		RESW	1
	game_goal:		RESB	1
	game_choice:		RESB	1
	posx:			RESW	1
	posy:			RESW	1
