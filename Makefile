.PHONY: protolib

all: protolib

protolib:
	 python -m grpc_tools.protoc -I protos --python_betterproto_out=fastr/proto_lib echo_svc.proto
	 python -m grpc_tools.protoc -I protos --python_betterproto_out=fastr/proto_lib example.proto
