FROM debian:sid
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y --no-install-recommends tiled xvfb xauth && \
    rm -rf /var/cache/apt/archives
WORKDIR /workdir
CMD xvfb-run find /workdir -name "*.tmx" -exec sh -c 'tiled --export-map json "{}" "$(echo {} | cut -f1 -d.).json" && tmxrasterizer "{}" "$(echo {} | cut -f1 -d.).png"' \;
