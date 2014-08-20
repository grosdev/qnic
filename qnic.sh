#!/bin/bash
#
# Developed by Logan Schmidt
# for work at SynerComm
# www.synercomm.com
# 
# Free to modify and use, MIT License
# 
clear
start_test() {
echo ""
echo "  ____         _    "
echo " / __ \  ___  (_)___"
echo "/ /_/ / / _ \/ / __/"
echo "\___\_\/_//_/_/\__/ "
echo ""
echo "  ~ Version 0.2 ~   "
echo "---------------------"
echo "----Test-starting----"
echo "---------------------"
date -u
echo "By:"
echo $USER
echo "---------------------"
echo "---Open ports are----"
echo "---------------------"
nmap -v -sV -T4 $test_url | grep -n "tcp"
echo "---------------------"
echo "---Server--Supports--"
echo "---------------------"
sslscan $test_url | grep -n "Accepted"
echo "---------------------"
echo "---Is it Wordpress?--"
echo "---------------------"
echo "-There is a bug here-"
echo "---pressing ENTER----"
echo "-usually fixes this.-"
echo "---------------------"
wpscan --url $test_url | grep -n "[!]"
echo "---------------------"
echo "---Finding DIRs------"
echo "---------------------"
dirb http://$test_url -f | grep -n "-"
echo "---------------------"
echo "---TEST--COMPLETE----"
echo "---------------------"
echo "-More to come later--"
echo "------d4rkd0s--------"
echo "---------------------"
exit
}
echo "Welcome to d4rkd0s's pentest scanner"
echo "This uses nmap, sslscan, wpscan, dirb."
read -p "Please enter the URL to test [sub.domain.tld]: " test_url
echo "You entered: $test_url"
read -p "Do you have permission to test this URL? (y/n) " yn
while true; do
	case $yn in
		[Yy]* ) start_test;;
		[Nn]* ) exit;;
		* ) echo "Please enter either y or n...";;
	esac
done
