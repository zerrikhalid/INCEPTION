all : up

up :
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

down :
	@docker-compose -f ./srcs/docker-compose.yml down

stop :
	@docker-compose -f ./srcs/docker-compose.yml stop

start :
	@docker-compose -f ./srcs/docker-compose.yml start

logs :
	@docker-compose -f ./srcs/docker-compose.yml logs -f
fclean :
	docker stop $(docker ps -a); docker rm $(docker ps -a); docker rmi -f $(docker images -a); docker volume rm $(docker volume ls); docker network rm $(docker network ls) 2>/dev/null

volume :
	sudo rm -rf /home/kzerri/data/wordpress/* /home/kzerri/data/mariadb/*