FROM golang:1.18-alpine

WORKDIR /usr/src/app/

COPY . .

RUN go mod download
RUN go mod verify

ENTRYPOINT ["go", "run", "main.go"]
