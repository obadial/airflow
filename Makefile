up:
	docker compose -f local/docker-compose.yaml up -d --build

down:
	docker compose -f local/docker-compose.yaml down -v

re:
	$(MAKE) down
	$(MAKE) up
