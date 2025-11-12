FROM golang:1.22-alpine

WORKDIR /app

# Instala dependências básicas
RUN apk add --no-cache git bash sqlite

# Instala o Semaphore versão estável (com caminho /v2/)
RUN go install github.com/ansible-semaphore/semaphore/v2/cmd/semaphore@v2.9.45

# Variáveis de ambiente
ENV SEMAPHORE_ADMIN=admin \
    SEMAPHORE_ADMIN_NAME="Admin User" \
    SEMAPHORE_ADMIN_EMAIL="admin@example.com" \
    SEMAPHORE_ADMIN_PASSWORD=admin123 \
    SEMAPHORE_DB=/tmp/semaphore.db \
    SEMAPHORE_CONFIG=/tmp/config.json

# Cria o arquivo de configuração JSON
RUN echo '{ \
  "dialect": "sqlite3", \
  "db": "/tmp/semaphore.db", \
  "port": "3000", \
  "interface": "0.0.0.0", \
  "tmp_path": "/tmp/semaphore_tmp", \
  "cookie_hash": "abc123", \
  "cookie_encryption": "xyz789" \
}' > /tmp/config.json

# Expõe a porta
EXPOSE 3000

# Inicializa o banco e cria usuário admin
CMD bash -c "\
  semaphore migrate --config /tmp/config.json && \
  semaphore user add --login \"$SEMAPHORE_ADMIN\" \
    --name \"$SEMAPHORE_ADMIN_NAME\" \
    --email \"$SEMAPHORE_ADMIN_EMAIL\" \
    --password \"$SEMAPHORE_ADMIN_PASSWORD\" \
    --admin \
    --config /tmp/config.json || true && \
  semaphore server --config /tmp/config.json"
