FROM golang:1.25-alpine AS builder
WORKDIR /app

COPY go.* ./
RUN go mod download
COPY . ./
RUN go mod tidy
RUN go build -v -o spp

FROM debian
COPY --from=builder /app/chisel .
WORKDIR ./
