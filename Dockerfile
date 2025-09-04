# Utiliser une image de base Node.js légère
     FROM node:20-alpine
     
     # Définir le répertoire de travail
     WORKDIR /app
     
     # Copier package.json et package-lock.json pour installer les dépendances
     COPY package*.json ./
     
    # Installer les dépendances
    RUN npm install --production
    
    # Copier le run.sh script dans le répertoire de travail
    COPY run.sh .
    
    # Copier le script Node.js et ses dépendances
    COPY scripts/sendWeeklyReports.js ./scripts/sendWeeklyReports.js
    COPY db/supabase.js ./db/supabase.js
    COPY services/emailService.js ./services/emailService.js
    
    # Rendre le script exécutable (bien que Node le gère)
    RUN chmod +x ./scripts/sendWeeklyReports.js
    
    # Définir la commande par défaut à exécuter
    CMD ["node", "./scripts/sendWeeklyReports.js"]
