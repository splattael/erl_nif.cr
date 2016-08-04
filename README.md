# Erlang NIF in Crystal

:warning: :construction: :warning:

## Usage

    $ make
    crystal build --single-module --link-flags="-fpic -shared" -o lib/hello_world.so src/hello_world.cr
    mix test
    .

    Finished in 0.01 seconds
    1 test, 0 failures

    Randomized with seed 742915


kthxbye
