section .text
about:
	mov si, msg_about							; Move to si reg for print it
	call printString							; Call printString proc

	ret									; Return to main proc

section .data
	msg_about:	DB				   	  0Dh, 0Ah,	; New line
			DB "*****************************"	, 0Dh, 0Ah,
	    		DB "YassOS              ver: 1.00"	, 0Dh, 0Ah,
			DB "Date:	         Mar/Apr 2016"	, 0Dh, 0Ah,
			DB "Yassaman         EbrahimZadeh"	, 0Dh, 0Ah,
			DB "Alireza 	      Rostami"		, 0Dh, 0Ah,
			DB				   	  0Dh, 0Ah,	; New line
			DB "Shahid Beheshti    University"	, 0Dh, 0Ah,
			DB "Machine Language and Assembly"	, 0Dh, 0Ah,
			DB "Thanks:                      "	, 0Dh, 0Ah,
			DB "Mr.Vahidi                    "	, 0Dh, 0Ah,
			DB "Mr.Saadati                   "	, 0Dh, 0Ah,
			DB "*****************************"	, 0Dh, 0Ah,
			DB					  0Dh, 0Ah, 0	; New line and null terminator
