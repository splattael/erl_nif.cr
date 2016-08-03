defmodule HelloWorld do
  @on_load :init

  def init() do
    :ok = :erlang.load_nif("./hello_world", 0)
  end
end
