clear
PS3=$'\e[35mChoose from Home Screen : \e[1m'
select choice in $'\e[1;36mDisplay All Databases' $'Create a new database' $'Connect to Database' $'Drop Database' $'Exit'
do 
    case $choice in
        $'\e[1;36mDisplay All Databases' )
                . $maindir/listDBs.sh
                ;;
        $'Create a new database' )
                . $maindir/createDB.sh
                ;;
        $'Connect to Database' )
                . $maindir/connectDB.sh
                clear
                ;;
        $'Drop Database' )
                . $maindir/dropDB.sh
                ;;
        $'Exit' )
                break
                ;;
        * )
		echo -e "\e[41minvalid entry\e[0m"
                echo -e "\e[1;36mpress Enter to continue\e[0m"
                read
                clear
                ;;
        ^$ )
                echo -e "\e[41minvalid entry\e[0m"
                echo -e "\e[1;36mpress Enter to continue\e[0m"
                read
                clear
                ;;
    esac
done