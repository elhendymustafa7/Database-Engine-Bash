clear
echo -e "\e[1;36m------------------------------------------\e[1m"
echo Databases:
ls
echo -e "\e[1;36m------------------------------------------\e[0m"
	echo -e "\e[1;36menter name of the table\e[0m"
	read dbtable
	if ! [[ -f "$dbtable" ]]; then
		echo -e "\e[41mthis table doesn't exist\e[0m"
		echo -e "\e[1;36mpress Enter to continue\e[0m"
		read
		clear
	else
		clear
		echo -e "\e[1;36mEnter $(head -1 "$dbtable" | cut -d ':' -f1 | cut -d '-' -f1) of type $(head -1 "$dbtable" | cut -d ':' -f1 | cut -d '-' -f2) (primary key)\e[0m"
		read
		
		recordNum=$(cut -d ':' -f1 "$dbtable" | sed '1d' | grep -x -n -e "$REPLY" | cut -d':' -f1) #-n for numberLine and select it |sed print col1
		if [[ "$REPLY" == '' ]]; then
			echo -e "\e[41mno entry\e[0m"
			echo -e "\e[1;36mpress Enter to continue\e[0m"
			read
			clear
		elif [[ "$recordNum" = '' ]]; then
			echo -e "\e[41mthis primary key doesn't exist\e[0m"
			echo -e "\e[1;36mpress Enter to continue\e[0m"
			read
			clear
		else
			clear
			let recordNum=$recordNum+1
			num_col=$(head -1 "$dbtable" | awk -F: '{print NF}') 
			echo -e "\e[1;36mfields and values of this record:\e[0m"
			echo
			for (( i = 2; i <= num_col; i++ )); do
				echo -e "\e[1;36m$(head -1 $dbtable | cut -d ':' -f$i | cut -d '-' -f1) : $(sed -n "${recordNum}p" "$dbtable" | cut -d: -f$i)\e[0m"
			done
			echo
			echo -e "\e[1;36mpress Enter to continue\e[0m"
			read
			clear
		fi
	fi