if  [[ -z "$(ls -A $PWD)"  ]] 
then
    echo -e "\e[44mthere are no Tables here\e[0m"
    echo -e "\e[1;36mpress Enter to continue\e[0m"
    read
    clear
else
    check=true  
    while $check 
    do 
        clear
        echo -e "\e[1;36m------------------------------------------\e[1m"
        echo Tables :
        ls
        echo -e "\e[1;36m------------------------------------------\e[0m"
        echo -e "\e[1;36menter the name of the table to delete\e[0m"
        read dbtable
        if ! [[ -f "$dbtable" ]]; then
            echo -e "\e[41mthis table doesn't exist\e[0m"
            echo -e "\e[1;36mpress Enter to continue\e[0m"
            read
            clear
        else
            rm "$dbtable"
            echo -e "\e[42mtable deleted successfully\e[0m"
            echo -e "\e[1;36mpress Enter to continue\e[0m"
            read
            check=false
            clear
        fi
    done
fi