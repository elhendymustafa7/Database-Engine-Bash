clear
echo -e "\e[1;36m------------------------------------------\e[1m"
echo Tables:
ls
echo -e "\e[1;36m------------------------------------------\e[0m"
echo -e "\e[1;36mEnter table name to display\e[0m"
read dbtable
clear
if ! [[ -f "$dbtable" ]]; then
	echo -e "\e[41mthis table doesn't exist\e[0m"
	echo -e "\e[1;36mpress Enter to continue\e[0m"
	read
	clear
else
	echo -e "\e[1;36m------------------------------------------------------------\e[1m"
	head -1 "$dbtable" | awk 'BEGIN{ RS = ":"; FS = "-" } {print $1}' | awk 'BEGIN{ORS="\t"} {print $0}'
	echo -e "\e[1;36m\n------------------------------------------------------------\e[1m"
	sed '1d' "$dbtable" | awk -F: 'BEGIN{OFS="\t"} {for(n = 1; n <= NF; n++) $n=$n}  1'
	echo -e "\e[1;36mpress Enter to continue\e[0m"
	read
	clear
fi