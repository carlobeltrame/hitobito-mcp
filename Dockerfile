FROM node:lts-alpine
WORKDIR /app

EXPOSE 8080
ENV FASTMCP_HOST=0.0.0.0

# Install curl
RUN apk --no-cache add curl

COPY . ./
RUN npm install

# Download openapi spec
RUN curl https://pbs.puzzle.ch/api/openapi.yaml > hitobito.yml
RUN touch .env
RUN chmod a+w .env

ENTRYPOINT ["/bin/sh", "-c", "/app/entrypoint.sh"]
