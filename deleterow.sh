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
    echo -e "enter primary key $(head -1 "$dbtable" | cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $1}')"
    read
    recordNum=$(cut -d ':' -f1 "$dbtable" | awk '{if(NR != 1) print $0}'| grep -x -n -e "$REPLY" | cut -d':' -f1)
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
        sed -i "${recordNum}d" "$dbtable"
        echo -e "\e[42mrecord deleted successfully\e[0m"
        read
        clear
    fi
fi