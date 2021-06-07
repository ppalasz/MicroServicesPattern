@echo -------- rebuilding docker compose

docker-compose -f .\docker-compose.yml -f .\docker-compose.override.yml up -d --build

docker ps

@echo -------- wait a sec
@timeout 5

@set url=http://localhost:8000/swagger

@echo -------- opening %url%

@start "" %url%


@set url=http://localhost:3000

@echo -------- opening %url%

@start "" %url%


@pause
