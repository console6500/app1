BUILD_ID=$(shell git rev-parse HEAD)

all: login build tag push

login:
	aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 264318998405.dkr.ecr.us-west-2.amazonaws.com

build:
	docker build -t app1:$(BUILD_ID) .

run:
	docker run -it --rm -d -p 15000:80 --name app1 app1

open:
	open http://localhost:15000

tag:
	docker tag app1:latest 264318998405.dkr.ecr.us-west-2.amazonaws.com/app1:$(BUILD_ID)

push:
	docker push 264318998405.dkr.ecr.us-west-2.amazonaws.com/app1:$(BUILD_ID)

