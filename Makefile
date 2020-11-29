all: build tag push

build:
	docker build -t solo-service:$(BUILD_ID) .

run:
	docker run -it --rm -d -p 15000:80 --name solo-service solo-service

open:
	open http://localhost:15000

tag:
	docker tag solo-service:latest 264318998405.dkr.ecr.us-west-2.amazonaws.com/solo-service:$(BUILD_ID)

push:
	docker push 264318998405.dkr.ecr.us-west-2.amazonaws.com/solo-service:$(BUILD_ID)

