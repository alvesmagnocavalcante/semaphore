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

# Cria o config.json manualmente
RUN echo '{
  "dialect": "sqlite3",
  "db": "/tmp/semaphore.db",
  "port": 3000,
  "interface": "0.0.0.0",
  "tmp_path": "/tmp",
  "access_key_encryption": "gs72mPntFATGJs9qK0pQ0rKtfidlexiMjYCH9gWKhTU"
}' > /tmp/config.json

# Comando para criar o admin automaticamente e iniciar o servidor
CMD semaphore user add \
    --admin \
    --login "$SEMAPHORE_ADMIN" \
    --name "$SEMAPHORE_ADMIN_NAME" \
    --email "$SEMAPHORE_ADMIN_EMAIL" \
    --password "$SEMAPHORE_ADMIN_PASSWORD" \
    --config /tmp/config.json || true \
 && semaphore server --config /tmp/config.json
