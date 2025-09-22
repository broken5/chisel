FROM golang:1.22-alpine AS builder
WORKDIR /app
RUN apk add --no-cache git
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o chisel .
COPY --from=builder /app/chisel .
