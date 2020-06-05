FROM ubuntu:20.04 as builder

RUN apt-get update
RUN apt-get -y -q --no-install-recommends install protobuf-compiler-grpc golang ca-certificates git

# Witch https://github.com/grpc/grpc-go/pull/3453 released, protobuf
# gRPC compiler will bundle Go code generation. Then this won't be
# needed.
RUN go get google.golang.org/grpc/cmd/protoc-gen-go-grpc

FROM ubuntu:20.04
LABEL maintainer=<kuenishi_at_gmail_com>

RUN apt-get update && \
    apt-get -y -q --no-install-recommends install protobuf-compiler-grpc
COPY --from=builder /root/go/bin/protoc-gen-go-grpc /usr/local/bin/

CMD ['protoc', '-h']
