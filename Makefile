setup: prepare install db-migrate

install:
	npm install

db-migrate:
	npm run migrate

build:
	npm run build

prepare:
	cp -n .env.example .env || true

start:
	NODE_ENV=production npm run start

dev:
	npx concurrently "make start-frontend" "make start-backend"

start-backend:
	npm start -- --watch --verbose-watch --ignore-watch='node_modules .git .sqlite'

start-frontend:
	npx webpack --watch --progress

lint:
	npx eslint .

test:
	npm test -s
