FROM semaphoreui/semaphore:latest

ENV SEMAPHORE_DB_DIALECT=sqlite3 \
    SEMAPHORE_DB_PATH=/tmp/semaphore.db \
    SEMAPHORE_ADMIN=admin \
    SEMAPHORE_ADMIN_PASSWORD=admin \
    SEMAPHORE_ADMIN_NAME=Admin \
    SEMAPHORE_ADMIN_EMAIL=alvesmagnocavalcante@gmail.com \
    SEMAPHORE_ACCESS_KEY_ENCRYPTION=gs72mPntFATGJs9qK0pQ0rKtfidlexiMjYCH9gWKhTU \
    PORT=3000

WORKDIR /tmp/semaphore
EXPOSE 3000

# Cria o arquivo de configuração automaticamente
RUN semaphore setup --config /tmp/config.json --admin admin --email alvesmagnocavalcante@gmail.com --name Admin --login admin --password admin --tmpdir /tmp --db sqlite3 --db-path /tmp/semaphore.db --access-key-encryption gs72mPntFATGJs9qK0pQ0rKtfidlexiMjYCH9gWKhTU

# Inicia o servidor com o config.json gerado
CMD ["semaphore", "server", "--config", "/tmp/config.json"]
