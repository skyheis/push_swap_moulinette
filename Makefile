# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ggiannit <ggiannit@student.42firenze.it    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/07 17:49:20 by ggiannit          #+#    #+#              #
#    Updated: 2023/06/30 23:30:02 by ggiannit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# change the path of push_swap here #
PSPATH = ../

#### PS_MOULINETTE ###
NAME = ps_moulinette

###### VARIABLE ######
DIRSRCS = src/
DIROBJS = obj/
INCLUDE = include
FLSRCS = 	main.c ft_exec_your_rules.c ft_istack_moul.c ft_stackmove_moul.c \
			get_next_line.c get_next_line_utils.c lib_utils.c

FLOBJS = ${FLSRCS:.c=.o}
OBJS = $(addprefix $(DIROBJS),$(FLOBJS))

CC = cc
AR = ar
RM = rm -f
CFLAGS = -Wall -Wextra -Werror

####### RULES ########

all: ${NAME}

${NAME}: ${OBJS}
	@echo "$(YELLOW)Compiler and flags: $(WHITE)${CC} ${CFLAGS}$(DEF_COLOR)"
	@${CC} ${CFLAGS} -I ${INCLUDE} -o $(NAME) $(OBJS)
	@echo "$(YELLOW)Checker program created with $(WHITE)${CC}$(YELLOW) as $(CYAN)${NAME}$(DEF_COLOR)"
	@echo ""

clean:
	@${RM} ${OBJS} 
	@echo "$(RED)All objects removed with $(WHITE)${RM}$(DEF_COLOR)"

fclean: clean
	@${RM} ${NAME} 
	@echo "$(RED)..and $(CYAN)${ARNAME} $(RED)as been removed$(DEF_COLOR)"

re: fclean all

PS = push_swap

.SILENT: test presenting

presenting:
	@echo "$(RED)CIAOOO\n$(YELLOW)Check if push_swap exists$(DEF_COLOR)"

test: all presenting
    # Check if the file exists using the wildcard function
    ifeq ($(wildcard $(PS)),)
		@cp ${PSPATH}push_swap .
		@echo "$(CYAN)\npush_swap is not present. Copied from $(WHITE)${PSPATH}$(DEF_COLOR)\n"; 
    else
		@echo "$(WHITE)\npush_swap is present.$(DEF_COLOR)\n"
    endif
	@test_script/mouligiannit.sh

######## EXT #########

$(DIROBJS)%.o: $(DIRSRCS)%.c
	@${CC} ${CFLAGS} -I ${INCLUDE} -c $< -o $@

.PHONY: all clean fclean re presenting test .c.o
.SUFFIXES: .c .o 

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
