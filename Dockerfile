# Usa a imagem oficial do Semaphore
FROM semaphoreui/semaphore:latest

# Define variáveis de ambiente — Render pode sobrescrever
ENV SEMAPHORE_DB_DIALECT=postgres \
    SEMAPHORE_ADMIN=admin \
    SEMAPHORE_ADMIN_PASSWORD=admin \
    SEMAPHORE_ADMIN_NAME=Admin \
    SEMAPHORE_ADMIN_EMAIL=alvesmagnocavalcante@gmail.com \
    SEMAPHORE_ACCESS_KEY_ENCRYPTION=gs72mPntFATGJs9qK0pQ0rKtfidlexiMjYCH9gWKhTU \
    PORT=3000

# Cria diretórios com permissões corretas
RUN mkdir -p /data /tmp/semaphore && \
    chown -R semaphore:semaphore /data /tmp/semaphore

# Define o diretório de trabalho
WORKDIR /tmp/semaphore

# Expor porta do serviço
EXPOSE 3000

# Usa o entrypoint padrão da imagem
# (a imagem oficial já define /usr/bin/semaphore como entrypoint)
CMD ["server"]
