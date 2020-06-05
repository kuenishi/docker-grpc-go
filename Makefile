.PHONY: build push

build:
	docker build -t kuenishi/grpc-go .
push:
	docker push kuenishi/grpc-go
