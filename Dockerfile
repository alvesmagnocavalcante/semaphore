FROM semaphoreui/semaphore:latest

ENV SEMAPHORE_DB_DIALECT=bolt \
    SEMAPHORE_ADMIN=admin \
    SEMAPHORE_ADMIN_PASSWORD=admin \
    SEMAPHORE_ADMIN_NAME=Admin \
    SEMAPHORE_ADMIN_EMAIL=admin@localhost \
    PORT=3000

EXPOSE 3000

CMD ["semaphore", "server"]
