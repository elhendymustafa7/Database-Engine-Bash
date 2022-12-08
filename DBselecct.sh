PS3="Choose from table screen : "
select choice in "Create table" "Drop table" "Insert into table" "Delete row" "Update table" "Display row" "Display table" "Display all table "  "Back"
do

    case $choice in
        "Create table" )
            . $maindir/createTB.sh
            ;;
        "Drop table" )
            . $maindir/dropTB.sh
            ;;
        "Insert into table" )
            . $maindir/insertintotable.sh
            ;;
        "Delete row" )
            . $maindir/deleterow.sh
            ;;
        "Update table" )
            . $maindir/updatetable.sh
            ;;
        "Display row" )
            . $maindir/displayrow.sh    
            ;;
        "Display table" )
            . $maindir/displayTB.sh
            ;;
        "Display all table " )
            . $maindir/displayallTB.sh
            ;;
        "Back" )
            PS3="Choose from Home Screen : "
            cd ..
            read
            break
            ;;
         * )
            echo -e "\e[41minvalid entry\e[0m"
            ;;
    esac
done