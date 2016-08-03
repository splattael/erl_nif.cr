
all: run

build:
	crystal build --single-module --link-flags="-fpic -shared" -o hello_world.so src/hello_world.cr

run: build
	iex -r hello_world.ex
