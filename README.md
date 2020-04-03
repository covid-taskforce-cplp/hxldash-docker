# hxldash-docker
**[draft] Unofficial dockerized version of HXLdash (_"Create data visualisations
quickly by leveraging the HXL - Humanitarian eXchange Language"_) for local
development. The hosted version (maintained by British Red Cross) is at
<https://hxldash.com/>**

## Usage

```bash
docker build -t hxldash .
docker run -it --rm --name hxldash-app hxldash -p 8000:8000
```

<!--
docker build -t hxldash . && docker run -it --rm --name hxldash-app hxldash -p 7777:8000
docker build --no-cache -t hxldash . && docker run -it --rm --name hxldash-app hxldash -p 7777:8000
-->