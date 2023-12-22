#!/bin/bash

menu() {
    echo "MENU DE OPCIONES"
    echo "1. Procesar archivos"
    echo "2. Monitoreo del sistema"
    echo "3. Analizador de textos >"

    read -p "que accion desea realizar? " opcion

    case "$opcion" in 
        1)
            read -p "cuantos archivos quiere crear? " numero
            echo "esto llevara $numero minutos"
            source /home/chofi/Escritorio/TP/timer.sh
            timer "$numero"
            source /home/chofi/Escritorio/TP/clasificador.sh
            clasificador
            ;;
        
        2)
            source /home/chofi/Escritorio/TP/monitor.sh
            monitor
            ;;
    
        3)
            source /home/chofi/Escritorio/TP/analizador_textos.sh
            echo "submenu"
            echo "a. Longitud de palabras"
            echo "b. Palíndromos"
            echo "c. Deteccion de direcciones de mail"
            read -p "indique la ruta del archivo: " ruta
            read -p "que accion desea realizar? " opcionn
            
            case "$opcionn" in
                "a") 
                    #COMPLETAR
                    echo "completar"
                    ;;
                "b")
                    echo "completar" 
                    ;;
                "c")
                    echo "completar"
                    ;;
                *)
                    echo "vuelva a empezar"
                    menu
                    ;;
            esac
            ;;
    
        *)
            echo "opcion no valida."
            menu
            ;;

    esac

}
menu