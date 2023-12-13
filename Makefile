all: 
	mkdir -p /home/jlarue/data/mariadb
	mkdir -p /home/jlarue/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	docker container stop nginx mariadb wordpress
	docker network rm inception

fclean: clean
	@sudo rm -rf /home/jlarue/data/mariadb/*
	@sudo rm -rf /home/jlarue/data/wordpress/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean