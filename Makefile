.DEFAULT_GOAL := build

version=0.0.1

.PHONY: build

build: FORCE
	docker build -t mkinney:hello_world_apt --build-arg version=$(version) .
	docker cp $(shell docker create mkinney:hello_world_apt):/root/hello-world_$(version)-1_amd64.deb .

clean:
	docker rmi mkinney:hello_world_apt || true
	docker system prune
	@rm *.deb 2> /dev/null || true

FORCE: ;
