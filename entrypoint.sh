echo "HITOBITO_API_KEY=$HITOBITO_API_KEY" > .env

node node_modules/.bin/specbridge --transport httpStream --port 8080 $@