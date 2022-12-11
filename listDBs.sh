clear
if [[ -z "$(ls -A $PWD)" ]]; then
    echo -e "\e[44mthere are no databases here\e[0m"
    read
    clear
else
    clear
    echo -e "\e[1;36m------------------------------------------"
    echo Databases:
    echo
    ls
    echo
    echo "------------------------------------------"
    echo -e "press Enter to continue\e[0m"
    read
fi
clear