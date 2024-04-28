section .text
help:
	add di, 4			; Input string is "help..."
	mov al, byte [di]
	cmp al, 0			; Input "help"
	je .help_main

	cmp al, ' '			; Input "help command"
	je .help_command

	jmp .nocommand			; Undefined input 

.help_main:
	mov si, msg_mainHelp		; Print help for all commands
	call printString
	jmp .return

.help_command:				; Find command's input
	inc di
	mov dx, di			; Save di address

	mov si, cmd_time
	call strcmp
	mov si, msg_helpTime
	jc .print_help

	mov di, dx			; Load saved address to di
	mov si, cmd_about
	call strcmp
	mov si, msg_helpAbout
	jc .print_help

	mov di, dx
	mov si, cmd_help
	call strcmp
	mov si, msg_helpHelp
	jc .print_help

	mov di, dx
	mov si, cmd_rep
	call strcmp
	mov si, msg_helpRep
	jc .print_help

	mov di, dx
	mov si, cmd_setlogin
	call strcmp
	mov si, msg_helpLogin
	jc .print_help

	mov di, dx
	mov si, cmd_cls
	call strcmp
	mov si, msg_helpCls
	jc .print_help

	mov di, dx
	mov si, cmd_logout
	call strcmp
	mov si, msg_helpLogout
	jc .print_help

	mov di, dx
	mov si, cmd_reset
	call strcmp
	mov si, msg_helpReset
	jc .print_help

	mov di, dx
	mov si, cmd_shutdown
	call strcmp
	mov si, msg_helpShutdown
	jc .print_help

	mov di, dx
	mov si, cmd_runx
	call strcmp
	mov si, msg_helpRunx
	jc .print_help

	mov di, dx
	mov si, cmd_cal
	call strcmp
	mov si, msg_helpCal
	jc .print_help

	mov di, dx
	mov si, cmd_app
	call strcmp
	mov si, msg_helpApp
	jc .print_help

	mov di, dx
	mov si, cmd_pro
	call strcmp
	mov si, msg_helpPro
	jc .print_help

	mov di, dx
	mov si, cmd_real
	call strcmp
	mov si, msg_helpReal
	jc .print_help

	jmp .nocommand			; Undefined command
	
.print_help:
	call printString
	jmp .return

.nocommand:
	mov si, get_command
	call printString
	mov si, msg_nocommand
	call printString
	jmp .return

.return:				; Return to main proc
	ret

section .data:
	msg_mainHelp: 		DB 							  		  0Dh, 0Ah,
				DB "The following commands is available:"	     		        , 0Dh, 0Ah,
				DB "time"					     		        , 0Dh, 0Ah,
				DB "about"								, 0Dh, 0Ah, 
				DB "help"								, 0Dh, 0Ah,
				DB "rep"								, 0Dh, 0Ah,
				DB "set login"								, 0Dh, 0Ah,
				DB "cls"								, 0Dh, 0Ah,
				DB "logout"								, 0Dh, 0Ah,
				DB "reset"								, 0Dh, 0Ah,
				DB "shutdown"								, 0Dh, 0Ah,
				DB "runx"								, 0Dh, 0Ah,
				DB "cal"								, 0Dh, 0Ah,
				DB "app"								, 0Dh, 0Ah,
				DB "pro"								, 0Dh, 0Ah,
				DB "real"								, 0Dh, 0Ah,
				DB 									  0Dh, 0Ah, 0
	msg_helpTime: 		DB "time: this command displays the time in HH:MM:SS format"		, 0Dh, 0Ah, 0
	msg_helpAbout: 		DB "about: this command displays the information of OS"			, 0Dh, 0Ah, 0
	msg_helpHelp: 		DB "help: this command will guide you"					, 0Dh, 0Ah, 0
	msg_helpRep: 		DB "rep: this command is used to repeat"				, 0Dh, 0Ah, 0
	msg_helpLogin: 		DB "set login: this command is used to change user and password"	, 0Dh, 0Ah,
				DB "use -n for user only or -p for password only"			, 0Dh, 0Ah, 0
	msg_helpCls: 		DB "cls: this command is used to clear the screen"			, 0Dh, 0Ah, 0
	msg_helpLogout: 	DB "logout: this command is used to loging out from OS"			, 0Dh, 0Ah, 0
	msg_helpReset: 		DB "reset: this command is used to reset the OS"			, 0Dh, 0Ah, 0
	msg_helpShutdown: 	DB "shutdown: this command is used shuting down the OS"			, 0Dh, 0Ah, 0
	msg_helpRunx: 		DB "runx: this command is used to swithc to graphics mode"		, 0Dh, 0Ah, 0
	msg_helpCal: 		DB "cal: this command is used to open the calculator"			, 0Dh, 0Ah, 0
	msg_helpApp: 		DB "app: this command is used to open the app"				, 0Dh, 0Ah, 0
	msg_helpPro: 		DB "pro: this command is used to switch to protected mode (32 bits)"	, 0Dh, 0Ah, 0
	msg_helpReal: 		DB "real: this command is used to switch to real mode (16 bits)"	, 0Dh, 0Ah, 0
