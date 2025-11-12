FROM semaphoreui/semaphore:latest

# Variáveis de ambiente (serão sobrescritas pelo Render)
ENV SEMAPHORE_DB_DIALECT=postgres \
    SEMAPHORE_ADMIN=admin \
    SEMAPHORE_ADMIN_PASSWORD=admin \
    SEMAPHORE_ADMIN_NAME=Admin \
    SEMAPHORE_ADMIN_EMAIL=alvesmagnocavalcante@gmail.com \
    SEMAPHORE_ACCESS_KEY_ENCRYPTION=gs72mPntFATGJs9qK0pQ0rKtfidlexiMjYCH9gWKhTU= \
    PORT=3000

# Expor porta
EXPOSE 3000

# Comando de inicialização
CMD ["/usr/bin/semaphore", "server", "--config", "/etc/semaphore/config.json"]
