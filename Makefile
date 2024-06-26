all : up

up : 
	docker-compose -f ./srcs/docker-compose.yml up -d

down :
	docker-compose -f ./srcs/docker-compose.yml down -v

re:
	@docker compose -f scrs/docker-compose.yml up -d --build

status : 
	@echo "\033[1;32mDOCKER:\033[0m"
	@docker ps
	@echo "\n\033[1;32mNETWORK:\033[0m"
	@docker network ls

clean :
	@docker stop $$(docker ps -qa)
	@docker rm $$(docker ps -qa)
	@docker network prune -f 
