FROM node:lts-alpine
WORKDIR /app

EXPOSE 8080

# Install curl
RUN apk --no-cache add curl

# Copy package and source
COPY package.json package-lock.json ./
RUN npm install

# Copy openapi spec
RUN curl -vvv https://pbs.puzzle.ch/api/openapi.yaml > hitobito.yml

COPY entrypoint.sh /app/entrypoint.sh

ENTRYPOINT ["/bin/sh", "-c", "/app/entrypoint.sh"]
