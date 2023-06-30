# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    limits_cases.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ggiannit <ggiannit@student.42firenze.it    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/14 15:11:25 by ggiannit          #+#    #+#              #
#    Updated: 2023/06/30 23:23:59 by ggiannit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash

if [ -f "results/limits_case_500_1" ];then
	rm results/limits_case_500_1
fi

if [ -f "results/limits_case_500_2" ];then
	rm results/limits_case_500_2
fi

if [ -f "results/limits_case_500_3" ];then
	rm results/limits_case_500_3
fi

echo -e "\e[32m===========================================\e[0m"
echo -e "\e[97mLet's test some limit cases:\e[0m"
echo ""

for run in {1..10}; do
	ARG_500=$(python3 pushswap_randomizer.py 499 -500 0)
	./push_swap $ARG_500 -2147483648 | ./ps_moulinette $ARG_500 -2147483648 > results/limits_case_500_1
	RES=$(cat results/limits_case_500_1 | tail -n1)
	if [ "$RES" == "Error" ];then
			echo "$ARG_500 -2147483648" >> errors
	fi
done

AVG_500=$(cat results/limits_case_500_1 | awk '{ sum += $1; n++ } END {print int(sum / n)}')
ERR_500=$(cat results/limits_case_500_1 |grep -i Error| wc -l)

if [ "$ERR_500" == "0" ];then
	echo -e "\e[97mWith -2147483648 avg results $AVG_500 without error\e[0m"
else
	echo -e "\e[31mWith -2147483648 and 2147483647 return at least one error!!\e[0m"
fi
echo ""
#-------------------------------------------------------------------------------

for run in {1..10}; do
	ARG_500=$(python3 pushswap_randomizer.py 499 -250 250)
	./push_swap $ARG_500 2147483647 | ./ps_moulinette $ARG_500 2147483647 > results/limits_case_500_2
	RES=$(cat results/limits_case_500_2 | tail -n1)
	if [ "$RES" == "Error" ];then
			echo "$ARG_500 2147483647" >> errors
	fi
done

AVG_500=$(cat results/limits_case_500_2 | awk '{ sum += $1; n++ } END {print int(sum / n)}')
ERR_500=$(cat results/limits_case_500_2 |grep -i Error| wc -l)

if [ "$ERR_500" == "0" ];then
	echo -e "\e[97mWith 2147483647 avg results $AVG_500 without error\e[0m"
else
	echo -e "\e[31mWith -2147483648 and 2147483647 return at least one error!!\e[0m"
fi
echo ""
#-------------------------------------------------------------------------------

for run in {1..10}; do
	ARG_500=$(python3 pushswap_randomizer.py 498 0 500)
	./push_swap $ARG_500 -2147483648 2147483647 | ./ps_moulinette $ARG_500 -2147483648 2147483647 >> results/limits_case_500_3
	RES=$(cat results/limits_case_500_3 | tail -n1)
	if [ "$RES" == "Error" ];then
			echo "$ARG_500 -2147483648 2147483647" >> errors
	fi
done

AVG_500=$(cat results/limits_case_500_3 | awk '{ sum += $1; n++ } END {print int(sum / n)}')
ERR_500=$(cat results/limits_case_500_3 |grep -i Error| wc -l)

if [ "$ERR_500" == "0" ];then
	echo -e "\e[97mWith -2147483648 and 2147483647 avg results $AVG_500 without error\e[0m"
else
	echo -e "\e[31mWith -2147483648 and 2147483647 return at least one error!!\e[0m"
fi
echo ""
echo -e "\e[32m===========================================\e[0m"

