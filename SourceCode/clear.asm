section .text
clear:
	call cursorPosition

	mov ah, 06h         ; Scroll up window
	mov al, 0           ; lines to scroll (0 = clear)
	mov bh, 07h         ; Background Color and Foreground color
	mov ch, 0           ; Upper row number
	mov cl, 0	    ; Left column number
	mov dh, 24          ; Lower row number (0-24)
	mov dl, 79	    ; Right column number (0-79)
	int 10h		    ; Call BIOS interrupt

	ret		    ; Return to main proc

cursorPosition:
	mov bh, 0	    ; Page Number
	mov dh, 0	    ; Row
	mov dl, 0	    ; Column
    	mov ah, 02h	    ; Set cursor position
    	int 10h             ; Call BIOS interrupt

    	ret
