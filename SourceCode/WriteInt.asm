;-----------------------------------------------------
;WriteInt16 PROC
;
; Writes a 16-bits signed binary integer to standard output
; in ASCII decimal.
; Receives: AX = the integer
; Returns:  nothing
; Comments: Displays a leading sign, no leading zeros.
;-----------------------------------------------------
;-----------------------------------------------------
;WriteInt32 PROC
;
; Writes a 32-bits signed binary integer to standard output
; in ASCII decimal.
; Receives: EAX = the integer
; Returns:  nothing
; Comments: Displays a leading sign, no leading zeros.
;-----------------------------------------------------

section .text
WriteInt16:
	 mov byte [neg_flag], 0   	 ; assume neg_flag is false
	 or ax, ax            		 ; is AX positive?
	 jns .WIS1            	         ; yes: jump to B1
	 neg ax                		 ; no: make it positive
	 mov byte [neg_flag], 1    	 ; set neg_flag to true

.WIS1:
	 mov cx, 0             		 ; digit count = 0
	 mov di, buffer_B
	 add di, 11
	 mov bx, 10          	         ; will divide by 10

.WIS2:
	 mov dx, 0                       ; set dividend to 0
	 div bx                          ; divide AX by 10
	 or dl, 30h          	         ; convert remainder to ASCII
	 dec di               	 	 ; reverse through the buffer
	 mov [di], dl           	 ; store ASCII digit
	 inc cx                		 ; increment digit count
	 or ax, ax           	  	 ; quotient > 0?
	 jnz .WIS2              	 ; yes: divide again

	 ; Insert the sign.

	 dec di				 ; back up in the buffer
	 inc cx               		 ; increment counter
	 mov byte [di], '+' 		 ; insert plus sign
	 cmp byte [neg_flag], 0   	 ; was the number positive?
	 jz .WIS3              		 ; yes
	 mov byte [di], '-' 		 ; no: insert negative sign
	 jmp .return

.WIS3:					 ; Display the number
	inc di

.return:
	mov si, di
	call printString
	ret

WriteInt32:
	 mov byte [neg_flag_32], 0   	 ; assume neg_flag is false
	 or eax, eax            	 ; is AX positive?
	 jns .WIS1_32            	         ; yes: jump to B1
	 neg eax                	 ; no: make it positive
	 mov byte [neg_flag_32], 1    	 ; set neg_flag to true

.WIS1_32:
	 mov cx, 0             		 ; digit count = 0
	 mov di, buffer_B
	 add di, 11
	 mov ebx, 10          	         ; will divide by 10

.WIS2_32:
	 mov edx, 0                       ; set dividend to 0
	 div ebx                         ; divide AX by 10
	 or dl, 30h          	         ; convert remainder to ASCII
	 dec di               	 	 ; reverse through the buffer
	 mov [di], dl           	 ; store ASCII digit
	 inc cx                		 ; increment digit count
	 or eax, eax             	 ; quotient > 0?
	 jnz .WIS2_32              	 ; yes: divide again

	 ; Insert the sign.

	 dec di				 ; back up in the buffer
	 inc cx               		 ; increment counter
	 mov byte [di], '+' 		 ; insert plus sign
	 cmp byte [neg_flag_32], 0   	 ; was the number positive?
	 jz .WIS3_32              	 ; yes
	 mov byte [di], '-' 		 ; no: insert negative sign
	 jmp .return

.WIS3_32:				 ; Display the number
	inc di

.return:
	mov si, di
	call printString
	ret

section .data
	buffer_B:  times 12 DB 0, 0  	 ; buffer to hold digits

section .bss
	neg_flag_32:  RESB 1
	neg_flag:  RESB 1
