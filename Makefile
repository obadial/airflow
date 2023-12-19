up:
	docker-compose -f local/docker-compose.yml up -d

down:
	docker-compose -f local/docker-compose.yml down

re:
	$(MAKE) down
	$(MAKE) up

