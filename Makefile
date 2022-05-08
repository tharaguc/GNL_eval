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
NAME = mandatory
BONUS = bonus

GNL_SRCS = get_next_line.c get_next_line_utils.c
BONUS_SRCS = get_next_line_bonus.c get_next_line_utils_bonus.c
M_SRCS = main.c $(addprefix $(GNL_PATH)/, $(GNL_SRCS))
B_SRCS = bonus.c $(addprefix $(GNL_PATH)/, $(BONUS_SRCS))
M_OBJS = $(M_SRCS:%.c=%.o)
B_OBJS = $(B_SRCS:%.c=%.o)

ifndef BS
	BS=4
endif

ifndef GNL_PATH
	GNL_PATH=../gnl
endif

all: $(NAME)

$(NAME): $(M_OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(M_OBJS)

bonus: $(B_OBJS)
	$(CC) $(CFLAGS) -o $(BONUS) $(B_OBJS)

clean:
	$(RM) $(B_OBJS) $(M_OBJS)

fclean: clean
	$(RM) $(NAME) $(BONUS)

re: fclean all

m: all
	@echo "\n\n====Mandatory====\n"
	@./mandatory
	@echo "\n\n=================\n"
	# leaks -q exe

b: bonus
	@echo "\n\n====Bonus====\n"
	@./bonus
	@echo "\n\n=============\n"
	# leaks -q exe
