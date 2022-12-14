clear
if [[ -z "$(ls -A $PWD)" ]]
then
    echo -e "\e[44mthere are no databases here\e[0m"
    read
else
    clear
    echo -e "\e[1;36m------------------------------------------"
    echo Databases:
    ls
    echo -e "\e[1;36m------------------------------------------\e[0m"
    echo -e "\e[1;36menter the name of the database\e[1m"
    read db
    if [[ "$db" = '' ]]; then #null
        echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
        echo -e "\e[1;36mpress Enter to continue\e[0m"
        read
    elif ! [[ -d "$db" ]]; then 
        echo -e "\e[41mthis database doesn't exist\e[0m"
        echo -e "\e[1;36mpress Enter to continue\e[0m"
        read	
    else
        rm -rf "$db"
        echo -e "\e[42m$db removed from your databases\e[0m"
        echo -e "\e[1;36mpress Enter to continue\e[0m"
        read
    fi
fi
clear