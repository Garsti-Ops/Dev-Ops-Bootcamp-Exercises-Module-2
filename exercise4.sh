#!/bin/bash

read -p "Enter user: " user
read -p "Sort by cpu or memory? Enter cpu or memory for sorting. " sorting

if [ sorting="cpu" ]
then
	ps aux --sort -pcpu | grep $user
elif [ sorting="memory" ]
then
	ps aux --sort -pmem | grep $user
else
	ps aux | grep $user
fi


