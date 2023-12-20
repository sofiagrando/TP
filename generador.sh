#!/bin/bash
output_directory="outputs"
mkdir -p "$output_directory"

VAR=$((RANDOM % 3))

if [ "$VAR" -eq 1 ]; then
    archivo="ffmpeg -f lavfi -i 'anoisesrc=a=0.1:c=white:duration=5'"
elif [ "$VAR" -eq 2 ]; then
    archivo="convert -size 100x100 xc: +noise Random"
elif [ "$VAR" -eq 3 ]; then
    archivo="base64 /dev/urandom | head -c 500 >"
else
    echo "Valor no esperado en VAR: $VAR"
fi

nombre=md5sum "$archivo"

"$archivo""output_directory/$nombre"

echo "Archivos generados exitosamente en el directorio $output_directory."
