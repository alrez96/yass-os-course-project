section .text
reset:
	mov si, saveduser		; Point to defult username
	mov di, username		; Point to buffer
	call strcp			; Call strcp for copy the string

	mov si, savedpass		; Point to defult password	
	mov di, password		; Point to buffer
	call strcp			; Call strcp for copy the string

	ret				; Return to main proc
