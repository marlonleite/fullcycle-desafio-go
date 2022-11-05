FROM golang:1.18 AS builder
WORKDIR /usr/src/app/
COPY . .
RUN go mod download
RUN go mod verify

FROM golang:1.18-alpine
WORKDIR /usr/src/app/
COPY --from=builder /usr/src/app/ .
CMD ["go", "run", "main.go"]
