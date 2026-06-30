# Usamos la versión de Node que requiere tu app
FROM node:18-alpine

# Creamos el directorio de trabajo
WORKDIR /usr/src/app

# Copiamos los archivos de dependencias
COPY package*.json ./

# Instalamos solo las dependencias de producción
RUN npm install --only=production

# Copiamos el resto del código de la API
COPY . .

# Exponemos el puerto que Cloud Run usa por defecto
EXPOSE 8080

# Comando para arrancar tu API basado en tu package.json
CMD [ "npm", "start" ]