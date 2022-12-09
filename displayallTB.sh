if [[ ! "$(ls -A $PWD)"  ]]; then
    echo -e "\e[44mthere are no databases here\e[0m"
    read
    echo -e "\e[1;36mpress Enter to continue\e[0m"
    clear
else
    clear
    echo "------------------------------------------"
    echo All Tables :
    ls
    echo "------------------------------------------"
    read
    echo -e "\e[1;36mpress Enter to continue\e[0m"
    clear
fi