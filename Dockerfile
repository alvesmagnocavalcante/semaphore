FROM semaphoreui/semaphore:latest

ENV SEMAPHORE_DB_DIALECT=sqlite3 \
    SEMAPHORE_DB_PATH=/tmp/semaphore.db \
    SEMAPHORE_ADMIN=admin \
    SEMAPHORE_ADMIN_PASSWORD=admin \
    SEMAPHORE_ADMIN_NAME=Admin \
    SEMAPHORE_ADMIN_EMAIL=alvesmagnocavalcante@gmail.com \
    SEMAPHORE_ACCESS_KEY_ENCRYPTION=gs72mPntFATGJs9qK0pQ0rKtfidlexiMjYCH9gWKhTU

WORKDIR /tmp/semaphore
EXPOSE 3000
CMD ["sh", "-c", "semaphore server --port ${PORT:-3000}"]
