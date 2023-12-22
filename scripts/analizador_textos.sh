#!/bin/bash

# palindromos(): recibe la ruta a un archivo de texto, busca si existen palindromos y los imprime.

palindromos() {
    archivo=$1

# Verifica si el archivo existe
if [ -e "$archivo" ]; then
    # Usa un bucle for para recorrer las palabras
    
    for palabra in $(cat "$archivo"); do
        if [ ${#palabra} -gt 1 ]; then
            palabra_invertida=$(echo "$palabra" | rev)
            palabra=$(echo "$palabra" | tr '[:upper:]' '[:lower:]' | iconv -f utf-8 -t ascii//TRANSLIT)
            palabra_invertida=$(echo "$palabra_invertida" | tr '[:upper:]' '[:lower:]' | iconv -f utf-8 -t ascii//TRANSLIT)

            if [ "$palabra" == "$palabra_invertida" ]; then
                echo "$palabra"
            fi
        fi
    done

else
    echo "El archivo $archivo no existe."
fi
}


# longitud(): recibe la ruta a un archivo de texto y devuelve la palabra mas larga, la
# mas corta y el promedio de largo de las palabras.

longitud() {
    ruta=$1
    corta=""
    larga=""
    cuenta=0 #cuenta la cantidad de palabras que hay en el texto 
    suma=0
    
    for palabra in $(cat "$ruta"); do
        longitud=${#palabra}
        suma=$((suma + longitud))
        ((cuenta++))
        if [ -z "$corta" ] && [ -z "$larga" ]; then
            corta=$palabra
            larga=$palabra
        elif [ ${#palabra} -lt ${#corta} ]; then
            corta=$palabra
        elif [ ${#palabra} -gt ${#larga} ]; then
            larga=$palabra
        fi
    done
    promedio=$((suma/cuenta)) #hace division entera.
    echo -e "Palabra mas larga: $larga\nPalabra mas corta: $corta\nPromedio: $promedio"
}


# mail(): recibe la ruta a un archivo de texto y lista las direcciones de mail que encuentre
# en orden y sin repeticiones.

mail() {
    ruta=$1
    separado=$(tr -s ' ' '\n' < "$ruta" | grep '\*\|\@\|\*\|\.com' | sort | uniq)
    echo "$separado"

}
