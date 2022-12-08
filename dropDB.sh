clear
if [[ -z "$(ls -A $PWD)" ]]
then
    echo -e "\e[44mthere are no databases here\e[0m"
    read
else
    clear
    echo "------------------------------------------"
    echo Databases:
    ls
    echo "------------------------------------------"
    echo enter the name of the database
    read db
    # db="$db"
    if [[ "$db" = '' ]]; then #null
        echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
        read
    elif ! [[ -d "$db" ]]; then 
        echo -e "\e[41mthis database doesn't exist\e[0m"
        read	
    else
        rm -rf "$db"
        echo -e "\e[42m$db removed from your databases\e[0m"
        read
    fi
fi
clear