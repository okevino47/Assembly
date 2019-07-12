##
## EPITECH PROJECT, 2018
## make
## File description:
## makefile
##

LD	=	ld

LDFLAGS	=	-shared

ASM	=	nasm

ASFLAGS	=	-f elf64

RM	=	rm -rf

NAME	=	libasm.so

SRC	=	src/rindex.asm		\
		src/strlen.asm		\
		src/strnlen.asm		\
		src/strcmp.asm		\
		src/memset.asm		\
		src/strchr.asm		\
		src/memcpy.asm		\
		src/memmove.asm		\
		src/strcspn.asm 	\
		src/strpbrk.asm 	\
		src/strstr.asm 		\
		src/strncmp.asm		\
		src/strcasecmp.asm

OBJ	=	$(SRC:.asm=.o)

all:		$(NAME)

%.o:		%.asm
		$(ASM) $(ASFLAGS) $< -o $@

$(NAME):	$(OBJ)
		$(LD) $(LDFLAGS) $(OBJ) -o $(NAME)

clean:
		$(RM) $(OBJ)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

go:		re
		$(RM) $(OBJ)

.PHONY:		all clean fclean re go
