# jellyfin as container

[doc](https://jellyfin.org/docs/general/installation/container/)

## docker-compose

```yaml
version: "3.3"
services:
  jellyfin:
    image: jellyfin/jellyfin
    container_name: jellyfin
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Paris
    volumes:
      - ./config:/config
      - ./cache:/cache
      - ./media:/media
    ports:
      - 8096:8096
      - 8920:8920
    restart: unless-stopped
```