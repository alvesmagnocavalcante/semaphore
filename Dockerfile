FROM semaphoreui/semaphore:latest

ENV SEMAPHORE_DB_DIALECT=sqlite3 \
    SEMAPHORE_DB_PATH=/data/semaphore.db \
    SEMAPHORE_ADMIN=admin \
    SEMAPHORE_ADMIN_PASSWORD=changeme \
    SEMAPHORE_ADMIN_NAME=Admin \
    SEMAPHORE_ADMIN_EMAIL=admin@localhost \
    SEMAPHORE_ACCESS_KEY_ENCRYPTION=gs72mPntFATGJs9qK0pQ0rKtfidlexiMjYCH9gWKhTU \
    PORT=3000

WORKDIR /data
EXPOSE 3000

# Cria o diretório e o arquivo de configuração antes de iniciar
CMD bash -c "\
  mkdir -p /data && \
  echo '{ \
    \"dialect\": \"sqlite3\", \
    \"db\": \"/data/semaphore.db\", \
    \"interface\": \"0.0.0.0\", \
    \"port\": 3000, \
    \"cookie_hash\": \"abc123\", \
    \"cookie_encryption\": \"xyz789\", \
    \"tmp_path\": \"/tmp\" \
  }' > /data/config.json && \
  semaphore migrate --config /data/config.json && \
  semaphore user add --admin \
    --login \"$SEMAPHORE_ADMIN\" \
    --name \"$SEMAPHORE_ADMIN_NAME\" \
    --email \"$SEMAPHORE_ADMIN_EMAIL\" \
    --password \"$SEMAPHORE_ADMIN_PASSWORD\" \
    --config /data/config.json || true && \
  semaphore server --config /data/config.json"
