# Utilizar una imagen oficial de Node.js
FROM node:20-alpine

# Crear directorio de trabajo
WORKDIR /usr/src/app

# Copiar el package.json y package-lock.json
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el código fuente
COPY src/ ./src/

# Exponer el puerto
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD [ "npm", "start" ]
