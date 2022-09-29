@echo -------- rebuilding docker compose

docker-compose -f .\docker-compose.yml -f .\docker-compose.override.yml up -d --build

docker ps

@echo -------- wait a sec
@timeout 5

REM catalog.api
@set url=http://localhost:8000/swagger

@echo -------- opening %url%

@start "" %url%

REM mongoclient
@set url=http://localhost:3000

@echo -------- opening %url%

@start "" %url%

REM basket.api
@set url=http://localhost:8001/swagger

@echo -------- opening %url%

@start "" %url%


REM portainer
@set url=http://localhost:9000

@echo -------- opening %url%

@start "" %url%

REM pgadmin
@set url=http://localhost:5050/browser/# 

@echo -------- opening %url%

@start "" %url%


REM Discount.API
@set url=http://localhost:8002/swagger

@echo -------- opening %url%

@start "" %url%

@pause
