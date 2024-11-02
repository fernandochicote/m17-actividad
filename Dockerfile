# Usa la imagen base de Python 3.10
FROM python:3.10-slim

# Configura el directorio de trabajo en el contenedor
WORKDIR /app

# Copia los archivos de tu proyecto al contenedor
COPY . /app

# Instala las dependencias de la librería dice
RUN pip install -r requirements.txt

# Define el comando por defecto para ejecutar el script
CMD ["python", "main.py"]
