BUILD_ID = $(shell git rev-parse HEAD)
PROJECTS = service

all: login build tag push

login:
	aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 264318998405.dkr.ecr.us-west-2.amazonaws.com

build:
	docker build -t snoh-aalegra:$(BUILD_ID) .

run:
	docker run -it --rm -d -p 15000:80 --name snoh-aalegra snoh-aalegra

open:
	open http://localhost:15000

tag:
	$(foreach project, $(PROJECTS), docker tag snoh-aalegra:$(BUILD_ID) 264318998405.dkr.ecr.us-west-2.amazonaws.com/$(project):current;)
	$(foreach project, $(PROJECTS), docker tag snoh-aalegra:$(BUILD_ID) 264318998405.dkr.ecr.us-west-2.amazonaws.com/$(project):$(BUILD_ID);)

push:
	$(foreach project, $(PROJECTS), docker push 264318998405.dkr.ecr.us-west-2.amazonaws.com/$(project);)

blue green json:
	cp index.$@.html index.html
	git add .
	git commit -m "Deploy $@"
	git push

