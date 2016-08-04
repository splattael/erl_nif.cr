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
end
