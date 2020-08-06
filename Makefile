.PHONY: build push

TAG=0.2

build:
	docker build -t kuenishi/grpc-go:$(TAG) .
push:
	docker push kuenishi/grpc-go:$(TAG)
