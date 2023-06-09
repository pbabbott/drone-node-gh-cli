ARG BASE_IMAGE="node:16"
FROM ${BASE_IMAGE}

# Install GH CLI
RUN type -p curl >/dev/null || (apt update && apt install curl -y)
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && apt update \
  && apt install gh -y

# Install Docker CLI
ENV DOCKER_HOST=unix:///var/run/docker.sock
RUN curl -fsSL https://get.docker.com -o get-docker.sh \
  && sh get-docker.sh

# Install NX
RUN npm install --global nx@latest
