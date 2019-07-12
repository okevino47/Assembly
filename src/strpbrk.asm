BITS    64

SECTION .text

GLOBAL  strpbrk

strpbrk:
        PUSH    RBP                     ; opérations de base
        MOV     RBP, RSP                ; opérations de base

        XOR     RCX, RCX				; opérations de base
	    XOR     R8, R8					; opérations de base
        JMP     loop					; jump a la première loop

second_loop:
    	CMP     BYTE [RSI + R8], 0x0	; comparaison avec \0
    	JE      next		            ; jump a next si egal
    	MOV     R11B, [RDI + RCX]		; migration de valeur
    	CMP     [RSI + R8], R11B		; comparaison de R11B avec RSI + R8
    	JE      success				    ; jump si égal
    	INC     R8						; incrémentation du compteur
    	JMP     second_loop		        ; jump a la seconde loop
    
loop:
    	CMP     BYTE [RDI + RCX], 0x0	; comparaison avec \0
    	JE      failure			        ; jump à failure si égale
    	XOR     R8, R8					; remise à zéro du compteur
    	JMP     second_loop		        ; jump à la seconde loop

next:
    	INC     RCX						; incrementation du compteur
    	JMP     loop					; jump à loop

success:
    	MOV     RAX, RDI				; migration de valeur RDI dans RAX
    	ADD     RAX, RCX				; changement de position grace au cpt
    	JMP     end						; jump à end

failure:
    	XOR     RAX, RAX				; remise à zéro
    	JMP     end						; jump à end

end:
        MOV     RBP, RSP                ; opérations de base
        POP     RBP                     ; opérations de base
    	RET                             ; opérations de base