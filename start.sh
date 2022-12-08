if ! [[  -e `pwd`/DB ]]
then
    mkdir -p ./DB
fi

export maindir=$PWD
cd ./DB/

. $maindir/homeselect.sh

