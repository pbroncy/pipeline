#!/bin/bash

# Definir la ruta del sitio web
SITE_PATH="/home/pbroncy/my-static-website"
BUCKET_NAME="pipelinegalileo"

# Verificar si la ruta proporcionada existe
if [ ! -d "$SITE_PATH" ]; then
    echo "The user-provided path $SITE_PATH does not exist."
    exit 1
fi

# Subir el contenido del sitio web a S3
aws s3 cp "$SITE_PATH" "s3://$BUCKET_NAME/" --recursive

# Verificar si la subida fue exitosa
if [ $? -eq 0 ]; then
    echo "Sitio web estático subido exitosamente a S3://$BUCKET_NAME"
else
    echo "Error al subir el sitio web estático a S3://$BUCKET_NAME"
    exit 1
fi
