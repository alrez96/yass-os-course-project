section .text
getPassword:
	mov cl, 0		; Counter number of characters
 
.get_key:
	mov ah, 00h		; Read key press
	int 16h   		; Call BIOS interrupt
 
	cmp al, 08h     	; Backspace pressed?
   	je .backspace   	; Yes, handle it
 
   	cmp al, 0Dh  		; Enter pressed?
   	je .return     	        ; Yes, we're done
 
   	cmp cl, 1Fh    	        ; 31 chars inputted?
   	je .get_key     	; Yes, only let in backspace and enter
 
   	stosb 		        ; Put character in buffer

	mov ah, 0Eh
   	mov al, '*'
   	int 10h      		; Print out '*' inside character

   	inc cl
   	jmp .get_key
 
.backspace:
   	cmp cl, 0		; Beginning of string?
   	je .get_key		; Yes, ignore the key
 
   	dec di
   	mov byte [di], 0	; Delete character
   	dec cl			; Decrement counter as well
 
   	mov ah, 0Eh
   	mov al, 08h		; Backspace ASCII 
   	int 10h			; Backspace on the screen
 
   	mov al, ' '
   	int 10h			; Blank character out
 
   	mov al, 08h
   	int 10h			; Backspace again
 
   	jmp .get_key
 
.return:
   	mov al, 0		; Null terminator
   	stosb
 
   	mov ah, 0Eh
   	mov al, 0Dh
   	int 10h

   	mov al, 0Ah
   	int 10h			; New line
	 
   	ret			; Return to main proc
