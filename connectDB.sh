clear
if [[ ! "$(ls -A $maindir/DB)"  ]]; then
    echo -e "\e[44mthere are no databases here\e[0m"
    echo -e "\e[1;36mpress Enter to continue\e[0m"
    read
else
        echo -e "\e[1;36m------------------------------------------"
        echo Databases:
        ls
        echo -e "------------------------------------------\e[0m"
        echo -e "\e[1;36mEnter the name of the database\e[0m"
        read db
        db="$db"
        if [[ "$db" = '' ]]; then
            echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
            echo -e "\e[1;36mpress Enter to continue\e[0m"
            read
        elif ! [[ -d "$db" ]]; then
            echo -e "\e[41mthis database doesn't exist\e[0m"
            echo -e "\e[1;36mpress Enter to continue\e[0m"
            read
        else
            cd "$db"
            echo -e "\e[42mthe database connected successfully \e[0m"
            echo -e "\e[1;36mpress Enter to continue\e[0m"
            read
            clear
            . $maindir/DBselecct.sh
        fi
fi
clear