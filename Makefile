# ooo        ooooo           oooo                   .o88o.  o8o  oooo            
# `88.       .888'           `888                   888 `"  `"'  `888            
#  888b     d'888   .oooo.    888  oooo   .ooooo.  o888oo  oooo   888   .ooooo.  
#  8 Y88. .P  888  `P  )88b   888 .8P'   d88' `88b  888    `888   888  d88' `88b 
#  8  `888'   888   .oP"888   888888.    888ooo888  888     888   888  888ooo888 
#  8    Y     888  d8(  888   888 `88b.  888    .o  888     888   888  888    .o 
# o8o        o888o `Y888""8o o888o o888o `Y8bod8P' o888o   o888o o888o `Y8bod8P' 

CC = gcc
BUF_DEF = -D BUFFER_SIZE=$(BS)
CFLAGS = -Wall -Wextra -Werror $(BUF_DEF) -g -I $(GNL_PATH)
NAME = exe

GNL_SRCS = get_next_line.c get_next_line_utils.c
SRCS = main.c $(addprefix $(GNL_PATH)/, $(GNL_SRCS))
OBJS = $(SRCS:%.c=%.o)

ifndef BS
	BS=4
endif

ifndef GNL_PATH
	GNL_PATH=../gnl
endif

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

test:
	@make re
	@echo "\n\n========\n"
	@./exe
	@echo "\n\n========\n"
	leaks -q exe