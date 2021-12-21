inp="grades_.txt"

while read line
do
#set -x
#AUA=`echo $line | awk {' print $1 '}`
#GTH=`echo $line | awk {' print $2 '}`
NICK=`echo $line | awk {' print $1 '}`

FRST=`echo $line | awk {' print $2 '}`
SCND=`echo $line | awk {' print $3 '}`
THRD=`echo $line | awk {' print $4 '}`

EXM0=`echo $line | awk {' print $6 '}`
EXM1=`echo $line | awk {' print $7 '}`

echo $FRST $SCND $THRD $EXM0 $EXM1

HMS0=$(( $FRST + $SCND + $THRD ))
HMS1=`echo "scale=2; $HMS0 / 3" | bc`
HMS2=`printf '%.*f\n' 0 $HMS1`

EXS0=$(( $EXM0 + $EXM1 ))
EXS1=`echo "scale=2; $EXS0 / 2" | bc`
EXS2=`printf '%.*f\n' 0 $EXS1`

echo $HMS2 $EXS2

HMS3=$(( (50*HMS2+50) / 100 ))
EXS3=$(( (50*EXS2+50) / 100 ))

FIN=$(( $HMS3 + $EXS3 ))

echo $NICK $FIN >> out.txt
echo $NICK $FIN

done < $inp
