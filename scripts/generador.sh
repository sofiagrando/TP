#!/bin/bash

# generar_archivo(): calcula un numero random y dependiendo el que salga crea distintos tipos de archivos
# siendo estos texto, imagen o audio, luego cambia lo renombra por si hash y lo añade a la carpeta outputs 

generar_archivo() {
    VAR=$((RANDOM % 3))

    if [ "$VAR" -eq 0 ]; then
         ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" "$output_directory/audio.wav"
        contenido="$output_directory/audio.wav"
        
        hash=$(md5sum "$contenido" | awk '{print $1}')  # Calcula el hash MD5 del contenido
        nombre_archivo="$output_directory/$hash.wav"  # si no pongo el .wav no crea audios
        nombre_nuevo="$output_directory/$hash"

        mv "$contenido" "$nombre_archivo"  # Mueve el archivo a su ubicación final
        mv "$nombre_archivo" "$nombre_nuevo" 

    else 
        if [ "$VAR" -eq 1 ]; then
            convert -size 100x100 xc: +noise Random noise.png
            contenido=$(cat noise.png)
            rm noise.png #elimina el archivo temporal
        else
            base64 /dev/urandom | head -c 500 > file.txt
            contenido=$(cat file.txt)
            rm file.txt
        fi

        hash=$(echo "$contenido" | md5sum | awk '{print $1}')
        nombre_archivo="$output_directory/$hash"  # Construye el nombre del archivo con el hash
    
    echo "$contenido" > "$nombre_archivo"  # Guarda el contenido en el archivo
    fi
    
    echo "Archivo generado: $nombre_archivo"
}

output_directory="outputs"
mkdir -p "$output_directory" 


#generar_archivo