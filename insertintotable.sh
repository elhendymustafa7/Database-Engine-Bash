function check_dataType {
	datatype=$(head -1 $2 | cut -d ':' -f$3 | awk -F "-" 'BEGIN { RS = ":" } {print $2}')
	if [[ "$1" = '' ]]; then
		echo 1
	elif [[ "$1" = -?(0) ]]; then
		echo 0 # error!
	elif [[ "$1" = ?(-)+([0-9])?(.)*([0-9]) ]]; then
		if [[ $datatype == integer ]]; then
			# datatype integer and the input is integer
			echo 1
		else
			# datatype string and input is integer
			echo 1
		fi
	else
		if [[ $datatype == integer ]]; then
			# datatype integer and input is string
			echo 0 # error!
		else
			# datatype string and input is string
			echo 1
		fi
	fi
}
clear
if  [[ -z "$(ls -A $PWD)"  ]] 
then
    echo -e "\e[44mthere are no Tables here\e[0m"
    read
    clear
else
	clear
	echo "------------------------------------------"
	echo Tables :
	ls
	echo "------------------------------------------"
	echo enter the name of the table
	read dbtable
	if ! [[ -f "$dbtable" ]]; then
		echo -e "\e[41mthis table doesn't exist\e[0m"
		read
		clear
	else
		insertingData=true
		while $insertingData ; do
			echo -e "enter primary key $(head -1 "$dbtable" | cut -d ':' -f1 | awk -F "-" '{print $1}')" 
			read
			check_type=$(check_dataType "$REPLY" "$dbtable" 1)
			pk_used=$(cut -d ':' -f1 "$dbtable" | awk '{if(NR != 1) print $0}' | grep -x -e "$REPLY")  # => grep PK
			if [[ "$REPLY" == '' ]]; then
				echo -e "\e[41mno entry\e[0m"
				read
			elif ! [[ $REPLY =~ [A-Za-z0-9\_] ]]; then
				echo -e "\e[41mYou can't enter these characters => . / : - | \e[0m"
				read
			elif [[ "$check_type" == 0 ]]; then 
				echo -e "\e[41mentry invalid\e[0m"
				read
			elif ! [[ "$pk_used" == '' ]]; then
				echo -e "\e[41mthis primary key is already used\e[0m"
				read
			else 
				if [[ $num_col == 1 ]]; then
					echo "$REPLY" >> "$dbtable"
					inserting_other_data=false
					insertingData=false
					echo -e "\e[42mentry inserted successfully\e[0m"
					read
					clear
				else
				inserting_other_data=false
				echo -n "$REPLY" >> "$dbtable"
				echo -n ':' >> "$dbtable"
				fi


				num_col=$(head -1 "$dbtable" | awk -F: '{print NF}')
				for (( i = 2; i <= num_col; i++ )); do
					inserting_other_data=true
					while $inserting_other_data ; do
						echo -e "enter $(head -1 "$dbtable" | cut -d ':' -f$i | awk -F "-" 'BEGIN { RS = ":" } {print $1}') of type $(head -1 "$dbtable" | cut -d ':' -f$i | awk -F "-" 'BEGIN { RS = ":" } {print $2}')"
						read
						check_type=$(check_dataType "$REPLY" "$dbtable" "$i")
						if [[ "$check_type" == 0 ]]; then
							echo -e "\e[41mentry invalid\e[0m"
							read
						elif ! [[ $REPLY =~ [A-Za-z0-9\_] ]]; then
							echo -e "\e[41mYou can't enter these characters => . / : - | \e[0m"
							read
						else
							if [[ i -eq $num_col ]]; then
								echo "$REPLY" >> "$dbtable"
								inserting_other_data=false
								insertingData=false
								echo -e "\e[42mentry inserted successfully\e[0m"
								read
								clear
							else
								echo -n "$REPLY": >> "$dbtable"
								inserting_other_data=false
							fi
						fi
					done
				done
			fi
		done
	fi
fi