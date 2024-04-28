section .text
strcmp: 
.loop1:
	mov al, [si]		; Grab a byte from SI 
	mov bl, [di]   		; Grab a byte from DI 
	cmp al, bl    	        ; Are they equal? 
	jne .notequal  		; Nope, we're done. 
    
	cmp al, 0  		; Are both bytes (they were equal before) null? 
	je .return  	        ; Yes, we're done. 
  
	inc di			; Increment di
	inc si			; Increment si
	jmp .loop1
  
.notequal: 
	clc  			; Not equal, set carry flag 0 
	ret 
  
.return:  
	stc  			; Equal, set carry flag 1
	ret

strcmp_count:
.loop2:
	
	mov al, [si]		; Grab a byte from SI 
	mov bl, [di]   		; Grab a byte from DI 
	cmp al, bl    	        ; Are they equal? 
	jne .notequal  		; Nope, we're done. 

	cmp cl, 0
	je .return 
  
	inc di			; Increment di
	inc si			; Increment si
	dec cl
	jmp .loop2
  
.notequal: 
	clc  			; Not equal, set carry flag 0 
	ret 
  
.return:  
	stc  			; Equal, set carry flag 1
	ret

strcmp_space:
.loop3:

	mov al, [si]		; Grab a byte from SI 
	mov bl, [di]   		; Grab a byte from DI 
	cmp al, bl    	        ; Are they equal? 
	jne .notequal  		; Nope, we're done. 
    
	mov al, [si + 1]
	cmp al, 0  		; Are both bytes (they were equal before) null? 
	je .return  	        ; Yes, we're done. 
  
	inc di			; Increment di
	inc si			; Increment si
	jmp .loop3
  
.notequal: 
	clc  			; Not equal, set carry flag 0 
	ret 
  
.return:  
	mov al, [di + 1]
	cmp al, ' '
	jne .notequal  	        ; Yes, we're done. 
	stc  			; Equal, set carry flag 1
	ret
