#!/bin/bash

# Obtener la fecha y hora actual en el formato DD_MM_YY:HH_MM_SS
fecha_hora=$(date +"%d_%m_%y:%H_%M_%S")

# Crear el directorio outputs si no existe
mkdir -p outputs

# Crear el nombre del archivo de reporte
nombre_reporte="outputs/report_$fecha_hora.txt"

# uso de CPU
uso_cpu=$(top -bn1 | grep "%Cpu(s)" | awk '{print $2}' | cut -d. -f1)

# uso de RAM
uso_ram=$(free -m | awk '/Mem/ {print $3}')

# número de procesos en ejecución
num_procesos=$(ps aux | wc -l)

# espacio libre en el disco
espacio_libre=$(df -h / | awk '/\// {print $4}')

# Crear el contenido del reporte
contenido_reporte="Uso de CPU: $uso_cpu%\nUso de RAM: $uso_ram MB\nNúmero de procesos: $num_procesos\nEspacio libre en disco: $espacio_libre"

# Guardar el reporte en el archivo
echo -e "$contenido_reporte" > "$nombre_reporte"

echo "Reporte guardado en $nombre_reporte"
