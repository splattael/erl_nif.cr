defmodule HelloWorld do
  @on_load :init

  def init() do
    :ok = :erlang.load_nif("./lib/hello_world", 0)
  end

  def from_crystal do
  end

  def echo(_x) do
    :error
  end
end
