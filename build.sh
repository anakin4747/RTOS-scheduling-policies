#!/bin/bash
# 
# Todd if you are reading this, your build system wont work without this file being 
# being in C:\VSARM\sdk\pico\projects\
#
# This script is supposed to be run on git bash on windows
# 
# This script finds the pico plugged into a windows machine via USB
# and flashes the target.uf2 program to the pico 

if [ ! -d $(pwd)/build ] 
then
    mkdir $(pwd)/build
    printf "\nRunning CMake\n\n"
    cmake -G "MinGW Makefiles" -S . -B $(pwd)/build || \
        ( printf "\nIf you get the error \" ... does not appear to contain CMakeLists.txt\"" \;
        printf " then you are in the wrong folder\n\nMove to your project folder" >&2 && exit 5 )
fi

cd $(pwd)/build

printf "\nRunning Make\n\n"
mingw32-make || ( printf "\nMake sure you are in the folder of your project and not in src, include, or build\n" >&2 && exit 4 )

drives=("/d" "/e" "/f" "/g")
# List of possible pico locations

for device in $drives
do
    if [ -e  ${device}/INFO_UF2.txt ] # Find which drive is the pico
    then
        printf "\nFlashing target.uf2 on drive ${device}\n"
        cp src/target.uf2 ${device} || ( printf "\nMake sure you are in the folder of your project and not in src, include, or build\n" >&2 && exit 3 )
        exit 0
    fi
done

printf "\nNo device found\n\nEnsure that you hold the BOOTSEL button on the pico as you plug it in\n" >&2
exit 2 
# Error and exit if no pico was found