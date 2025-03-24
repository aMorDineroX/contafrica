FROM golang:1.23-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o contafrica main.go

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/contafrica /app/contafrica
COPY --from=builder /app/internal/glance/static /app/static
COPY --from=builder /app/internal/glance/templates /app/templates

RUN mkdir -p /app/config

EXPOSE 8080

# Specify the config path explicitly
CMD ["/app/contafrica", "--config", "/app/config/config.yml"]
