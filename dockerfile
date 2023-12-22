# Usa una imagen base ligera de Linux
FROM alpine:latest

# Instala las dependencias necesarias
RUN apk add --no-cache bash

# Copia los scripts al contenedor
COPY scripts/ /scripts/

# Establece el directorio de trabajo
WORKDIR /scripts/

# Establece la entrada predeterminada al script del menú
CMD ["bash", "tu_script_menu.sh"]
