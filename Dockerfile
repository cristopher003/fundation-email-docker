# Utiliza la imagen base de Alpine Linux
FROM debian:12.1-slim

# Instala Python y pip en la imagen

RUN apt-get update

RUN apt-get install -y python3

# Instala Node.js y NPM en la imagen
RUN apt-get install nodejs npm -y

WORKDIR /app

# COPY package.json del proyecto que necesitas
COPY ./tarjetones/fnbr-tarjetones-2021/package.json package-lock.json* ./

#copia la carpeta del proyecto de tarjetones que necesitas
COPY ./tarjetones/fnbr-tarjetones-2021 .

RUN chmod -R 775 ./ 

RUN npm install --no-optional && npm cache clean --force

EXPOSE 3000
# Define el comando para ejecutar tu aplicación

# CMD ["npm", "run","build"]

CMD ["npm", "start"]
# CMD ["/bin/bash"]

