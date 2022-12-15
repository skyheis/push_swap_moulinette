# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ggiannit <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/07 17:49:20 by ggiannit          #+#    #+#              #
#    Updated: 2022/12/15 11:06:36 by ggiannit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

####### NAME #########

NAME = push_swap_moulinette
PRNAME = push_swap_moulinette

INCLUDE = include

###### VARIABLE ######

DIRSRCS = src/
DIROBJS = obj/

FLSRCS = main.c ft_exec_your_rules.c ft_istack_moul.c ft_stackmove_moul.c

FLOBJS = ${FLSRCS:.c=.o}

OBJS = $(addprefix $(DIROBJS),$(FLOBJS))

ARUSD = libft.a
ARUSDDIR = archive/

ARINC = $(addprefix $(ARUSDDIR),$(ARUSD))

CC = cc
AR = ar
RM = rm -f
CFLAGS = -Wall -Wextra -Werror -g

###### COLORS ########

DEF_COLOR = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

######## EXT #########

# make a .o file using a .c file
# $< for the .c file
# $@ for the .o file

# .inextention.outextention:

#.c.o:
$(DIROBJS)%.o: $(DIRSRCS)%.c
	@echo "$(YELLOW)Compiling:$(BLUE) $< $(DEF_COLOR)"
	@${CC} ${CFLAGS} -I ${INCLUDE} -c $< -o $@

####### RULES ########

all: ${NAME}

${NAME}: starting ${OBJS}
	@echo ""
	@echo "$(GREEN)*******************************************$(DEF_COLOR)"
	@echo "$(YELLOW)- Compiler: $(WHITE)${CC}$(DEF_COLOR)"
	@echo "$(YELLOW)- Flags: $(WHITE)${CFLAGS}$(DEF_COLOR)"
	@echo "$(GREEN)*******************************************$(DEF_COLOR)"
	@echo ""
	@${CC} ${CFLAGS} -I ${INCLUDE} -o $(PRNAME) $(OBJS) $(ARINC)
	@echo "$(YELLOW)Program created with $(WHITE)${CC}$(YELLOW) as $(CYAN)${PRNAME}$(DEF_COLOR)"
	@echo ""

clean:
	@echo "$(WHITE)\"wait.. is $(CYAN)${PRNAME}$(WHITE) all trash? 🧹\" $(DEF_COLOR)"
	@${RM} ${OBJS} 
	@echo "$(RED)All objects removed with $(WHITE)${RM}$(DEF_COLOR)"
	@echo ""

fclean: clean
	@echo "$(WHITE)\"...it's always as been 🚮\" $(DEF_COLOR)"
	@${RM} ${PRNAME} 
	@echo "$(RED)..and $(CYAN)${ARNAME} $(RED)as been removed$(DEF_COLOR)"
	@echo ""

re: fclean all

exec:
	@echo "$(WHITE)💥I'll exec your $(RED)amazing $(WHITE)program!💨$(DEF_COLOR)"
	@./${PRNAME}

starting:
	@echo "$(WHITE)🧙as a wizard, I made appear your $(CYAN) $(PRNAME) $(WHITE)binary!🪄 💫$(DEF_COLOR)"

.PHONY: all clean fclean re starting .c.o exec
.SUFFIXES: .c .o 
