#!/bin/bash

####################################################
################### hping3icmp.sh ##################
####################################################


#########################################################################################################################
#  Script is used to perform specific ICMP scans against a single Target						#
#															#
#  Use only with legal autorization and at your own risk! ANY LIABILITY WILL BE REJECTED!				#
#															#
#  Uses hping3 to test ICMP Types(0-255) and Codes(0-2) according to OSSTMM						#
#  Script programming by Nico Viragh under GNU-GPLv3									#
#  Special thanks to the community and also for your personal project support.                                          #
#########################################################################################################################


#Asking for Targets IP
echo "Enter Target IP: "
read target 

#Set Output Color 
reset='\x1B[0m'
blue='\x1b[1;34m'

#Declare ICMP Types and Codes
typenumbers="0 3 5 7 8 9 10 11 12 13 14 40 41 42 43 253 254"
codenumbers="0 1 2"

#Main Part
for type in $typenumbers; do 
	for code in $codenumbers; 
	do
	echo -e "\n${blue}Type "$type", Code "$code"${reset}\n" 
	echo -e "${blue}###############################################${reset}\n" 

	hping3 -1 --force-icmp -V -c 5 -C $type -K $code $target 
	echo -e "\n${blue}###############################################${reset}" 
done;
done;




