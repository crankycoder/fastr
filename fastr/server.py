from fastr.proto_lib.echo import EchoBase

from grpclib.server import Server
from typing import AsyncIterator

# Just quiet the mypy highlighter
from fastr.proto_lib.echo import EchoResponse, EchoStreamResponse


class EchoService(EchoBase):
    async def echo(self, value: str, extra_times: int) -> "EchoResponse":
        return value

    async def echo_stream(
        self, value: str, extra_times: int
    ) -> AsyncIterator["EchoStreamResponse"]:
        for _ in range(extra_times):
            yield value


async def start_server():
    HOST = "127.0.0.1"
    PORT = 1337
    server = Server([EchoService()])
    await server.start(HOST, PORT)
    await server.serve_forever()
