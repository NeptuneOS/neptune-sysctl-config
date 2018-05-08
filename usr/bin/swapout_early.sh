#!/bin/bash
# 
# Set vm.swappiness to a high value to swap out pages earlier
# 
# This is especially useful in combination with zram if you 
# need more RAM then you system can provide

# Check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Include swapout functions
source /usr/bin/swapout

VALUE=80

echo "Set vm.swappiness to a high value to swap out pages earlier"
echo "" 
echo "This is especially useful in combination with zram if you" 
echo "need more RAM then you system can provide."
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