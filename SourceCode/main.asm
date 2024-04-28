section .text
global main

main:
	mov si, msg_welcome				
	call printString				; Print msg welcome

	call login					; Get password for enter to os

	mov si, msg_switchMode				; Do you want switch to graphics mode?
	call printString
	mov di, get_choice
	call getString
	mov si, get_choice
	mov di, cmd_yes
	call strcmp
	jc .graphicsMode				; Yes, we're done
							; No, contnue...
	mov si, msg_newLine
	call printString

.main_loop:
	mov si, username				; Print terminal line
	call printString
	mov si, msg_lineConsole
	call printString

	mov di, get_command				; Get command
	call getString
	
	mov si, get_command	
	mov di, cmd_setlogin
	call strcmp					; Compare input command with another commands
	jc .setlogin					; If ok go to proc
							; If no compare with another commands...
	mov si, get_command
	mov di, cmd_setloginN
	call strcmp
	jc .setlogin_user

	mov si, get_command
	mov di, cmd_setloginP
	call strcmp
	jc .setlogin_pass

	mov si, get_command
	mov di, cmd_logout
	call strcmp
	jc .logout

	mov si, get_command
	mov di, cmd_about
	call strcmp
	jc .about

	mov si, get_command
	mov di, cmd_cls
	call strcmp
	jc .clear

	mov si, get_command
	mov di, cmd_cal
	call strcmp
	jc .cal16

	mov si, get_command
	mov di, cmd_app
	call strcmp
	jc .app

	mov si, get_command
	mov di, cmd_help
	mov cl, 3
	call strcmp_count
	jc .help

	mov si, get_command
	mov di, cmd_rep
	mov cl, 2
	call strcmp_count
	jc .rep_cmd

	mov si, get_command
	mov di, cmd_time
	call strcmp
	jc .time

	mov si, get_command
	mov di, cmd_runx
	call strcmp
	jc .graphicsMode

	mov si, get_command
	mov di, cmd_pro
	call strcmp
	jc .switch_pro

	mov si, get_command
	mov di, cmd_real
	call strcmp
	jc .switch_real

	mov si, get_command
	mov di, cmd_reset
	call strcmp
	jc .reset

	mov si, get_command
	mov di, cmd_shutdown
	call strcmp
	jc .shutdown

	mov si, get_command
	cmp byte [si], ''
	je .main_loop

	mov si, get_command
	call printString
	mov si, msg_nocommand
	call printString

	jmp .main_loop					; Loop to main loop

.setlogin:
	call setLogin
	jmp .main_loop

.setlogin_user:
	call setLoginUser
	jmp .main_loop

.setlogin_pass:
	call setLoginPass
	jmp .main_loop

.logout:
	mov si, msg_logout
	call printString
	call login
	mov si, msg_newLine
	call printString
	jmp .main_loop

.about:
	call about
	jmp .main_loop

.clear:
	call clear
	jmp .main_loop

.help:
	mov di, get_command
	call help
	jmp .main_loop

.rep_cmd:
	mov di, get_command
	call repCmd
	jmp .main_loop

.time:
	call time
	jmp .main_loop

.reset:
	call reset
	mov byte [mode], 0
	jmp .return

.cal16:
	cmp byte [mode], 1
	je .cal32

	call calculator16
	mov si, msg_newLine
	call printString
	jmp .main_loop

.cal32:
	call calculator32
	mov si, msg_newLine
	call printString
	jmp .main_loop

.app:
	call gameText
	jmp .main_loop	

.graphicsMode:	
	call graphicsmode
	cmp word [exitNum], 1
	je .logout
	cmp word [exitNum], 2
	je .reset
	cmp word [exitNum], 3
	je .shutdown
	jmp .main_loop

.switch_pro:
	mov byte [mode], 1
	mov si, msg_pro
	call printString
	jmp .main_loop

.switch_real:
	mov byte [mode], 0
	mov si, msg_real
	call printString
	jmp .main_loop

.shutdown:
	mov si, msg_shutdown
	call printString

.return:
	ret						; Return to kernel

%INCLUDE "include.asm"					; Include all files

section .data
	msg_newLine	 DB							  0Dh, 0Ah, 0
	msg_welcome: 	 DB ".::Welcome to YassOS::."				, 0Dh, 0Ah, 0
	msg_switchMode:  DB "Do you want switch to graphic mode?[y/n] "		, 0
	msg_lineConsole: DB "@yassOS: "						, 0
	msg_logout: 	 DB "Loging out."					, 0Dh, 0Ah, 0
	msg_shutdown: 	 DB "shuting down."					, 0Dh, 0Ah, 0
	msg_nocommand: 	 DB ": command not found"				, 0Dh, 0Ah, 0
	msg_pro: 	 DB "os switch to protected mode (32bit)"		, 0Dh, 0Ah, 0
	msg_real: 	 DB "os switch to real mode (16bit)"			, 0Dh, 0Ah, 0

	cmd_yes: 	 DB "y"							, 0
	cmd_setlogin: 	 DB "set login"						, 0
	cmd_setloginN: 	 DB "set login -n"					, 0
	cmd_setloginP:   DB "set login -p"					, 0
	cmd_logout: 	 DB "logout"						, 0
	cmd_about: 	 DB "about"						, 0
	cmd_cls: 	 DB "cls"						, 0
	cmd_runx: 	 DB "runx"						, 0
	cmd_shutdown: 	 DB "shutdown"						, 0
	cmd_help: 	 DB "help"						, 0
	cmd_reset: 	 DB "reset"						, 0
	cmd_rep: 	 DB "rep"						, 0
	cmd_time: 	 DB "time"						, 0
	cmd_pro: 	 DB "pro"						, 0
	cmd_real: 	 DB "real"						, 0
	cmd_cal: 	 DB "cal"						, 0
	cmd_app: 	 DB "app"						, 0
	
	mode:		 DB  0				; Show os mode (0 is real / 1 is pro)

section .bss
	get_choice:   resb	1			; Res a byte for choice switch
	get_command:  resb	32			; Res 32 byte for input command
