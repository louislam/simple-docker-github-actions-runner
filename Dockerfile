FROM node:22-bookworm-slim

RUN apt update && \
  apt install -y \
    liblttng-ust1 \
    libkrb5-3 \
    zlib1g \
    libss2 \
    libicu72 \
    ca-certificates \
    git \
    git-lfs \
    curl \
    wget \
    build-essential \
    inetutils-ping \
    python3 \
    python3-pip

ARG UNAME=github-runner
ARG UID=1001
ARG GID=1001
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
USER $UNAME
WORKDIR /opt/actions-runner
