section .text
setLogin:				; Change username and password
	call login			; Call login proc for get accses
	
	mov si, msg_getnewUser
	call printString

	mov di, username		; Get new username
	call getString

	mov si, msg_getnewPass
	call printString

	mov di, password		; Get new password
	call getPassword

	mov si, msg_change
	call printString
	
	ret

setLoginUser:				; Change username
	call login
	
	mov si, msg_getnewUser
	call printString

	mov di, username		; Get new username
	call getString

	mov si, msg_changeUser
	call printString

	ret

setLoginPass:				; Change password
	call login

	mov si, msg_getnewPass
	call printString

	mov di, password		; Get new password
	call getPassword

	mov si, msg_changePass
	call printString

	ret

section .data
	msg_getnewUser: 	DB "Enter new username: "				, 0
	msg_getnewPass: 	DB "Enter new password: "				, 0
	msg_change: 		DB "The username and password changed Successfully."	, 0Dh, 0Ah, 0Dh, 0Ah, 0
	msg_changeUser: 	DB "The username changed Successfully."			, 0Dh, 0Ah, 0Dh, 0Ah, 0
	msg_changePass: 	DB "The password changed Successfully."			, 0Dh, 0Ah, 0Dh, 0Ah, 0
