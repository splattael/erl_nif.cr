
all: run

build-crystal:
	crystal build --single-module -d --link-flags="-fPIC -shared" -o lib/hello_world.so src/hello_world.cr

clean:
	rm -f lib/*.so

test-elixir:
	mix test

run: build-crystal test-elixir
