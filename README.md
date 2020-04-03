# hxldash-docker
[draft] Unofficial dockerized version of HXLdash ("Create data visualisations quickly by leveraging the HXL - Humanitarian eXchange Language") for local development. The hosted version (maintained by British Red Cross) is at https://hxldash.com/

## Usage

```bash
docker build -t hxldash .
docker run -it --rm --name hxldash-app hxldash
```