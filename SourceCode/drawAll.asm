section .text
draw?:

	mov cx, 58
	mov dx, 54
	int 10h
	
	add dx, 1
	int 10h
	add dx, 1
	int 10h
	sub dx, 2

	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
;**************
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h

	add dx,1
	int 10h
;*******************
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
;**************
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,2
	int 10h
	
	ret

drawapp:
	mov cx,252
	mov dx,53
	int 10h

;**********************
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
;**********************
	add dx,1
	int 10h
	
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
;**********************
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
;**********************
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
;*******************
	add cx,8
	add dx,10
	int 10h
	
;********************

	
	add cx,1
	sub dx,2
	int 10h
	
	add cx,1
	sub dx,2
	int 10h
	
	
	add cx,1
	sub dx,2
	int 10h
	
	
	add cx,1
	sub dx,2
	int 10h
;************************

	sub cx,5
	add dx,10
	int 10h
	
;********************
	sub cx,1
	sub dx,1
	int 10h
	
	sub cx,1
	sub dx,1
	int 10h
	
	sub cx,1
	sub dx,1
	int 10h
	
	ret

drawcal:

	mov cx,150
	mov dx,53
	int 10h

;**********************
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h

	
;**********************
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h

;**********************
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	
;**********************
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
;********************
	add cx,4
	add dx,2
	int 10h
;*********************
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
;*************************
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
;*********************
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
;*************************
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
;*********************	
	add dx,7
	int 10h
	
	add dx,3
	int 10h  
	
	add dx,3
	int 10h 
;********************* 

	add cx,5
	int 10h
	
	sub dx,3
	int 10h
	
	sub dx,3
	int 10h
	
;***********************

	add cx,5
	int 10h
	
	add dx,3
	int 10h
	
	add dx,3
	int 10h

	ret

drawlog:
	mov cx,252
	mov dx,83
	int 10h
	
;*****************	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	

;******************

	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
;********************
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
;*************************
	sub dx,7
	add cx,6
	int 10h
;*************************

	sub cx,1
	sub dx,1
	int 10h
	
	sub cx,1
	sub dx,1
	int 10h
	
	sub cx,1
	sub dx,1
	int 10h
	
	sub cx,1
	sub dx,1
	int 10h
	
	sub cx,1
	sub dx,1

;***************************
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
	
;****************************

	sub cx,1
	add dx,1
	int 10h
	
	sub cx,1
	add dx,1
	int 10h
	
	sub cx,1
	add dx,1
	int 10h
	
	sub cx,1
	add dx,1
	int 10h
	
	sub cx,1
	add dx,1
	
;****************************

	add cx,1
	sub dx,1
	int 10h
	
	add cx,1
	sub dx,1
	int 10h
	
	add cx,1
	sub dx,1
	int 10h
	
	add cx,1
	sub dx,1
	int 10h
	
	add cx,1
	sub dx,1
	int 10h
	
;****************************
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	ret

drawlogin:

	mov cx,60
	mov dx,86
	int 10h
	
;******************
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
	
	
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
;*****************
	
	sub cx,6
	sub dx,6
	int 10h
;*****************
	sub cx,1
	add dx,1
	int 10h
	
	sub cx,1
	add dx,1
	int 10h
	
	
	sub cx,1
	add dx,1
	int 10h
	
	sub cx,1
	add dx,1
	int 10h
	
	sub cx,1
	add dx,1
	int 10h
	
	sub cx,1
	add dx,1
	int 10h
;********************
	add cx,2
	int 10h
	
	add cx,2
	int 10h
	
	add cx,2
	int 10h
	
	add cx,2
	int 10h
	
	add cx,2
	int 10h
	
	add cx,2
	int 10h
	
;**********************

	add dx,2
	int 10h
;********************

	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h

	ret

drawmode:
	
	mov cx,250
	mov dx,115
	int 10h
;**********************

	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
		
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	
	add cx,1
	int 10h
	
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	
	add cx,1
	int 10h
	
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
;**********************

	sub cx,1
	sub dx,1
	int 10h
	
	sub cx,1
	sub dx,1
	int 10h
	
	sub cx,1
	sub dx,1
	int 10h
	
	sub cx,1
	sub dx,1
	int 10h
;***********************
	add cx,4
	add dx,4
	
	
	sub cx,1
	add dx,1
	int 10h
	
	sub cx,1
	add dx,1
	int 10h
	
	sub cx,1
	add dx,1
	int 10h
	
	sub cx,1
	add dx,1
	int 10h
	
	add cx,4
	sub dx,4
;*************************

	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
;**************************

	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
;*************************

	add cx,1
	sub dx,1
	int 10h
	
	add cx,1
	sub dx,1
	int 10h
	
	add cx,1
	sub dx,1
	int 10h
	
	add cx,1
	sub dx,1
	int 10h
	
	sub cx,4
	add dx,4
;************************

	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
	
	sub cx,4
	sub dx,4
;*************************

	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
;***********************

	ret

drawreset:
	mov cx,53
	mov dx,113
	int 10h
	
;**************************

	add dx,1
	int 10h
	
	add dx,1
	int 10h

	add dx,1
	int 10h

	add dx,1
	int 10h

	sub dx,4
	int 10h

	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h

;**************************
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
;*****************************

	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
;*********************

	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	add dx,1
	int 10h

;**********************

	sub cx,1
	sub dx,1
	int 10h
	
	sub cx,1
	sub dx,1
	int 10h
	
	sub cx,1
	sub dx,1
	int 10h
	
	sub cx,1
	sub dx,1
	int 10h

;**********************

	add cx,1
	sub dx,1
	int 10h
	
	add cx,1
	sub dx,1
	int 10h
	
	add cx,1
	sub dx,1
	int 10h
	
	add cx,1
	sub dx,1
	int 10h

;**********************
	ret

drawshut:
	mov cx,151
	mov dx,112
	;int 10h

;**********************
	add cx,16
	;int 10h
	
;**********************
	add dx,1
	;int 10h
	
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
;**********************
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h

	sub cx,1
	int 10h
	
;**********************
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	;int 10h
	
	sub dx,1
	;int 10h
;***********************
	add cx,8
	;int 10h

;***********************

	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	
	
	ret

drawtext:

	mov cx,152
	mov dx,83
	int 10h

;**********************
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
;**********************
	add dx,1
	int 10h
	
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
	add dx,1
	int 10h
	
;**********************
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
;**********************
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
	
	sub dx,1
	int 10h
;***********************

	add cx,3
	add dx,3
	int 10h
	
;**********************

	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
;***********************

	add dx,3
	int 10h
	
;***********************
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h

;*************************

	add dx,3
	int 10h
	
;********************

	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
		
	ret
	
drawIcon:
	mov si, cx
	mov di, dx
	add si, 80
	add di, 20

.loop1:
	int 10h
	add dx, 20
	int 10h
	cmp cx, si
	je .after
	inc cx
	sub dx, 20
	jmp .loop1

.after:
	mov cx, word [mouse_x]
	mov dx, word [mouse_y]

.loop2:
	int 10h
	add cx, 80
	int 10h
	cmp dx, di
	je .return
	inc dx
	sub cx, 80
	jmp .loop2

.return:	
	ret

drawIcon2:
	mov si, cx
	mov di, dx
	add si, 80
	add di, 20

.loop1:
	int 10h
	add dx, 20
	int 10h
	cmp cx, si
	je .after
	inc cx
	sub dx, 20
	jmp .loop1

.after:
	mov cx, word [mouseS_x]
	mov dx, word [mouseS_y]

.loop2:
	int 10h
	add cx, 80
	int 10h
	cmp dx, di
	je .return
	inc dx
	sub cx, 80
	jmp .loop2

.return:	
	ret

drawMora:
	mov word [save_cx], cx
	mov si, cx
	mov di, dx

	add si, 50
	add di, 50

	mov ah, 0Ch
	mov bh, 0

.loop:
	cmp dx, di
	je .ret87
	int 10h
	cmp cx, si
	je .add
	inc cx
	jmp .loop

.add:
	mov cx, word [save_cx]
	inc dx
	jmp .loop

.ret87:
	ret

drawMora2:
	mov word [savCX], cx
	mov word [savDX], dx
	mov si, cx
	mov di, dx

	add si, 52
	add di, 51

.loop1:
	int 10h
	add dx, 51
	int 10h
	cmp cx, si
	je .after
	inc cx
	sub dx, 51
	jmp .loop1

.after:
	mov cx, word [savCX]
	mov dx, word [savDX]

.loop2:
	int 10h
	add cx, 52
	int 10h
	cmp dx, di
	je .return
	inc dx
	sub cx, 52
	jmp .loop2

.return:	
	ret

Ball:
	mov ah, 0Ch
	mov bh, 0
	int 10h
;****************
	
	add cx,1
	int 10h
	
;*************
	
	add cx,1
	add dx,1
	int 10h
;*********************
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
;***********************
	sub cx,1
	add dx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
;*************************
	add dx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
	
	sub cx,1
	int 10h
;*************************** start to fall, 3 times filling 
	add cx,1
	add dx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
	
	add cx,1
	int 10h
;******************************
	sub cx,1
	add dx,1
	int 10h
	
	sub cx,1
	int 10h
	
	

	ret


section .bss
	save_cx:	RESW	1
	savCX:		RESW	1	
	savDX:		RESW	1
