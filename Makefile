
build:
	@docker build -t pascal .

run: build
	@docker run --rm  -e HTTP pascal /www/cgi-bin/menu

test:
	@docker build -t pascal:test --target test  .

docker: build
	@docker rm -f menu || true
	@docker run -d --name menu --network=traefik pascal

docker-dev: build
	@docker rm -f menu-dev || true
	@docker run -d --name menu-dev -v $(PWD)/www/index.html:/www/index.html --network=traefik pascal