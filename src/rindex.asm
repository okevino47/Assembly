BITS    64

SECTION .text

GLOBAL  rindex

rindex:
        PUSH    RBP                     ; opérations de base
        MOV     RBP, RSP                ; opérations de base

        XOR     RCX, RCX                ; mise a zéro du compteur

loop_end_str:
        CMP     BYTE [RDI + RCX], 0x0   ; compare avec \0
        JE      loop_occur              ; si égale jump a la 2e boucle
        INC     RCX                     ; incrémentation du compteur
        JMP     loop_end_str            ; jump au début de la loop

loop_occur:
        CMP     BYTE [RDI + RCX], SIL   ; compare la valeur avec l'argument
        JE      found                   ; jump si égale à l'occurence

        CMP     RCX, 0x0                ; compare avec \0
        JE      not_found               ; jump si égale

        DEC     RCX                     ; compare avec \0
        JMP     loop_occur              ; jump si égale

not_found:
        XOR     RAX, RAX                ; mise a null de la valeur de retour
        JMP     end                     ; jump a la fin

found:
        MOV     RAX, RDI                ; migration de la string dans RAX
        ADD     RAX, RCX                ; déplacement du pointeur sur la str

end:
        LEAVE                           ; opérations de base
        RET                             ; opérations de base