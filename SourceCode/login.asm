section .text
login:

.get_password:	
	mov si, msg_getPassword
	call printString			; Print msg
	mov si, username
	call printString			; Print username
	mov si, msg_showcolon
	call printString

	mov di, get_password			; Get password from user
	call getPassword
	
	mov si, password
	mov di, get_password
	call strcmp				; Compare inputed password with defulte one
	mov bh, 0
	mov bl, 0Fh
	jc .correctPassword			; Return to main proc if correct

.wrongPassword:					; Print error if wrong
	mov si, msg_wrongPassword
	call printString
	jmp .get_password

.correctPassword:
	ret					; Return to main proc

section .data
	username: DB "admin"
		  times 32-$+username  DB 0
	password: DB "123456"
		  times 32-$+password  DB 0
	saveduser: DB "admin"			; Saved defult username for use after reset			
		  times 32-$+saveduser DB 0
	savedpass: DB "123456"			; Saved defult password for use after reset
		  times 32-$+savedpass DB 0

	msg_getPassword: 	DB 							  0Dh, 0Ah,
				DB "Enter password for "				, 0
	msg_showcolon: 	        DB ": "							, 0
	msg_wrongPassword: 	DB "Sorry, try again."					, 0Dh, 0Ah, 0

section .bss
	get_password: resb 32			; Res 32 byte for get password
