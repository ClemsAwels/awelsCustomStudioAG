# Étape 1 : Utiliser une image de base Node.js pour construire le projet (frontend + backend)
FROM node:18 AS build

# Définir le répertoire de travail
WORKDIR /app

# Mise à jour des paquets et installation de rsync, Python, pip et venv
RUN apt-get update && apt-get install -y \
    rsync \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Créer un environnement virtuel pour Python
RUN python3 -m venv /venv

# Activer l'environnement virtuel
ENV PATH="/venv/bin:$PATH"

# Copier tout le projet dans le conteneur
COPY . .

# Installer les dépendances Python dans l'environnement virtuel
RUN pip install --upgrade pip
RUN pip install -e .

# Passer au répertoire frontend pour installer et construire le frontend
WORKDIR /app/frontend
RUN npm install -g gatsby-cli
RUN yarn install
RUN yarn build

# Exposer les ports nécessaires
EXPOSE 8081 

# Commande pour démarrer le backend et le serveur frontend
CMD ["autogenstudio", "ui", "--port", "8081", "--host", "0.0.0.0"]
