FROM semaphoreui/semaphore:latest

# (opcional) Troca pra root se precisar criar diretórios
USER root
RUN mkdir -p /data /tmp/semaphore || true
USER semaphore

# Variáveis de ambiente
ENV SEMAPHORE_DB_DIALECT=postgres \
    SEMAPHORE_ADMIN=admin \
    SEMAPHORE_ADMIN_PASSWORD=admin \
    SEMAPHORE_ADMIN_NAME=Admin \
    SEMAPHORE_ADMIN_EMAIL=alvesmagnocavalcante@gmail.com \
    SEMAPHORE_ACCESS_KEY_ENCRYPTION=gs72mPntFATGJs9qK0pQ0rKtfidlexiMjYCH9gWKhTU \
    PORT=3000

# Expor porta
EXPOSE 3000

# Diretório de trabalho
WORKDIR /tmp/semaphore

# Comando correto — usa o binário real do Semaphore
CMD ["/usr/bin/semaphore", "server", "--config", "/etc/semaphore/config.json"]
