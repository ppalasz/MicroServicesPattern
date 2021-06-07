@echo -------- stoping docker compose

docker-compose -f .\docker-compose.yml -f .\docker-compose.override.yml down 


@pause
