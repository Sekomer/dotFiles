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
    echo "UPDATE N UPGRADE...\n"
    # update / upgrade
    
    sudo apt update >> /dev/null 
    sudo apt upgrade >> /dev/null	

    sleep 1    

    echo "AUTOREMOVE"
    # remove unnecessary packages and dependencies
    sleep .5
    sudo apt autoremove 
    sleep .5

    # clean thumbnail cache
    echo "CLEANING CACHE"
    sleep .5
    sudo rm -rf ~/.cache/thumbnails/*
    sleep .5
    # clean apt cache
    echo "CLEANING APT CACHE"
    sleep .5
    sudo apt autoclean
    sleep .5
    sudo apt clean
    sleep .5

    # clean unused dependencies
    echo "CLEANING DEPENDENCIES"
    sleep .5
    sudo apt autoremove

else 
    printf "Unknown Command !"
    
fi
