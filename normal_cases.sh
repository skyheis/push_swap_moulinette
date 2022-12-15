# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    normal_cases.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ggiannit <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/14 13:35:51 by ggiannit          #+#    #+#              #
#    Updated: 2022/12/15 15:17:18 by ggiannit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash

if [ -f "results/with_3" ];then
	rm results/with_3
fi

./push_swap 1 2 3 > lol
./push_swap_moulinette 1 2 3 >> results/with_3
./push_swap 1 3 2 > lol
./push_swap_moulinette 1 3 2 >> results/with_3
./push_swap 2 1 3 > lol
./push_swap_moulinette 2 1 3 >> results/with_3
./push_swap 2 3 1 > lol
./push_swap_moulinette 2 3 1 >> results/with_3
./push_swap 3 1 2 > lol
./push_swap_moulinette 3 1 2 >> results/with_3
./push_swap 3 2 1 > lol
./push_swap_moulinette 3 2 1 >> results/with_3

MAX_3=$(sort -n -r results/with_3 | head -n1)
ERR_3=$(cat results/with_3 | grep -i Error| wc -l)

if [ "$ERR_3" == "0" ];then
	echo -e "\e[32m===========================================\e[0m"
	echo -e "\e[97mmax number of move with 3 numbers is $MAX_3\e[0m"
	echo -e "\e[32m===========================================\e[0m"
else
	echo -e "\e[31m===========================================\e[0m"
	echo -e "\e[31m BROOOOOO you cant mess up with THREE!\e[0m"
	echo -e "\e[31m How it happen??\e[0m"
	echo -e "\e[31m===========================================\e[0m"
fi
echo ""

################################################################################

if [ -f "results/with_5" ];then
	rm results/with_5
fi

for run in {1..84}; do
	ARG_5=$(python3 pushswap_randomizer.py 5 0 10)
	./push_swap $ARG_5 > lol
	./push_swap_moulinette $ARG_5 >> results/with_5
	LAST_CALC=$(cat results/with_5 | tail -n1)
	if [ "$LAST_CALC" == "Error" ];then
		echo "$ARG_5" >> errors
	fi
done

rm lol

AVG_5=$(cat results/with_5 | awk '{ sum += $1; n++ } END {print int(sum / n)}')
MAX_5=$(sort -n -r results/with_5 | head -n1)
MIN_5=$(sort -n -r results/with_5 | tail -n1)
ERR_5=$(cat results/with_5 | grep -i Error| wc -l)

echo -e "\e[32m===========================================\e[0m"
echo -e "\e[33mfor \e[36m5 \e[33mnumbers\e[0m"
echo -e "\e[33mmax:\e[97m $MAX_5\e[0m"
echo -e "\e[33mmin:\e[97m $MIN_5\e[0m"
echo -e "\e[33mavg:\e[97m $AVG_5\e[0m"
echo ""

if [ "$ERR_5" == "0" ];then
	echo -e "\e[33mNo error occurred\e[0m"
else
	echo -e "\e[97mNumber of Error/KO:\e[31m $ERR_5\e[0m"
	echo -e "\e[31mPlease check file 'errors'\e[0m"
fi

echo -e "\e[32m===========================================\e[0m"
echo ""

################################################################################

if [ -f "results/with_100" ];then
	rm results/with_100
fi

for run in {1..33}; do
	ARG_100=$(python3 pushswap_randomizer.py 100 0 5000)
	./push_swap $ARG_100 > lol
	./push_swap_moulinette $ARG_100 >> results/with_100
	ARG_100=$(python3 pushswap_randomizer.py 100 -5000 0)
	./push_swap $ARG_100 > lol
	./push_swap_moulinette $ARG_100 >> results/with_100
	ARG_100=$(python3 pushswap_randomizer.py 100 -5000 5000)
	./push_swap $ARG_100 > lol
	./push_swap_moulinette $ARG_100 >> results/with_100
	LAST_CALC=$(cat results/with_100 | tail -n1)
	if [ "$LAST_CALC" == "Error" ];then
		echo "$ARG_100" >> errors
	fi
done

rm lol

AVG_100=$(cat results/with_100 | awk '{ sum += $1; n++ } END {print int(sum / n)}')
MAX_100=$(sort -n -r results/with_100 | head -n1)
MIN_100=$(sort -n -r results/with_100 | tail -n1)
ERR_100=$(cat results/with_100 |grep -i Error| wc -l)

echo -e "\e[32m===========================================\e[0m"
echo -e "\e[33mfor \e[36m100 \e[33mnumbers\e[0m"
echo -e "\e[33mmax:\e[97m $MAX_100\e[0m"
echo -e "\e[33mmin:\e[97m $MIN_100\e[0m"
echo -e "\e[33mavg:\e[97m $AVG_100\e[0m"
echo ""

if [ "$ERR_100" == "0" ];then
	echo -e "\e[33mNo error occurred\e[0m"
else
	echo -e "\e[97mNumber of Error/KO:\e[31m $ERR_100\e[0m"
	echo -e "\e[31mPlease check file 'errors'\e[0m"
fi

echo -e "\e[32m===========================================\e[0m"
echo ""

################################################################################

if [ -f "results/with_500" ];then
	rm results/with_500
fi

for run in {1..33}; do
	ARG_500=$(python3 pushswap_randomizer.py 500 0 5000)
	./push_swap $ARG_500 > lol
	./push_swap_moulinette $ARG_500 >> results/with_500
	ARG_500=$(python3 pushswap_randomizer.py 500 -5000 0)
	LAST_CALC=$(cat results/with_500 | tail -n1)
	if [ "$LAST_CALC" == "Error" ];then
		echo "$ARG_5005" >> errors
	fi
	./push_swap $ARG_500 > lol
	./push_swap_moulinette $ARG_500 >> results/with_500
	LAST_CALC=$(cat results/with_500 | tail -n1)
	if [ "$LAST_CALC" == "Error" ];then
		echo "$ARG_5005" >> errors
	fi
	ARG_500=$(python3 pushswap_randomizer.py 500 -5000 5000)
	./push_swap $ARG_500 > lol
	./push_swap_moulinette $ARG_500 >> results/with_500
	LAST_CALC=$(cat results/with_500 | tail -n1)
	if [ "$LAST_CALC" == "Error" ];then
		echo "$ARG_5005" >> errors
	fi
done

rm lol

AVG_500=$(cat results/with_500 | awk '{ sum += $1; n++ } END {print int(sum / n)}')
MAX_500=$(sort -n -r results/with_500 | head -n1)
MIN_500=$(sort -n -r results/with_500 | tail -n1)
ERR_500=$(cat results/with_500 |grep -i Error| wc -l)

echo -e "\e[32m===========================================\e[0m"
echo -e "\e[33mfor \e[36m500 \e[33mnumbers\e[0m"
echo -e "\e[33mmax:\e[97m $MAX_500\e[0m"
echo -e "\e[33mmin:\e[97m $MIN_500\e[0m"
echo -e "\e[33mavg:\e[97m $AVG_500\e[0m"
echo ""

if [ "$ERR_500" == "0" ];then
	echo -e "\e[33mNo error occurred\e[0m"
else
	echo -e "\e[97mNumber of Error/KO:\e[31m $ERR_500\e[0m"
	echo -e "\e[31mPlease check file 'errors'\e[0m"
fi
echo -e "\e[32m===========================================\e[0m"
echo ""
