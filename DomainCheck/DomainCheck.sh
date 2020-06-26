#!/bin/bash

list=`cat list.txt`


for X in $list
do 
	echo '=============='
	echo 'Lookup for domain' $X
	whois $X | grep  "Date\|Registrant\|Registrar"
		
		if [ "$?" -eq "1" ] 
		then 
		echo 'Not Valid Sub Domain' 
		echo 'Resolving root domain'
		Y=`echo $X | rev | cut -d '.' -f 1,2 | rev`
		echo $Y 
		whois $Y | grep "Date\|Registrant\|Registrar"		
		fi
 	
	
done
