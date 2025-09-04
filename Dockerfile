FROM node:20-alpine
        WORKDIR /app
        COPY package*.json ./
        RUN npm install --production
        COPY scripts/sendWeeklyReports.js ./scripts/sendWeeklyReports.js
        COPY db/supabase.js ./db/supabase.js
        COPY services/emailService.js ./services/emailService.js
        RUN chmod +x ./scripts/sendWeeklyReports.js
        CMD ["node", "./scripts/sendWeeklyReports.js"]