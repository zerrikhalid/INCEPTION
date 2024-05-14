all: up

up:
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

start:
	@docker-compose -f ./srcs/docker-compose.yml start

logs:
	@docker-compose -f ./srcs/docker-compose.yml logs -f