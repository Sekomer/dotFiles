#!/bin/bash

args=("$@")

# Red
RED='\033[0;31m'
# No Color 
NC='\033[0m' 
# Yellow
YL='\033[0;33m'


for ((i = 0; i < $#; i++))
{
    echo -e "${YL}Downloading ${args[$i]} for Python2${NC}"
    for ((j = 0; j < 3; j++))
    {
    	printf "\033[0;31m. \033[0m"
    	sleep .5
    }
    
    printf "\n\n"
 	
 	pip2 install ${args[$i]}
    sleep 1
    echo -e "${YL}\nDownloading ${args[$i]} for Python3${NC}"
 	
 	for ((k = 0; k < 3; k++))
    {
    	printf "\033[0;31m. \033[0m"
    	sleep .5
    }
    
 	printf "\n\n"
 	
 	pip3 install ${args[$i]}
}

