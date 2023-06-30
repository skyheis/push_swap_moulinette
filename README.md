# Push swap tester for linux (42 school project)

## Description
This is a tester for the push_swap project of the 42 school. It will test your push_swap program with a lot of different inputs and give you the average number of operations needed to sort the stack.

## Installation
Clone the repository in the folder of your choice and run the following command:
```
make test
```
This will compile the tester and the push_swap program.

## Randomizer
The randomizer is a python script that will generate a random list of numbers and write it in a file. You can run it with the following command:
```
python3 randomizer.py [number of numbers] [min] [max]
```
## Warning
The tester don't do all the possible tests. It doesn't check all the possible input error, valgrind, leaks, etc. It only check if the output of your program is correct and give you the average number of operations needed to sort the stack.
Also the tester doesn't check if your program works with a single argument.
example:
```
./push_swap "5 4 3 2 1"
```
## Updates
If you want to update the tester, please notify me. I will be happy to add your changes to the tester.
