#!/bin/bash

read -p "Enter user: " user
read -p "Sort by cpu or memory? Enter pcpu or pmem for sorting. " sorting
read -p "Enter numer of lines to pring. " lines_to_print

printProcesses() {
        ps aux --sort $1 | grep $3 | head --lines $2
}


if [ -n $user ] && [ -n $sorting ] && [ -n $lines_to_print ]
then
	printProcesses $sorting $lines_to_print $user
else
	ps aux | grep $user
fi

