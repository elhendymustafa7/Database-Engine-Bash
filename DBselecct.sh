PS3=$'\e[1;35mChoose from table screen : \e[1m'
select choice in $'\e[1;36mCreate table' $'Drop table' $'Insert into table' $'Delete row' $'Update table' $'Display row' $'Display table' $'Display all table'  $'Back'
do

    case $choice in
        $'\e[1;36mCreate table' )
            . $maindir/createTB.sh
            ;;
        $'Drop table' )
            . $maindir/dropTB.sh
            ;;
        $'insert into table' )
            . $maindir/insertintotable.sh
            ;;
        $'Delete row' )
            . $maindir/deleterow.sh
            ;;
        $'Update table' )
            . $maindir/updatetable.sh
            ;;
        $'Display row' )
            . $maindir/displayrow.sh    
            ;;
        $'Display table' )
            . $maindir/displayTB.sh
            ;;
        $'Display all table' )
            . $maindir/displayallTB.sh
            ;;
        $'Back' )
            PS3=$'\e[35mChoose from Home Screen : \e[1m'
            cd ..
            break
            ;;
         * )
            echo -e "\e[41minvalid entry\e[0m"
            echo -e "\e[1;36mpress Enter to continue\e[0m"
            read
            ;;
    esac
done