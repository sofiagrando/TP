#!/bin/bash

# archivos de audio file (audio)
# archivos de imagen file (data)
# archivos de texto file (text)


carpeta="/home/chofi/Escritorio/TP/outputs"

# clasificador(): recibe una ruta y clasifica archivos de audio, texto e imagenes separandolos 
# en carpetas y cambiando su nombre por tipo_numero.extencion dependiendo de cual es.

clasificador() {
    ruta=$1
    archivos=$(ls "$ruta")

    #inicio un contador para los nombre de los archivos
    imagen=1
    audio=1
    texto=1

    # si no existen se crean las carpetas.
    mkdir -p "$ruta/img"
    mkdir -p "$ruta/txt"
    mkdir -p "$ruta/snd"

    for archivo in $archivos; do
        
        
        if file "$ruta/$archivo" | grep -q "audio"; then
            #echo "audio"
            nuevo_nombre="sonido_$audio.wav"
            mv "$ruta/$archivo" "$ruta/snd/$nuevo_nombre"
            ((audio ++))

        elif file "$ruta/$archivo" | grep -q "text"; then
            #echo "texto"
            nuevo_nombre="texto_$texto.txt"
            mv "$ruta/$archivo" "$ruta/txt/$nuevo_nombre"
            ((texto ++))

        elif file "$ruta/$archivo" | grep -q "data"; then
            #echo "imagen"
            nuevo_nombre="imagen_$imagen.png"
            mv "$ruta/$archivo" "$ruta/img/$nuevo_nombre"
            ((imagen ++))
        fi
    done
    echo "comprimiendo en .tar"
    tar -cvf outputs.tar outputs
}


clasificador "$carpeta"