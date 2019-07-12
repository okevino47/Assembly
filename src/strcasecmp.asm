BITS    64

SECTION .text

GLOBAL strcaseCMP

strcaseCMP:
        PUSH    RBP                 ; opérations de base
        MOV     RBP, RSP            ; opérations de base

        XOR     RCX, RCX			; opérations de base
	    JMP     departure_first	    ; jump à departure_first

to_lower_first:
    	ADD     AL, 32				; transforme le contenue d'AL en minuscule
    	JMP     departure_second    ; jump à departure_second

to_lower_second:
    	ADD     R9B, 32				; transforme le contenue d'R9B en minuscule
    	JMP     strcase_comparison	; jump to strcase_comparison

departure_first:
        MOV     AL, [RDI + RCX]		; Migration de valeur
        CMP     AL, 65				; comparaison entre AL et le char 'A'
    	JL      departure_second	; si inférieur jump à departure_second
    	CMP     AL, 90				; comparaison entre AL et le char 'a'
    	JLE     to_lower_first	    ; si inférieur jump à departure_second

departure_second:
        MOV     R9B, [RSI + RCX]	; migration de valeurs
    	CMP     R9B, 65				; comparaison entre R9B et le char 'A'
    	JL      strcase_comparison	; si inférieur jump à str_comparison
    	CMP     R9B, 90				; comparaison entre R9B et le char 'a'
    	JLE     to_lower_second	    ; si inférieur jump à to_lower_second

strcase_comparison:
    	CMP     AL, R9B				; comparaison entre AL et R9B
    	JNE     end					; si non égale sort
    	CMP     AL, 0				; comparaion entre AL et \0
    	JE      end					; si égale sort
    	CMP     R9B, 0				; comparaion entre R9B et \0
    	JE      end					; si égale sort
        INC     RCX					; incrémentation du compteur
    	JMP     departure_first	    ; jump à departure_first

end:
    	SUB     AL, R9B				; soustraction de AL et R9B
    	MOVSX   RAX, AL			    ; conversion de registre entre 8 et 64 BITS
    	RET