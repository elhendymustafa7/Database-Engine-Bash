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
echo "------------------------------------------"
echo Tables :
ls
echo "------------------------------------------"
	echo enter name of the table
	read dbtable
	if ! [[ -f "$dbtable" ]]; then
		echo -e "\e[41mthis table doesn't exist\e[0m"
        read
		clear
	else
		echo enter your primary key \"$(head -1 "$dbtable" | cut -d ':' -f1 |\
		awk -F "-" 'BEGIN { RS = ":" } {print $1}')\" that you want to update type of $(head -1 "$dbtable"\
		| cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $2}') 
		read
		
		recordNum=$(cut -d ':' -f1 "$dbtable" | sed '1d'\
		| grep -x -n -e "$REPLY" | cut -d':' -f1)
		if [[ "$REPLY" == '' ]]; then
			echo -e "\e[41mno entry\e[0m"
            read
			clear
		elif [[ "$recordNum" = '' ]]; then
			echo -e "\e[41mthis primary key doesn't exist\e[0m"
            read
			clear
		else
			let recordNum=$recordNum+1
			num_col=$(head -1 "$dbtable" | awk -F: '{print NF}') 
			echo -e "\e[42mrecord fields:\e[0m"
			option=$(head -1 $dbtable | awk 'BEGIN{ RS = ":"; FS = "-" } {print $1}')
			echo "$option"
			getFieldName=true
			while $getFieldName; do
				echo enter field name to update
				read
				if [[ "$REPLY" = '' ]]; then
					echo -e "\e[41minvalid entry\e[0m"
                    read
				elif [[ $(echo "$option" | grep -x "$REPLY") = "" ]]; then
					echo -e "\e[41mno such field with the entered name, please enter a valid field name\e[0m"
                    read
					clear
				else
					fieldnum=$(head -1 "$dbtable" | awk 'BEGIN{ RS = ":"; FS = "-" } {print $1}'\
					| grep -x -n "$REPLY" | cut -d: -f1)
					updatingField=true
					while $updatingField; do
						if [[ "$fieldnum" = 1 ]]; then
							echo enter new value 
							read
							check_type=$(check_dataType "$REPLY" "$dbtable" 1)
							pk_used=$(cut -d ':' -f1 "$dbtable" | awk '{if(NR != 1) print $0}' | grep -x -e "$REPLY")
							if [[ "$REPLY" == '' ]]; then
								echo -e "\e[41mno entry, id can't be null\e[0m"
                                read
								clear
							elif [[ "$check_type" == 0 ]]; then
							echo "5"
								echo -e "\e[41mentry invalid\e[0m"
                                read
								clear
							elif ! [[ "$pk_used" == '' ]]; then
								echo -e "\e[41mthis primary key already used\e[0m"
                                read
								clear
							else 
								awk -v fn="$fieldnum" -v rn="$recordNum" -v nv="$REPLY"\
								'BEGIN { FS = OFS = ":" } { if(NR == rn)	$fn = nv } 1' "$dbtable"\
								> "$dbtable".new && rm "$dbtable" && mv "$dbtable".new "$dbtable"
								updatingField=false
								getFieldName=false
							fi
						else
							updatingField=true
							while $updatingField ; do
								echo enter \"$(head -1 $dbtable | cut -d ':' -f$fieldnum |\
								awk -F "-" 'BEGIN { RS = ":" } {print $1}')\" of type $(head -1 "$dbtable" | cut -d ':' -f$fieldnum |\
								awk -F "-" 'BEGIN { RS = ":" } {print $2}') and size $(head -1 "$dbtable" | cut -d ':' -f$fieldnum |\
								awk -F "-" 'BEGIN { RS = ":" } {print $3}')
								read
								check_type=$(check_dataType "$REPLY" "$dbtable" "$fieldnum")
								if [[ "$check_type" == 0 ]]; then
									echo -e "\e[41mentry invalid\e[0m"
                                    read
									clear
								else
									awk -v fn="$fieldnum" -v rn="$recordNum" -v nv="$REPLY"\
									'BEGIN { FS = OFS = ":" } { if(NR == rn)	$fn = nv } 1' "$dbtable"\
									> "$dbtable".new && rm "$dbtable" && mv "$dbtable".new "$dbtable"
									updatingField=false
									getFieldName=false
								fi
							done
						fi
					done
					echo -e "\e[42mfield updated successfully\e[0m"
					read
					clear
				fi
			done
		fi
	fi