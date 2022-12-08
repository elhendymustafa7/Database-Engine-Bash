clear
echo "------------------------------------------"
echo Databases:
ls
echo "------------------------------------------"
	echo enter name of the table
	read dbtable
	if ! [[ -f "$dbtable" ]]; then
		echo -e "\e[41mthis table doesn't exist\e[0m"
		read
	else
		echo enter primary key \"$(head -1 "$dbtable" | cut -d ':' -f1 |\
		awk -F "-" 'BEGIN { RS = ":" } {print $1}')\" of type $(head -1 "$dbtable"\
		| cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $2}') 
		read
		
		recordNum=$(cut -d ':' -f1 "$dbtable" | sed '1d'\ | grep -x -n -e "$REPLY" | cut -d':' -f1)
		if [[ "$REPLY" == '' ]]; then
			echo -e "\e[41mno entry\e[0m"
			read
		elif [[ "$recordNum" = '' ]]; then
			echo -e "\e[41mthis primary key doesn't exist\e[0m"
			read
		else
			let recordNum=$recordNum+1
			num_col=$(head -1 "$dbtable" | awk -F: '{print NF}') 
			echo -e "42mfields and values of this record:"
			for (( i = 2; i <= num_col; i++ )); do
					echo \"$(head -1 $dbtable | cut -d ':' -f$i | awk -F "-" 'BEGIN { RS = ":" } {print $1}')\" : $(sed -n "${recordNum}p" "$dbtable" | cut -d: -f$i)
			done
			read
			clear
		fi
	fi