defmodule HelloWorld.Mixfile do
  use Mix.Project

  def project do
    [app: :hello_word,
     version: "0.1.0",
     elixir: "~> 1.3",
     deps: deps()]
  end

  def application do
    []
  end

  defp deps do
    []
  end
end
