FROM semaphoreui/semaphore:latest

ENV PORT=3000

EXPOSE 3000

CMD ["/bin/sh", "-c", "semaphore server --config /etc/semaphore/config.json"]
