#!/bin/bash
###################################################
##countBeforeFirstMatch
###################################################
##Descripcion:
#Script creado para contar cuantas veces se repite un patron desde cierto
#numero de index en un string, de manera consecutiva analizando cada palabra,
# hasta que se alcanza la primera inconcordancia, devolviendo el numero de veces
#que el patron se repitio consecutivamente, hasta llegar a ese punto.
##
#Autor:
#T90R. -Sigan el camino en llamas Nyx.
#MAIL: "Recordar agregar mail Ramiel.-"
#Contacteme si quiere preguntar algo.
###################################################
##Funciones:
###################################################
PrintSintaxys(){
echo "Sintaxys:" >&2
echo "countBeforeFirstMatch Patrón [String] [IndexInicial]" >&2
exit 1
}
###################################################
##
#COMPROBACIONES:
#$1=regexp
in=""
iniIndex=""

if [ $# -lt 1 -o $# -gt 3 ];then
PrintSintaxys
fi

#{
if [ $# = 2 ];then

if [[ $2 =~ [[:digit:]] ]];then
iniIndex=$2
elif [[ $2 =~ [[:alnum:]] ]];then
in=$2
else
echo "El segundo argumento debe ser un digito o alnum." >&2
PrintSintaxys
fi

#}{
elif [ $# = 3 ];then

if [[ $3 =~ [[:digit:]] ]];then
iniIndex=$3
else
echo "El tercer argumento debe ser un numero." >&2
PrintSintaxys
fi
in=$2

#} (si es 1 arg...)
fi
#
if [ -z "$in" ];then
read in
fi

if [ -z "$iniIndex" ];then
iniIndex=0
fi

##
#Fin Comprobaciones.
################################################
##
#Procesar datos:

in=${in:$iniIndex:${#in}}
nmatchs=0

for palabra in $in
do
if [[ $palabra == $1 ]];then
((++nmatchs))
else
break
fi
done
echo $nmatchs

##
#Fin c: .
