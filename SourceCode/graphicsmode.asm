section .text
graphicsmode:
	mov word [exitNum], 0
	mov word [mouse_x], 20
	mov word [mouse_y], 50
	mov word [mouseS_x], 20
	mov word [mouseS_y], 50

	call setVideo

.loop:
	call scrollUpWindow
	call setCursorPosition
	call stringCh
	call printStringG
	call showMode
	call showTime
	call showUser
	call showSymbol
	call printScreen
	call colorIcon
	call getKey
	cmp al, 0Dh
	je .enter
	cmp al, 'd'
	je .right
	cmp al, 'a'
	je .left
	cmp al, 'w'
	je .up
	cmp al, 's'
	je .down
	jmp .loop

.enter:
	cmp word [mouse_y], 50
	je .ret1
	cmp word [mouse_y], 80
	je .ret2
	cmp word [mouse_y], 110
	je .ret3
	jmp .loop

.ret1:
	cmp word [mouse_x], 120
	je .calS
	cmp word [mouse_x], 220
	je .app
	call showAbout		
	jmp .loop

.app:
	call showGame
	jmp .loop
.calS:
	call showCal
	jmp .loop

.ret2:
	cmp word [mouse_x], 120
	je .return
	cmp word [mouse_x], 220
	je .retlogout
	call showSetLogin
	jmp .loop

.ret3:
	cmp word [mouse_x], 120
	je .retShut
	cmp word [mouse_x], 220
	je .swit
	jmp .retReset
	jmp .loop

.swit:
	cmp byte [mode], 1
	je .swit32
	mov byte [mode], 1 
	jmp .loop  

.swit32:
	mov byte [mode], 0
	jmp .loop  

.right:
	cmp word [mouse_x], 220
	je .loop
	add word [mouse_x], 100
	jmp .loop

.left:
	cmp word [mouse_x], 20
	je .loop
	sub word [mouse_x], 100
	jmp .loop

.up:
	cmp word [mouse_y], 50
	je .loop
	sub word [mouse_y], 30
	jmp .loop

.down:
	cmp word [mouse_y], 110
	je .loop
	add word [mouse_y], 30
	jmp .loop

.retShut:
	mov word [exitNum], 3
	jmp .return

.retReset:
	mov word [exitNum], 2
	jmp .return

.retlogout:
	mov word [exitNum], 1

.return:
	call setText
	ret

showGame:
	call gameG

	ret

showUser:
	mov dh, 23
	mov dl, 1
	call setCursorPositionP
	mov si, username
	call printStringG

	mov dh, 0
	mov dl, 0
	call setCursorPositionP
	ret


showTime:
	mov dh, 1
	mov dl, 31
	call setCursorPositionP
	call time

	mov dh, 0
	mov dl, 0
	call setCursorPositionP
	ret

showMode:
	mov dh, 1
	mov dl, 17
	call setCursorPositionP
	cmp byte [mode], 1
	je .sh32
	mov si, show_16
	call printStringG
	jmp .retop
.sh32:
	mov si, show_32
	call printStringG

.retop:
	mov dh, 0
	mov dl, 0
	call setCursorPositionP
	ret

showCal:
	cmp byte [mode], 1 
	je .cal32
	call calG16
	jmp .retuy
.cal32:
	call calG32

.retuy:

	ret

showSetLogin:
	call scrollUpWindow
	mov dh, 1
	mov dl, 1
	mov byte [curPos_row], 1
	mov byte [curPos_col], 1

.loop32:
.white1:
	mov dh, 1
	mov si, show_userOnly
	call setCursorPositionP
	call printStringG
.white2:
	mov dh, 4
	mov si, show_passOnly
	call setCursorPositionP
	call printStringG
.white3:
	mov dh, 7
	mov si, show_both
	call setCursorPositionP
	call printStringG

	cmp byte [curPos_row], 1
	je .red1
	cmp byte [curPos_row], 4
	je .red2
	cmp byte [curPos_row], 7
	je .red3

.red1:
	mov dh, byte [curPos_row]
	call setCursorPositionP
	mov si, show_userOnly
	mov bl, 04h
	call printStringGCol
	jmp .getk1
.red2:
	mov dh, byte [curPos_row]
	call setCursorPositionP
	mov si, show_passOnly
	mov bl, 04h
	call printStringGCol
	jmp .getk1
.red3:
	mov dh, byte [curPos_row]
	call setCursorPositionP
	mov si, show_both
	mov bl, 04h
	call printStringGCol
	
.getk1:
	call getKey
	cmp al, 'w'
	je .up
	cmp al, 's'
	je .down
	cmp al, 0Dh
	je .enter
	cmp al, 1Bh
	je .ret72
	jmp .getk1

.up:
	cmp byte [curPos_row], 1
	je .getk1
	sub byte [curPos_row], 3 
	jmp .loop32
.down:
	cmp byte [curPos_row], 7
	je .getk1
	add byte [curPos_row], 3 
	jmp .loop32
.enter:
	cmp byte [curPos_row], 4
	je .passonly
	cmp byte [curPos_row], 7
	je .both

.useronly:
	call scrollUpWindow
	call setCursorPosition1
	mov bl, 0Fh
	call setLoginUser
	jmp .getk12
.passonly:
	call scrollUpWindow
	call setCursorPosition1
	mov bl, 0Fh
	call setLoginPass
	jmp .getk12
.both:
	call scrollUpWindow
	call setCursorPosition1
	mov bl, 0Fh
	call setLogin

.getk12:
	call getKey
	cmp al, 1Bh
	je .ret72
	jmp .getk12

.ret72:
	ret
	

showAbout:
	call scrollUpWindow
	call setCursorPosition1
	mov si, msg_about
	call printStringG
.getk:
	call getKey
	cmp al, 1Bh
	je .ret7
	jmp .getk

.ret7:
	ret

stringCh:
	cmp word [mouse_y], 50
	je .row1
	cmp word [mouse_y], 80
	je .row2
	cmp word [mouse_y], 110
	je .row3

.row1:
	cmp word [mouse_x], 120
	je .cal
	cmp word [mouse_x], 220
	je .app
	
	mov si, show_about
	jmp .returnto
.cal:
	mov si, show_cal
	jmp .returnto
.app:
	mov si, show_app
	jmp .returnto

.row2:
	cmp word [mouse_x], 120
	je .text
	cmp word [mouse_x], 220
	je .logout
	
	mov si, show_set
	jmp .returnto
.text:
	mov si, show_text
	jmp .returnto
.logout:
	mov si, show_logout
	jmp .returnto
.row3:
	cmp word [mouse_x], 120
	je .shutdown
	cmp word [mouse_x], 220
	je .mode
	
	mov si, show_reset
	jmp .returnto
.shutdown:
	mov si, show_shut
	jmp .returnto
.mode:
	mov si, show_mode
	jmp .returnto

.returnto:
	ret

printStringGCol:
	mov ah, 0Eh		; Teletype output
	mov bh, 0

.print_char:
	lodsb
	cmp al, 0		; Is null terminator?
	je .return		; Yes, we're done

	int 10h			; Print character on the screen		

	jmp .print_char

.return:
	ret

printStringG:
	mov ah, 0Eh		; Teletype output
	mov bh, 0
	mov bl, 0Fh

.print_char:
	lodsb
	cmp al, 0		; Is null terminator?
	je .return		; Yes, we're done

	int 10h			; Print character on the screen		

	jmp .print_char

.return:
	ret

scrollUpWindow:
	mov ah, 06h         ; Scroll up window
	mov al, 0           ; lines to scroll (0 = clear)
	mov bh, 00h         ; Background Color and Foreground color
	mov ch, 0           ; Upper row number
	mov cl, 0	    ; Left column number
	mov dh, 24          ; Lower row number (0-24)
	mov dl, 39	    ; Right column number (0-79)
	int 10h		    ; Call BIOS interrupt

	ret		    ; Return to main proc
	
setCursorPosition:
	mov ah, 02h
	mov bh, 0
	mov dh, 1
	mov dl, 1
	int 10h

	ret

setCursorPosition1:
	mov ah, 02h
	mov bh, 0
	mov dh, 0
	mov dl, 0
	int 10h

	ret

getCursorPosition:
	mov ah, 03h
	mov bh, 0
	int 10h

	ret

printScreen:
	call showIcon
	add word [mouseS_y], 30
	call showIcon
	add word [mouseS_y], 30
	call showIcon

	mov word [mouseS_y], 50
	mov word [mouseS_x], 120

	call showIcon
	add word [mouseS_y], 30
	call showIcon
	add word [mouseS_y], 30
	call showIcon

	mov word [mouseS_y], 50
	mov word [mouseS_x], 220

	call showIcon
	add word [mouseS_y], 30
	call showIcon
	add word [mouseS_y], 30
	call showIcon

	mov word [mouseS_y], 50
	mov word [mouseS_x], 20

	ret

colorIcon:
	mov ah, 0Ch
	mov al, 04h
	mov bh, 0

	mov cx, word [mouse_x]
	mov dx, word [mouse_y]

	call drawIcon

	ret

showIcon:
	mov ah, 0Ch
	mov al, 01h
	mov bh, 0

	mov cx, word [mouseS_x]
	mov dx, word [mouseS_y]

	call drawIcon2

	ret

showSymbol:
	mov ah, 0Ch
	mov al, 0Fh
	mov bh, 0
	
	call draw?
	call drawlog
	call drawreset	
	call drawshut
	call drawcal
	call drawapp
	call drawtext
	call drawlogin
	call drawmode
	
	ret

hideSymbol:
	mov ah, 0Ch
	mov al, 00h
	mov bh, 0
	
	ret

hideIcon:
	mov ah, 0Ch
	mov al, 00h
	mov bh, 0

	mov cx, word [mouse_x]
	mov dx, word [mouse_y]

	call drawIcon

	ret

setVideo:
	mov ah, 00h
	mov al, 13h
	int 10h	

	ret

setText:
	mov ah, 00h
	mov al, 03h
	int 10h	

	ret

getKey:
	mov ah, 00h
	int 16h

	ret

section .data
	show_about:	DB	"About", 0
	show_cal:	DB	"Calculator", 0
	show_app:	DB	"Game", 0
	show_set:	DB	"Set Login", 0
	show_text:	DB	"Text Mode", 0
	show_logout:	DB	"LogOut", 0
	show_reset:	DB	"Reset", 0
	show_shut:	DB	"ShutDown", 0
	show_mode:	DB	"Switch Mode", 0
	show_16:	DB	"16_Bits", 0
	show_32:	DB	"32_Bits", 0
	show_userOnly:	DB	"User only", 0
	show_passOnly:	DB	"Password only", 0
	show_both:	DB	"Both change", 0

section .bss
	curPos_row:	RESB		1
	curPos_col:	RESB		1
	mouse_x:	RESW		1
	mouse_y:	RESW		1
	mouseS_x:	RESW		1
	mouseS_y:	RESW		1
	exitNum:	RESB		1
