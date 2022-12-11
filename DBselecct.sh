PS3=$'\e[1;35mChoose from table screen : \e[1m'
select choice in $'\e[1;36mCreate table             \e[0m' $'\e[1;36mDrop table             \e[0m' $'\e[1;36mInsert into table\e[0m' $'\e[1;36mDelete row           \e[0m' $'\e[1;36mUpdate table\e[0m' $'\e[1;36mDisplay row           \e[0m' $'\e[1;36mDisplay table\e[0m' $'\e[1;36mDisplay all table\e[0m'  $'\e[1;36mBack\e[0m'
do

    case $choice in
        $'\e[1;36mCreate table             \e[0m' )
            . $maindir/createTB.sh
            ;;
        $'\e[1;36mDrop table             \e[0m' )
            . $maindir/dropTB.sh
            ;;
        $'\e[1;36mInsert into table\e[0m' )
            . $maindir/insertintotable.sh
            ;;
        $'\e[1;36mDelete row           \e[0m' )
            . $maindir/deleterow.sh
            ;;
        $'\e[1;36mUpdate table\e[0m' )   
            . $maindir/updatetable.sh
            ;;
        $'\e[1;36mDisplay row           \e[0m' )
            . $maindir/displayrow.sh    
            ;;
        $'\e[1;36mDisplay table\e[0m' )
            . $maindir/displayTB.sh
            ;;
        $'\e[1;36mDisplay all table\e[0m' )
            . $maindir/displayallTB.sh
            ;;
        $'\e[1;36mBack\e[0m' )
            PS3=$'\e[35mChoose from Home Screen : \e[1m'
            cd ..
            echo -e "\e[1;36mpress Enter to continue\e[0m"
            read
            clear
            break
            ;;
         * )
            echo -e "\e[41minvalid entry\e[0m"
            echo -e "\e[1;36mpress Enter to continue\e[0m"
            read
            ;;
    esac
done