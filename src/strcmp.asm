BITS    64

SECTION .text

GLOBAL  strcmp

strcmp:
        PUSH    RBP                 ; opérations de base
        MOV     RBP, RSP            ; opérations de base

        XOR     RCX, RCX            ; mise a zéro du compteur

loop:
        MOV     AL, [RDI + RCX]     ; migration de la valeur
        MOV     R8B, [RSI + RCX]    ; migration de la valeur
        CMP     AL, R8B             ; comparaison des deux valeurs
        JNE     end                 ; si non égale jump à la fin

        CMP     AL, 0x0             ; comparaison avec \0
        JZ      end                 ; jump a la fin si égale

        CMP     R8B, 0x0            ; comparaison avec \0
        JZ      end                 ; jump a la fin si égale

        INC     RCX                 ; incrémentation du compteur
        JMP     loop                ; jump au début de la loop

end:
        SUB     AL, R8B             ; soustraction entre les deux registres
        MOVSX   RAX, AL             ; migration de valeur de deux paliers diff

        MOV     RBP, RSP            ; opérations de base
        POP     RBP                 ; opérations de base
        RET                         ; opérations de base