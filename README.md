# Mettre en place le Studio personnalisé d’Awels

Pour mettre en place le **studio personnalisé d’Awels** (ou tout autre application personnalisée similaire), suivez les étapes générales suivantes pour configurer, exécuter et résoudre les problèmes éventuels.

---

### **Configurer et lancer l’application**

1. **Cloner le dépôt source :**
Téléchargez le projet sur votre machine locale.
    
    ```bash
    git clone https://github.com/ClemsAwels/awelsCustomStudioAG.git ./awelsCustomStudioAG
    cd ./awelsCustomStudioAG
    ```
    
2. **Déployer avec Docker**

Le projet est livré avec un **Dockerfile,** vous pouvez ainsi facilement déployer l’application en utilisant Docker.

1. **Construire l’image Docker :**
    
    ```bash
    docker build -t studio-awels-custom-autogen .
    
    ```
    
2. **Lancer le conteneur :**
    
    ```bash
    docker run -p 8081:8081 studio-awels-custom-autogen
    
    ```
    
3. **Accéder à l’Application**
    - Pour accéder au frontend : `http://localhost:8081`.

---

### 4. **Résoudre les Problèmes**

1. **Logs Docker :**
Si le service ne fonctionne pas, inspectez les journaux :
    
    ```bash
    
    docker ps
    docker logs <container_id>
    ```
    
2. **Tests de Connectivité :**
Testez les points d’accès (exemple `http://localhost:8081`) avec `curl` ou un navigateur.
