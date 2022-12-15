# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mouligiannit.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ggiannit <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/15 14:34:03 by ggiannit          #+#    #+#              #
#    Updated: 2022/12/15 15:24:34 by ggiannit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#This is a tester made with love by ggiannit from 42 Florance

#I stole a visualizer from someone and a second tester from someone else :D
#But I made other ship with my sweet heands <3

if [ ! -f "push_swap" ]; then
	echo -e "\e[31mBro... cp the push_swap in this dir please!\e[0m"
	exit
fi

if [ ! -f "push_swap_moulinette" ]; then
	make
fi

echo ""
echo -e "\e[97mLet's do thiiis\e[0m"
echo ""

bash normal_cases.sh
bash limits_cases.sh

echo ""
echo -e "\e[32m* **************************************************** *\e[0m"
echo -e "\e[32m*\e[33m Because you never know I will run \e[31mlaisarena\e[33m's tester \e[32m*\e[0m"
echo -e "\e[32m* **************************************************** *\e[0m"
echo ""
sleep 2.5

bash notmy_tester.sh

while true; do
	read -p "Do you wish to open the visualizer? [y/N] " yn
	case $yn in
		[Yy] )
			echo -e "\e[94mfor 100 with negative\e[0m"
			python3 pushswap_randomizer.py 100 -250 250
			echo -e "\e[94mfor 500 with negative\e[0m"
			python3 pushswap_randomizer.py 500 -250 250
			./visualizer
			break;;
		[Nn] | "" ) exit;;
		* ) echo "Please answer y or n.";;
	esac
done

