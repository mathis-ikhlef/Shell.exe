firstNum=$1
secondNum=$3
operator=$2
if [ "$#" -ne 3 ]
then
	echo "Usage: $0 <nombre1> <opérateur> <nombre2>"
	exit 1
fi

if [[ ! "$operator" = ["+-/x"] ]]
then
	echo "Opérateur non valide"
	exit 1
fi
if [ "$operator" = "x" ]
then
operator=*
fi

result=$(($firstNum $operator $secondNum))
echo "$result"
