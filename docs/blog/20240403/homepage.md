# homepage

[git](https://github.com/gethomepage/homepage)


## docker-compose

```yaml
version: "3.3"
services:
  homepage:
    image: ghcr.io/gethomepage/homepage:latest
    container_name: homepage
    environment:
      PUID: 1000 #-- optional, your user id
      PGID: 1000 #-- optional, your group id
    ports:
      - 80:3000
    volumes:
      - ./config:/app/config # Make sure your local config directory exists
      - /var/run/docker.sock:/var/run/docker.sock:ro # optional, for docker integrations
    restart: unless-stopped
```

## config/service

```yaml
---
# For configuration options and examples, please see:
# https://gethomepage.dev/latest/configs/services

- Media:
    - Jellyfin:
        icon: jellyfin.png
        href: http://192.168.0.35:8096/web/index.html#!/home.html
        description: Media center

- Téléchargement:
    - QbitTorrent:
        icon: qbittorrent.png
        href: http://192.168.0.35:9091/
        description: Client torrent

- Documentations:
    - Docs linux:
        icon: mkdocs.png
        href: http://192.168.0.35:8800/
        description: Mkdocs container for markdown linux documentation
```

## services customization
