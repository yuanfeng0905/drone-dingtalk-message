FROM docker.io/golang:alpine AS builder
WORKDIR /go/src/drone-dingtalk-message/
ADD . .
RUN go build .

FROM alpine:latest

RUN apk update && \
  apk add \
    ca-certificates && \
  rm -rf /var/cache/apk/*

COPY --from=builder /go/src/drone-dingtalk-message/drone-dingtalk-message /bin/
ENTRYPOINT ["/bin/drone-dingtalk-message"]