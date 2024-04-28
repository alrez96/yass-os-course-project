section .text
repCmd:

.loop:						; Go to end of string
	mov al, byte [di + 1]
	cmp al, 0
	je .count
	inc di
	jmp .loop
.count:						; Get num for count
	mov al, byte [di]
	cmp al, ' '
	je .command
	
	and al, 11001111b			; Convert char to number
	mov cl, al				; Save in cl reg
	dec di
	jmp .count

.command:					; Find command for repeat
	dec di
	mov al, byte [di - 1]
	cmp al, ' '
	je .repeat
	jmp .command

.repeat:
	mov dx, di				; Save di address to dx	
	
	mov si, cmd_time
	call strcmp_space
	jc .rep_time

	mov di, dx				; Load address from dx to di
	mov si, cmd_about
	call strcmp_space
	jc .rep_about

	jmp .nocommand				; Command don't found

.rep_time:
	mov byte [save], cl			; Save cl for don't change after call proc
	call time
	mov cl, byte [save]			; Load num to cl
	dec cl
	cmp cl, 0
	je .return
	jmp .rep_time

.rep_about:
	mov byte [save], cl
	call about
	mov cl, byte [save]
	dec cl
	cmp cl, 0
	je .return
	jmp .rep_about

.nocommand:
	mov si, get_command
	call printString
	mov si, msg_nocommand			; Print no command found
	call printString
	jmp .return

.return:
	ret 

section .data
	save: DB	0
