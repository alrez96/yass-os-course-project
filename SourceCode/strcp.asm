strcp:
.loop:
	cmp byte [si], 0	; Is null terminator
	je .return		; Yes, we're done
	cld			; Increment si & di
	lodsb			; Load char from si to al
	stosb			; Save char from al to buffer
	jmp .loop

.return:
   	mov al, 0
   	stosb			; null terminator
	ret
