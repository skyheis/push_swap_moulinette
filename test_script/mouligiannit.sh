# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mouligiannit.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ggiannit <ggiannit@student.42firenze.it    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 14:34:03 by ggiannit          #+#    #+#              #
#    Updated: 2023/06/30 23:31:12 by ggiannit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#This is a tester made with love by ggiannit from 42 Florance

#I stole a visualizer from someone and a second tester from someone else :D
#But I made other ship with my sweet heands <3

#I didn't do test with valgrind, was to bored to do it, but if you want to do it
#you can do it with this command:
#	valgrind --leak-check=full --show-leak-kinds=all ./push_swap $(python3 pushswap_randomizer.py 20 -250 250)

if [ ! -f "push_swap" ]; then
	echo "\e[31mBro... cp the push_swap in this dir please!\e[0m"
	exit
fi

if [ ! -f "ps_moulinette" ]; then
	make
fi

echo ""
echo "\e[97mLet's do thiiis\e[0m"
echo ""

bash test_script/normal_cases.sh
bash test_script/limits_cases.sh

echo ""
echo "\e[32m* **************************************************** *\e[0m"
echo "\e[32m*\e[33m Because you never know I will run \e[31mlaisarena\e[33m's tester \e[32m*\e[0m"
echo "\e[32m* **************************************************** *\e[0m"
echo ""
sleep 2.5

bash test_script/notmy_tester.sh

echo ""
while true; do
	read -p "Don't forget valgrind! Do you want to try it? [y/N] " yn
	case $yn in
		[Yy] )
			valgrind --leak-check=full --show-leak-kinds=all ./push_swap $(python3 pushswap_randomizer.py 20 -250 250)
			echo "\nALSO CHECK THE LEAKS WITH ERROR CASES!!\n"
			break;;
		[Nn] | "" ) exit;;
		* ) echo "Please answer y or n.";;
	esac
done

