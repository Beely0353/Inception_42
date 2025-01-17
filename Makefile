all : up

up : 
	@sudo mkdir -p /home/biaroun/data/mariadb
	@sudo mkdir -p /home/biaroun/data/wordpress
	@sudo chmod 777 /home/biaroun/data/wordpress
	@sudo chmod 777 /home/biaroun/data/mariadb
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

down :
	docker compose -f ./srcs/docker-compose.yml down -v

re:
	@docker compose -f scrs/docker-compose.yml up -d --build

status : 
	@echo "\033[1;32mDOCKER:\033[0m"
	@sudo docker ps
	@echo "\n\033[1;32mNETWORK:\033[0m"
	@sudo docker network ls
	@echo "\n\033[1;32mIMAGES:\033[0m"
	@sudo docker images

clear :

	@sudo rm -fr /home/biaroun/data/mariadb
	@sudo rm -fr /home/biaroun/data/wordpress
	@sudo docker system prune -a --volumes
	@sudo docker volume rm srcs_mariadb
	@sudo docker volume rm srcs_wordpress

clean :
	@sudo docker stop $$(docker ps -qa)
	@sudo docker rm $$(docker ps -qa)
	@sudo docker network prune -f
	@sudo docker rmi $(docker images -q)
