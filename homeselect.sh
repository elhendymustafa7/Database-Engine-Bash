clear
PS3="Choose from Home Screen : "
select choice in  "Display All Databases" "Create a new database" "Connect to Database" "Drop Database" "Exit"
do 
    case $choice in
        "Display All Databases" )
                . $maindir/listDBs.sh
                ;;
        "Create a new database" )
                . $maindir/createDB.sh
                ;;
        "Connect to Database" )
                . $maindir/connectDB.sh
                clear
                ;;
        "Drop Database" )
                . $maindir/dropDB.sh
                ;;
        "Exit" )
                break
                ;;
        * )
		echo -e "\e[41minvalid entry\e[0m"
                read
                clear
                ;;
        ^$ )
                echo -e "\e[41minvalid entry\e[0m"
                read
                clear
                ;;
    esac
done