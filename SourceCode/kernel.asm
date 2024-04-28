BITS 16

section .text
kernelMain:

    	; First we should set segments and stack
        ; Do not mess with these numbers!
	cli
	mov ax, 0
	mov ss, ax
	mov sp, 0FFFFh
	sti
	mov ax, 2000h
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

;******************************************************

	pusha			; Push all registers to stack for save state

	mov word [exitNum], 0
	
	call clear		; Clear the Screen before run OS
	call main		; Call main proc

	popa			; Pop all registers to stack for load state

	mov si, get_command
	mov di, cmd_reset
	call strcmp
	jc kernelMain		; Jump to kernelMain for reset the OS
	cmp word [exitNum], 2
	je kernelMain

        ; Now we put cpu in halt state so the computer can be turned off
	cli
    	hlt

	jmp exitOS

%INCLUDE "main.asm"

exitOS:
