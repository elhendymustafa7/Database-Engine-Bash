if ! [[  -e `pwd`/DB ]]
then
    mkdir -p ./DB
fi

export maindir=$PWD
cd ./DB/

clear
echo -e "\e[96m*************************************************************"
echo "*                                                           *"
echo "*                                                           *"
echo "*          Wellcome In Database Engine                      *"
echo "*                                                           *"
echo "*      AbdelRahman_Anany         Mustafa Elhendy            *"
echo "*                                                           *"
echo "*                                                           *"
echo "*                                                           *"
echo "*************************************************************"

echo -e "press Enter to continue\e[0m"
read 


. $maindir/homeselect.sh

