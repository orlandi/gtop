#FROM node:18-alpine
FROM node:18-bookworm-slim

#RUN apk --no-cache add procps

RUN apt-get update && \
    apt-get install -y procps && \
    rm -rf /var/lib/apt/list

ENV LANG=en_US.utf8 \
    TERM=xterm-256color

WORKDIR /app

COPY lib lib
COPY bin bin
COPY package.json .
COPY package-lock.json .

#RUN npm install --production
RUN npm ci --omit=dev
ENTRYPOINT ["./bin/gtop"]
