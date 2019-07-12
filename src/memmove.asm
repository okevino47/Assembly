BITS    64

SECTION .text

GLOBAL  memmove

memmove:
        PUSH    RBP                 ; opérations de base
        MOV     RBP, RSP            ; opérations de base

    	XOR	RCX, RCX                ; opérations de base
    	XOR	R8, R8                  ; opérations de base

.check_overlap:
    	CMP	RDX, RCX                ; compare RDX et RCX
    	JE	.done_right             ; si égale jump à .done_right
    	MOV	R9, RSI                 ; migration de valeur
    	ADD	R9, RCX                 ; Ajout du compteur à R9
    	CMP	RDI, R9                 ; comparaison entre RDI et R9
    	JE	.backwards              ; jump si égale à .backwards
    	INC	RCX                     ; incrémentation du compteur
    	JMP	.check_overlap          ; jump à .check_overlap

.done_right:
    	CMP	RDX, R8                 ; comparaison entre RDX et R8
    	JE	.end                    ; sort si égale
    	MOV	BYTE [RDI + R8], R10B   ; migration de valeur
    	MOV	R10B, BYTE [RSI + R8]   ; migration de valeur
    	INC	R8                      ; incrémentation du compteur
    	JMP	.done_right             ; jump à .done_right

.backwards:
    	DEC	RDX                     ; décrémentation du compteur
    	MOV	R10B, BYTE [RSI + RDX]  ; migration de valeur
    	MOV	BYTE [RDI + RDX], R10B  ; migration de valeur
    	CMP	RDX, 0x0                ; comparaison de RDX avec \O
	    JE	.end                    ; sort si égale
	    JMP	.backwards              ; jump à .backwards

.end:
    	MOV	RAX, RDI                ; migration de valeur

        MOV     RBP, RSP            ; opérations de base
        POP     RBP                 ; opérations de base
    	RET                         ; opérations de base