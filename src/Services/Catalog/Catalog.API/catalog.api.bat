
@set imageName=mongo
@set containerName=shopping-mongo
@set portNr=27017

@echo -------- Build image %imageName% ...

@docker build -t %imageName% -f Dockerfile  .

@echo -------- Delete old container %containerName% ...
@docker rm -f %containerName%

@echo -------- Run new container %containerName% of image %imageName% on port %portNr% ...
@docker run -d -p %portNr%:%portNr% --name %containerName% %imageName%

@docker ps

@echo -------- Wait a sec
@timeout 5

@set url=http://localhost:%portNr%/

@echo -------- Opening url %url%

@start "" %url%

@pause