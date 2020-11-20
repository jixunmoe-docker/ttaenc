FROM debian:buster-20201117

RUN apt-get update && apt-get install -y \
  build-essential \
  wget \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /workspace /scripts
WORKDIR /workspace

CMD ["/scripts/build.sh"]
