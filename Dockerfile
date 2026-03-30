FROM node:18-alpine

RUN apk --no-cache add procps
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
