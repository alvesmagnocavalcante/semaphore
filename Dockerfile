FROM semaphoreui/semaphore:latest

ENV SEMAPHORE_DB_DIALECT=postgres \
    SEMAPHORE_ADMIN=admin \
    SEMAPHORE_ADMIN_PASSWORD=admin \
    SEMAPHORE_ADMIN_NAME=Admin \
    SEMAPHORE_ADMIN_EMAIL=alvesmagnocavalcante@gmail.com \
    SEMAPHORE_ACCESS_KEY_ENCRYPTION=gs72mPntFATGJs9qK0pQ0rKtfidlexiMjYCH9gWKhTU \
    PORT=3000

EXPOSE 3000

# Use o comando padrão da imagem – se a imagem já define o entrypoint/cmd correto
