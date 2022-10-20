# HTTP Proxy

> A modified and usable version of https://github.com/hyperium/hyper/blob/master/examples/http_proxy.rs.

Efficient HTTP proxy server in pure rust with minimum dependencies.

## Build binary

```sh
$ cargo build -r
```

## Run proxy

```sh
$ ./target/release/http-proxy 127.0.0.1 1800
Listening on http://127.0.0.1:1800
```
