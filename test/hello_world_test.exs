defmodule HelloWorldTest do
  use ExUnit.Case

  test "from_crystal" do
    assert HelloWorld.from_crystal == 'Hi from Crystal'
  end

  test "echo term" do
    assert HelloWorld.echo(1) == 1
    assert HelloWorld.echo(2) == 2
    assert HelloWorld.echo("binary") == "binary"
    assert HelloWorld.echo('list') == 'list'
  end

  test "upcase" do
    assert_raise ArgumentError, fn ->
      HelloWorld.upcase(23)
    end

    assert HelloWorld.upcase("") == ""
    assert HelloWorld.upcase("a") == "A"
    assert HelloWorld.upcase("b") == "B"
    assert HelloWorld.upcase("ab") == "AB"
    assert HelloWorld.upcase("hello world") == "HELLO WORLD"
    assert HelloWorld.upcase("josé") == "JOSÉ"
  end
end
