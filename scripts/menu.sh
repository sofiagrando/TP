#!/bin/bash

menu() {
    echo "MENU DE OPCIONES"
    echo "1. Procesar archivos."
    echo "2. Monitoreo del sistema."
    echo "3. Analizador de textos >"
    echo "4. Salir."

    read -p "que accion desea realizar? " opcion

    case "$opcion" in 
        1)
            read -p "cuantos archivos quiere crear? " numero
            echo "esto llevara $numero minutos"
            source ./timer.sh
            timer "$numero"
            source ./clasificador.sh
            clasificador
            menu
            ;;
        
        2)
            source ./monitor.sh
            monitor
            menu
            ;;
    
        3)
            source ./analizador_textos.sh
            echo -e "\nsubmenu"
            echo "a. Longitud de palabras"
            echo "b. Palíndromos"
            echo "c. Deteccion de direcciones de mail"
            echo "d. Volver al menu principal."
            read -p "indique la ruta del archivo: " ruta
            read -p "que accion desea realizar? " opcionn
            
            case "$opcionn" in
                "a") 
                    longitud "$ruta"
                    ;;

                "b")
                    palindromos "$ruta"
                    ;;

                "c")
                    mail "$ruta"
                    ;;

                "d")
                    menu
                    ;;

                *)
                    echo "vuelva a empezar"
                    menu
                    ;;
            esac
            menu
            ;;
        4)
            echo -e "\nVuelva prontos"
            ;;
    
        *)
            echo -e "opcion no valida.\n"
            menu
            ;;

    esac
}
menu