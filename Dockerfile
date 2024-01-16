FROM rust:slim AS builder

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    pkg-config \
    libssl-dev \
    libclang-dev \
    build-essential

WORKDIR /app

COPY . .

RUN cargo build -r

FROM debian:12-slim

WORKDIR /app

RUN set -eux; \
      apt-get update; \
      apt-get install -y --no-install-recommends \
      ca-certificates

COPY --from=builder /app/target/release/http-proxy /app/http-proxy

ENTRYPOINT [ "/app/http-proxy" ]
