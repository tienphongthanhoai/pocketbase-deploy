FROM alpine:latest

RUN apk add --no-cache wget unzip

# Download PocketBase
RUN wget -O /tmp/pocketbase.zip https://github.com/pocketbase/pocketbase/releases/download/v0.22.17/pocketbase_0.22.17_linux_amd64.zip

# Extract và cài đặt
RUN unzip /tmp/pocketbase.zip -d /app/ && \
    rm /tmp/pocketbase.zip && \
    chmod +x /app/pocketbase

EXPOSE 8080

CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8080"]
