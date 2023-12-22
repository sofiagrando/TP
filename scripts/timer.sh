#!/bin/bash 

source ./generador.sh

# timer(): recibe un numero n y ejecuta el generador de archivos n veces una vez por minuto.

timer() {

    cant=$1 #cantidad de archivos que quiero generar

    for ((i = 1; i <= cant; i++)); do
    
        generar_archivo

        if [ "$i" -eq "$cant" ]; then
            echo "se han creado $cant archivos"
        else
            echo "en un minuto se generara otro archivo"
        fi

        sleep 1m
    done
}

#timer 8