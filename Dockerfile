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

# Executa o setup e depois inicia o servidor
CMD semaphore setup \
    --config /tmp/config.json \
    --admin "$SEMAPHORE_ADMIN" \
    --email "$SEMAPHORE_ADMIN_EMAIL" \
    --name "$SEMAPHORE_ADMIN_NAME" \
    --login "$SEMAPHORE_ADMIN" \
    --password "$SEMAPHORE_ADMIN_PASSWORD" \
    --tmpdir /tmp \
    --db "$SEMAPHORE_DB_DIALECT" \
    --db-path "$SEMAPHORE_DB_PATH" \
    --access-key-encryption "$SEMAPHORE_ACCESS_KEY_ENCRYPTION" \
 && semaphore server --config /tmp/config.json
