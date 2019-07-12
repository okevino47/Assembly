BITS    64

SECTION .text

GLOBAL  strnlen

strnlen:
        PUSH    RBP                     ; opérations de bases
        MOV     RBP, RSP                ; opérations de bases

        XOR     RDX, RDX                ; mise a zéro du compteur

loop:
        CMP     BYTE [RDI + RDX], 0x0   ; compare avec \0
        JE      end                     ; jump si égale

        CMP     RDX, RSI                ; compare avec l'argument d'arrêt
        JE      end                     ; jump si égale

        INC     RDX                     ; incrémente le compteur
        JMP     loop                    ; recommence la boucle

end:
        mov RAX, RDX                    ; migre la val du compteur dans RAX

        LEAVE                           ; opérations de bases
        RET                             ; opérations de bases