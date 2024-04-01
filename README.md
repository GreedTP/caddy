# Custom Caddy image
![Docker Image Version](https://img.shields.io/docker/v/greedtp/caddy) ![Docker Pulls](https://img.shields.io/docker/pulls/greedtp/caddy) ![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/GreedTP/caddy/publish-docker-image.yml)

This is a custom [caddy docker image](https://hub.docker.com/r/greedtp/caddy) with the [caddy-git](https://github.com/greenpau/caddy-git) module integrated. You can host your own static website which pulls the files directly from your Git repo.
## Usage
```yaml
version: "3.9"

services:
  caddy:
    image: greedtp/caddy:latest
    restart: unless-stopped
    volumes:
      - caddy_data:/data
      - caddy_config:/config
    environment:
      - REPO_NAME=[repository-name] # e.g. caddy
      - REPO_URL=[repository-url] # e.g. https://github.com/GreedTP/caddy.git
      - SITE_PATH=[path-to-site-index] # optional e.g. /site

volumes:
  caddy_data:
  caddy_config:
```
The cloning of the repository happens on startup. Additionally, the cloning happens when /update is being hit.
```
curl https://mywebsite.com/update
```
## Source
https://github.com/GreedTP/caddy
