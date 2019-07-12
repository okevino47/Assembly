BITS    64

SECTION .text

GLOBAL  strcspn

strcspn:
        PUSH    RBP                 ; opérations de base
        MOV     RBP, RSP            ; opérations de base

        XOR     RCX, RCX            ; mise a zéro du compteur
	    MOV     R11, RDI            ; migration de la valeur
    	JMP     first_loop          ; jump au début de la premiere loop

second_loop:
	    CMP     BYTE [R9], 0x0      ; comparaison avec \0
	    JE      next                ; jump a la fin si égale
	    MOV     AL, [R11]           ; migration de la valeur
    	CMP     [R9], AL            ; compare les deux valeurs
    	JE      end                 ; jump a la fin si égale
    	INC     R9                  ; incrémentation du compteur
    	JMP     second_loop         ; jump au début de la seconde loop

first_loop:
    	CMP     BYTE [R11], 0x0     ; comparaison avec \0
    	JE      end                 ; jump a la fin si égale
       	MOV     R9, RSI             ; migration de la valeur
    	JMP     second_loop         ; jump au début de la seconde loop

next:
    	INC     R11                 ; incrémentation du compteur
    	INC     RCX                 ; incrémentation du compteur
    	JMP     first_loop          ; jump au début de la first_loop

end:
    	MOV     RAX, RCX            ; migration de la valeur

        MOV     RBP, RSP            ; opérations de base
        POP     RBP                 ; opérations de base
	    RET                         ; opérations de base