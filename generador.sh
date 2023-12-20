#!/bin/bash

generar_archivo() {
    VAR=$((RANDOM % 3))

    if [ "$VAR" -eq 0 ]; then
         ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" "$output_directory/audio_$i.wav"
        contenido="$output_directory/audio_$i.wav"
    elif [ "$VAR" -eq 1 ]; then
        convert -size 100x100 xc: +noise Random noise.png
        contenido=$(cat noise.png)
        rm noise.png
    elif [ "$VAR" -eq 2 ]; then
        base64 /dev/urandom | head -c 500 > file.txt
        contenido=$(cat file.txt)
        rm file.txt
    fi
    
    hash=$(echo "$contenido" | md5sum | awk '{print $1}')  # Calcula el hash MD5 del contenido
    echo "$hash"
    nombre_archivo="$output_directory/$hash"  # Construye el nombre del archivo con el hash
    
    echo "$contenido" > "$nombre_archivo"  # Guarda el contenido en el archivo
    
    echo "Archivo generado: $nombre_archivo"
}

output_directory="outputs"
mkdir -p "$output_directory"  # Crea la carpeta si no existe

# Genera cinco archivos llamando a la función cinco veces
for i in {1..10}; do
    generar_archivo
done
