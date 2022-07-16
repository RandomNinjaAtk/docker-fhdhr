# Deprecated

This repository is now deprecated, will no longer be updated and is being set to archived.

# [RandomNinjaAtk/fHDHR](https://github.com/RandomNinjaAtk/docker-fhdhr)

[fHDHR](https://github.com/fHDHR/fHDHR) - This application is a Python service provides an interface to take various sources of video and make them accessible to client software, such as Plex Media Server (PMS) or Emby by acting like a HDHomerun or an m3u Tuner and an XMLTV provider.

[![fHDHR](https://raw.githubusercontent.com/RandomNinjaAtk/unraid-templates/master/randomninjaatk/img/fhdhr.png)](https://github.com/fHDHR/fHDHR)

## Supported Architectures

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |

## Version Tags

| Tag | Description |
| :----: | --- |
| latest | LSIO Ubuntu Focal + Python, FFMEPG & fHDHR |

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| ---- | --- |
| `-p 5004` | The port for the fHDHR webinterface |
| `-v /config` | Configuration files for fHDHR. |
| `-e ORIGIN_PLUGINS=plugin,plugin` | Example: locast,plutotv (this is a ',' separated list plugin names) |
| `-e INTERFACE_PLUGINS=plugin,plugin` | Example: hdhr  (this is a ', ' separated list plugin names) |
| `-e STREAM_PLUGINS=plugin,plugin` | Example: vlc (this is a ', ' separated list plugin names) |
| `-e EPG_PLUGINS=plugin,plugin` | Example: zap2it  (this is a ', ' separated list plugin names) |

### docker

```
docker create \
  --name=fHDHR \
  --network bridge \
  -p 5004
  -v /path/to/config/files:/config \
  -e ORIGIN_PLUGINS=plugin,plugin \
  -e INTERFACE_PLUGINS=plugin,plugin \
  -e STREAM_PLUGINS=plugin,plugin \
  -e EPG_PLUGINS=plugin,plugin \
  randomninjaatk/fhdhr 
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
version: "2.1"
services:
  fHDHR:
    image: randomninjaatk/fhdhr
    container_name: fHDHR
    network: bridge
    ports:
      - "5004:5004"
    volumes:
      - /path/to/config/files:/config
    environment:
      - ORIGIN_PLUGINS=plugin,plugin\
      - INTERFACE_PLUGINS=plugin,plugin\
      - STREAM_PLUGINS=plugin,plugin\
      - EPG_PLUGINS=plugin,plugin\
    restart: unless-stopped
```

## Application Setup

Access the webui at `<your-ip>:5004`, for more information check out [fHDHR](https://github.com/fHDHR/fHDHR).

<br />
<br />
<br />

# Credits
- [ffmpeg](https://ffmpeg.org/)
- [fHDHR](https://github.com/fHDHR/fHDHR)
