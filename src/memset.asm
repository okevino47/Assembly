BITS    64

SECTION .text

GLOBAL  memset

memset:
        PUSH    RBP                     ; opérations de bases
        MOV     RBP, RSP                ; opérations de bases

        XOR     RCX, RCX                ; mise a zéro du compteur

loop:
        CMP     RDX, RCX                ; comparaison entre le cpt et la dest
        JZ      end                     ; si égale jump a la fin

        MOV     byte[RDI + RCX], SIL    ; migration de 2e arg dans le pointeur
        INC     RCX                     ; incrématntion du compteur
        JMP     loop                    ; recommence la boucle

end:
        MOV     RAX, RDI                ; migre la valeur du str dans la rax
        MOV     RBP, RSP                ; opérations de bases
        POP     RBP                     ; opérations de bases
        RET                             ; opérations de bases