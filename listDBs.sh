clear
if [[ -z "$(ls -A $PWD)" ]]; then
    echo -e "\e[44mthere are no databases here\e[0m"
    read
    clear
else
    clear
    echo "------------------------------------------"
    echo Databases:
    ls
    echo "------------------------------------------"
    read
fi
clear