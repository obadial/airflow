up:
	docker compose -f local/docker-compose.yml up -d --build

down:
	docker compose -f local/docker-compose.yml down -v

re:
	$(MAKE) down
	$(MAKE) up
