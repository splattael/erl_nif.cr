defmodule HelloWorldTest do
  use ExUnit.Case

  test "from_crystal" do
    assert HelloWorld.from_crystal == 'Hi from Crystal'
  end
end
