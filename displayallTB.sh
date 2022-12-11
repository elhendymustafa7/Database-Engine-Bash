if [[ ! "$(ls -A $PWD)"  ]]; then
    echo -e "\e[44mthere are no databases here\e[0m"
    read
    echo -e "\e[1;36mpress Enter to continue\e[0m"
    clear
else
    clear
    echo -e "\e[1:36m------------------------------------------\e[1m"
    echo All Tables :
    ls
    echo -e "\e[1:36m------------------------------------------\e[0m"
    echo -e "\e[1;36mpress Enter to continue\e[0m"
    read
    clear
fi