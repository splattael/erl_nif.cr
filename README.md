# Erlang NIF in Crystal

:warning: :construction: :warning:

## Usage

    $ make
    crystal build --single-module --link-flags="-fpic -shared" -o hello_world.so src/hello_world.cr
    iex -r hello_world.exs -e "IO.inspect HelloWorld.from_crystal"
    Erlang/OTP 19 [erts-8.0] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false]

    'Hi from Crystal 0.18.7'
    Interactive Elixir (1.3.1) - press Ctrl+C to exit (type h() ENTER for help)
    iex(1)> HelloWorld.from_crystal

kthxbye
