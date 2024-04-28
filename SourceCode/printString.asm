section .text
printString:
	mov ah, 0Eh		; Teletype output

.print_char:
	lodsb
	cmp al, 0		; Is null terminator?
	je .return		; Yes, we're done

	int 10h			; Print character on the screen		

	jmp .print_char

.return:
	ret
