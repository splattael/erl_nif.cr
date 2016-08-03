defmodule HelloWorld do
  @on_load :init

  def init() do
    :ok = :erlang.load_nif("./hello_world", 0)
  end

  def from_crystal do
  end
end

HelloWorld.from_crystal
