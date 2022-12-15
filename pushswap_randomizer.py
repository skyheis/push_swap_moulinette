#! /usr/bin/python3
#################################################
# made with <3 by ggiannit@student.42firenze.it #
#################################################

import random
import sys

if len(sys.argv) != 4:
    print("Please give 3 arguments: number of elements, min value and max value")
    print("for example...")
    print("    foo@popi:~$ pushswap_randomizer 5 0 10")
    print("    2 6 4 9 1")
    exit()
else:
    n = int(sys.argv[1])
    min_val = int(sys.argv[2])
    max_val = int(sys.argv[3])

random_list = random.sample(range(min_val, max_val), n)

r_str = ""

for i in random_list:
    r_str += str(i) + " "

print(r_str)
