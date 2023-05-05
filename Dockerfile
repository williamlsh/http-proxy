FROM rust:slim AS builder

WORKDIR /app

COPY . .

RUN cargo build -r

FROM debian:bullseye-slim

WORKDIR /app

RUN set -eux; \
      apt-get update; \
      apt-get install -y --no-install-recommends \
      ca-certificates

COPY --from=builder /app/target/release/http-proxy /app/http-proxy

ENTRYPOINT [ "/app/http-proxy" ]
