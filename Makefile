.PHONY: protolib

all: protolib

protolib:
	 # deprecate betterproto because i can't actually spin up a
	 # service
	 #python -m grpc_tools.protoc -I protos --python_betterproto_out=fastr/proto_lib echo_svc.proto
	 #python -m grpc_tools.protoc -I protos --python_betterproto_out=fastr/proto_lib example.proto

	 # TODO: the output directories cause problems here because
	 # grpclib doesn't seem to let you namespace libraries.
	 # why are you even looking here?  I haven't cleaned anything up
	 # yet
	 python -m grpc_tools.protoc -I protos --python_out=fastr/proto_lib --grpc_python_out=fastr/proto_lib helloworld.proto
	 python -m grpc_tools.protoc -I protos --python_out=fastr/proto_lib --grpc_python_out=fastr/proto_lib echo_svc.proto
	 python -m grpc_tools.protoc -I protos --python_out=fastr/proto_lib --grpc_python_out=fastr/proto_lib example.proto

loadtest:
	ghz -n 2000 -c 10 --insecure --proto ./protos/helloworld.proto --call helloworld.Greeter.SayHello -d '{"name":"vng"}' 0.0.0.0:50051
