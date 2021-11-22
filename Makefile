IMAGE_NAME=jmwhorton/postgres-bkup
.PHONY: push clean

default: build

build: last_built

last_built: Dockerfile
	docker build . -t ${IMAGE_NAME}:0.1.30
	date > last_built

push: last_built
	docker image push ${IMAGE_NAME}:0.1.30

clean:
	rm -f last_built
