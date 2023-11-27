### STAGE 1: Build ###
#1- Basez votre stage du Dockerfile sur node:12.7-alpine
#2- Nommez cette image comme build
FROM node:12.7-alpine AS build
#3- Utiliser le dossier /usr/src/app comme étant un répertoire de travail
WORKDIR /usr/src/app
#4- Copiez les deux fichiers package.json package-lock.json au répertoire de travail
COPY package.json package-lock.json ./
#5- Lancer npm install à partir du répertoire de travail
RUN npm install
#6- Copiez le contenu du projet
COPY . .
#7- Lancer npm run build sur la totalité du projet
RUN npm run build

### STAGE 2: Run ###
#1- Basez votre stage du Dockerfile sur nginx:1.17.1-alpine
FROM nginx:1.17.1-alpine
#2- Copiez le fichier de configuration nginx.conf vers le chemin approprié /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
#3- Copier à partir du premier conteneur « build » l’application située dans le dossier 
#/usr/src/app/dist/aston-villa-app vers le dossier de déploiement de nginx
#/usr/share/nginx/html
COPY --from=build /usr/src/app/dist/aston-villa-app /usr/share/nginx/html