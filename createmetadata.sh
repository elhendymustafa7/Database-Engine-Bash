clear
PS1=""
validMetaData=true
#############################  Primary Key    ##############################
while $validMetaData; do
        echo -e "how many columns you want?"
        read num_col
        
        if [[ "$num_col" =~ ^([1-9])+([0-9])*$ ]]; then # => one or more number
            validMetaData=false
            clear
        else
            echo -e "\e[41minvalid entry\e[0m"
            read
            clear
        fi
done

validMetaData=true
while $validMetaData; do
        echo -e "enter primary key name"
        read pk_name
        if [[ $pk_name = "" ]]; then
            echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
            read
            clear
        elif [[ $pk_name =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]]; then
            echo -n "$pk_name" >> "$dbtable"
            echo -n "-" >> "$dbtable"
            validMetaData=false
            clear
        else
            echo -e "\e[41m Primary key can't start with numbers or special characters\e[0m"
            read
            clear
        fi
done

validMetaData=true
while $validMetaData; do
        echo -e "enter primary key datatype"
        select choice in "integer" "string"; do
            if [[ "$REPLY" = "1" || "$REPLY" = "2" ]]; then
                echo -n "$choice" >> "$dbtable"
                if [[ $num_col -eq 1 ]]; then
							echo $'\n' >> "$dbtable"
						else
							echo -n ":" >> "$dbtable"
						fi
                validMetaData=false
                clear
            else
                echo -e "\e[41minvalid chioce\e[0m"
                read
                clear
            fi
            break
        done
done

############################# End  Primary Key    ##############################


for (( i = 1; i < num_col; i++ )); do
        validMetaData=true
        while $validMetaData; do
            echo -e "enter name of column $[i+1]"
            read field_name
            if [[ $field_name = "" ]]; then
                echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
                read
                clear
            elif [[ $field_name =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]]; then
                echo -n "$field_name" >> "$dbtable"
                echo -n "-" >> "$dbtable"
                validMetaData=false
            else
                echo -e "\e[41mfield name can't start with numbers or special characters\e[0m"
                read
                clear
            fi
            clear
    done
    validMetaData=true
    while $validMetaData; do
            echo -e "enter field $[i+1] datatype"
            select choice in "integer" "string"; do
                if [[ "$REPLY" = "1" || "$REPLY" = "2" ]]; then
                    echo -n "$choice" >> "$dbtable"
                if [[ i -eq $num_col-1 ]]; then
                    echo $'\n' >> "$dbtable"
                else
                    echo -n ":" >> "$dbtable"
                fi
                validMetaData=false
                else
                    echo -e "\e[41minvalid choice\e[0m"
                    read
                    clear
                fi
                break
            done
    done
done
PS1="Choose from Table Screen : "


