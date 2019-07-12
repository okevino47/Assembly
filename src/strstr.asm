BITS    64

SECTION .text

GLOBAL  strstr

strstr:
        PUSH    RBP                 ; opérations de base
        MOV     RBP, RSP            ; opérations de base

    	XOR     RCX, RCX		    ; opérations de base
    	JMP     loop			    ; jump loop

start:
    	CMP     R8B, 0x0            ; comparaison avec \0
    	JE      failure             ; jump à failure
    	INC     RDI                 ; incrémentation de valeurs

loop:
    	MOV     R8B, [RDI + RCX]	; migration de valeurs
    	MOV     R9B, [RSI + RCX]	; migration de valeurs
    	CMP     R9B, 0x0			; comparaison avec \0
    	JZ      success				; jump à success si c'est égale
    	CMP     R8B, R9B			; comparaison entre R8B et R9B
    	JNE     start				; jump si non égale à start
    	INC     RCX					; incrémentation de compteur
    	JMP     loop				; jump à loop

success:
    	MOV     RAX, RDI			; migration de valeurs
    	JMP     end					; jump end

failure:
    	XOR     RAX, RAX			; remise à zéro
    	JMP     end					; jump end
end:
        MOV     RBP, RSP            ; opérations de base
        POP     RBP                 ; opérations de base
    	RET