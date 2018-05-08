#!/bin/bash
# 
# Set vm.swappiness to a low value to swap out pages later
# 
# This is especially useful if you like a very responsive system 
# which should keep writing to RAM as long as possible before swapping out

# Check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Include swapout functions
source /usr/bin/swapout

VALUE=20

echo "Set vm.swappiness to a low value to swap out pages later"
echo "" 
echo "This is especially useful if you like a very responsive system" 
echo "which should keep writing to RAM as long as possible before swapping out."
echo ""
echo "This will raise the vm.swappiness value to $VALUE"
while true; do
    read -p "Do you wish to continue? (y/n) " yn
    case $yn in
        [Yy]* ) set_swappiness $VALUE; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done