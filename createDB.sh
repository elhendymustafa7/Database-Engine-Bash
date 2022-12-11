check=true
while $check 
do
clear
echo -e "\e[1;36menter the name of the database please\e[0m"
read dbname
if [[ -e "$dbname" ]]; then
    echo -e "\e[41mDatebase was exist\e[0m"
    echo -e "\e[1;36mpress Enter to continue\e[0m"
    read
elif [[ "$dbname" =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]]; then 
    mkdir -p "$dbname"
    echo -e "\e[42mdatabase created sucessfully\e[0m"
    check=false
    echo -e "\e[1;36mpress Enter to continue\e[0m"
    read
    clear
else    
    echo -e "\e[41mDatabase name can't start with numbers or contain special characters\e[0m"
    echo -e "\e[1;36mpress Enter to continue\e[0m"
    read
fi
clear
done

