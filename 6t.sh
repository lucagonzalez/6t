totalgrupos=0
arr=()
while true; do
    read -p "Por favor, inserte el archivo: " respuesta
    vef=`ls | grep -w $respuesta`
    if [[ $vef != $respuesta ]];then
	echo "Nombre incorrecto!"
    else
	for i in $(cat $respuesta);do
	    if [[ $i == *[':']* ]];then
		arr+=($usuarios)
		totalgrupos=$((totalgrupos+1))
		usuarios=0
		arr+=($i)
	    else
		usuarios=$((usuarios+1))
	    fi
	done
	arr+=($usuarios)
	echo "En el fichero proporcionado tenemos $totalgrupos grupos:"
	echo "${arr[*]}"
	maxval=${#arr[*]}
	masusuarios=0
	for j in `seq 1 $maxval`; do
	    test=`expr $j % 2`
	    if [ $j -eq 0 ];then
		continue;
	    elif [ $test -ne 0 ];then
		currentusuarios=${arr[j]}
		if [ $currentusuarios -gt $masusuarios ];then
		    masusuarios=$((currentusuarios))
		    posmax=`expr $j - 1`
		fi
	    fi
	done
	grupoconmasusuarios=${arr[$posmax]}
	echo "El grupo con mas usuarios es ${grupoconmasusuarios%?}"
	break;
    fi
done

    
