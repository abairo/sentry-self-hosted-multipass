up:
	docker-compose -f src/docker-compose.yaml up -d

restart:
	docker-compose -f src/docker-compose.yaml stop && make up