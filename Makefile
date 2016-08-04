
all: run

build-crystal:
	crystal build --single-module --link-flags="-fpic -shared" -o lib/hello_world.so src/hello_world.cr

test-elixir:
	mix test

run: build-crystal test-elixir
