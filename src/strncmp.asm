BITS 64

SECTION .text

GLOBAL strncmp

strncmp:
        PUSH    RBP                 ; opérations de base
        MOV     RBP, RSP            ; opérations de base

	    XOR     RCX, RCX
loop:
    	MOV     AL, [RDI + RCX]		; migration de valeur
    	MOV     R9B, [RSI + RCX]	; migration de valeur
    	CMP     AL, R9B				; comparaison entre AL et R8b
    	JNE     end					; si non égale sort
    	CMP     AL, 0x0				; comparaion de AL et \0
    	JE      end					; jump si égale
    	CMP     R9B, 0x0			; comparaison de R8B et \0
    	JE      end					; si c'est egale sort
    	INC     RCX					; incrémentation du compteur
    	CMP     RCX, RDX			; comparaison entre rcx et rdx
	    JE      end					; si c'est egale sort
    	JMP     loop				; jump à loop

end:
    	SUB     AL, R9B				; soustraction de AL et R8B
    	MOVSX   RAX, AL			    ; conversation du registre 8 BITS en 64
    	
    	MOV     RBP, RSP            ; opérations de base
        POP     RBP                 ; opérations de base
    	RET

