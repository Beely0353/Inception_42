all : up

up : 
	sudo mkdir -p /home/biaroun/data/mariadb
	sudo mkdir -p /home/biaroun/data/wordpress
	sudo chmod 777 /home/biaroun/data/wordpress
	sudo chmod 777 /home/biaroun/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up -d

down :
	docker compose -f ./srcs/docker-compose.yml down -v

re:
	@docker compose -f scrs/docker-compose.yml up -d --build

status : 
	@echo "\033[1;32mDOCKER:\033[0m"
	@docker ps
	@echo "\n\033[1;32mNETWORK:\033[0m"
	@docker network ls
	@echo "\n\033[1;32mIMAGES:\033[0m"
	@docker images

clear :
	sudo rm -fr /home/biaroun/data/mariadb
	sudo rm -fr /home/biaroun/data/wordpress
	@docker system prune -a --volumes
	@docker volume rm $(docker volume ls -q)

clean :
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker network prune -f
	@docker rmi $(docker images -q)
