clear
echo -e "\e[1;36mEnter name of table to create please\e[0m"
read dbtable
if [[ "$dbtable" = "" ]]; then
	echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
	echo -e "\e[1;36mpress Enter to continue\e[0m"
	read
elif [[ -e "$dbtable" ]]; then
	echo -e "\e[41mthis table name exists\e[0m"
	echo -e "\e[1;36mpress Enter to continue\e[0m"
	read
elif  [[ "$dbtable" =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]]; then
	touch "$dbtable"
	. $maindir/createmetadata.sh
	echo -e "\e[42mTable created sucessfully\e[0m"
	echo -e "\e[1;36mpress Enter to continue\e[0m"
	read
	clear
	. $maindir/DBselecct.sh
else
	echo -e "\e[41mTable name can't start with numbers or special characters\e[0m"
	echo -e "\e[1;36mpress Enter to continue\e[0m"
	read
fi
clear

