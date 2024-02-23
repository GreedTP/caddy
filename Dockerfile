FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-git

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY Caddyfile /etc/caddy/Caddyfile
