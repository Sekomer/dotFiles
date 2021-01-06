#!/bin/bash

sudo echo "you will never see this motherfucker" >> /dev/null

echo "Which operation you'd like to run meister ?"
printf "[1] Check System Status\n[2] Perform System Maintenance\n"
printf "[*]"

read var

RED='\033[0;31m' # Red
NC='\033[0m' # No Color


if [[ $var == 1 ]]
then
    # INFO 
    printf "${RED}SYSTEM STATS${NC} \n\n"
    

    # thumbnail size
    printf "${RED}THUMBNAIL SIZE${NC} \n"
    du -sh ~/.cache/thumbnails
    printf "\n\n"	

    # old kernels
    printf "${RED}KERNELS${NC} \n"
    sudo dpkg --list 'linux-image*'
    printf "\n"

    # apt cache size
    printf "${RED}APT CACHE SIZE${NC} \n"
    sudo du -sh /var/cache/apt
	printf "\n"

elif [[ $var == 2 ]]
then
    echo -e "UPDATE N UPGRADE...\n"
    # update / upgrade
   
	echo -e "UPDATING...\n" 
    sudo apt update  
	echo -e "\n"
	
	echo -e "UPGRADING...\n"
    sudo apt upgrade 	
	echo -e "\n"

    sleep 1    

    echo -e "AUTOREMOVE...\n"
    # remove unnecessary packages and dependencies
    sleep .5
    sudo apt autoremove 
	echo -e "\n"
    sleep .5

    # clean thumbnail cache
    echo -e "CLEANING CACHE...\n"
    sleep .5
    sudo rm -rf ~/.cache/thumbnails/*
	echo -e "\n"
    sleep .5
    # clean apt cache
    echo -e "CLEANING APT CACHE...\n"
    sleep .5
    sudo apt autoclean
	echo -e "\n"
    sleep .5
    sudo apt clean
	echo -e "\n"
    sleep .5

    # clean unused dependencies
    echo -e "CLEANING DEPENDENCIES...\n"
    sleep .5
    sudo apt autoremove
	echo -e "\n"

else 
    printf "Unknown Command !"
    
fi
