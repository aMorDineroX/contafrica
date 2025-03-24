FROM golang:1.23-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o glance main.go

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/glance /app/glance
COPY --from=builder /app/internal/glance/static /app/static
COPY --from=builder /app/internal/glance/templates /app/templates

RUN mkdir -p /app/config

EXPOSE 8080

# Specify the config path explicitly
CMD ["/app/glance", "--config", "/app/config/glance.yml"]
