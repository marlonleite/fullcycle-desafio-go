FROM golang:1.18-alpine AS builder
RUN apk update && apk add --no-cache git
WORKDIR /usr/src/app/
COPY . .
RUN go get -d -v
RUN go build -o /usr/src/app/main

FROM scratch
COPY --from=builder /usr/src/app/main /usr/src/app/main
ENTRYPOINT ["/usr/src/app/main"]
