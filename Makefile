# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: joonpark <joonpark@student.42.kr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/18 13:37:15 by joonpark          #+#    #+#              #
#    Updated: 2021/10/20 14:18:41 by joonpark         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC			:= 	gcc

INC			:= 	-I./includes

CFLAGS		:= 	-g -Wall -Wextra -Werror

SRCS_DIR	:= 	./src/
SOURCES		:= 	main.c \
				clear.c \
				utils/pp_split.c
SRCS		:= 	$(addprefix $(SRCS_DIR), $(SOURCES))


OBJS_DIR	:=	./obj/
OBJECTS		:=	$(SOURCES:.c=.o)
OBJS		:=	$(addprefix $(OBJS_DIR), $(OBJECTS))

NAME		:=	minishell

# colors
RED			:=	\033[31m
GREEN 		:=	\033[32m
YELLOW 		:=	\033[33m
BLUE 		:=	\033[34m
MAGENTA		:=	\033[35m
CYAN		:=	\033[36m
WHITE		:=	\033[37m
PINK		:=	\033[38;5;201m
OBJS_DOT	:=	\033[38;5;201m\033[48;5;252m\033[1m\033[3m
MENT		:=	\033[38;5;191m\033[1m
RE_MENT		:=	\033[38;5;63m\033[1m
RESET		:=	\033[0m

.PHONY		:=	all ment_re $(NAME) bonus clean fclean re

$(NAME) : $(OBJS_DIR) $(OBJS) 
	@$(CC) -o $@ $(OBJS) -lreadline
	@echo "\n$(GREEN)object files were created$(RESET)"

$(OBJS_DIR) :
	@mkdir -p $(OBJS_DIR)
	@mkdir -p $(OBJS_DIR)/utils
	@echo "$(BLUE)[ Created obj directory ... ]$(NC)"

$(OBJS_DIR)%.o : $(SRCS_DIR)%.c
	@$(CC) -c $(CFLAGS) -o $@ $< $(INC)
	@echo "$(OBJS_DOT).$(RESET)\c"

$(OBJS_DIR)/utils/%.o : $(SRCS_DIR)/utils/%.c
	@$(CC) -c $(CFLAGS) -o $@ $< $(INC)
	@echo "$(OBJS_DOT).$(RESET)\c"

all : $(NAME)

ment_re :
	@echo "$(RE_MENT)[make re]$(RESET)"

bonus : $(OBJS) $(BNS_OBJ)
	@$(CC) -o $(NAME) $(OBJS)
	@echo "\n$(GREEN)bonus object files were created$(RESET)"
	@echo "$(GREEN)$(NAME) was created$(RESET)"

clean :
	@rm -rf $(OBJS_DIR) 
	@echo "$(MENT)[Removing object files]"
	@echo "$(MAGENTA)$(OBJS)$(RESET)"

fclean : clean
	@rm -f $(NAME)
	@echo "$(MENT)[Removing $(NAME)]$(RESET)"
	@echo "$(NAME):$(MAGENTA) deleted$(RESET)"

re : ment_re fclean all
	@echo "$(RE_MENT)[make re done.]$(RESET)"

norm_test :
	@echo "$(MENT)[Norminette test]$(CYAN)"
	@find ./src -name "*.c" -exec norminette {} \;
	@find ./includes -name "*.h" -exec norminette {} \;

help :
	@echo $(SRCS)
	@echo $(OBJS)
