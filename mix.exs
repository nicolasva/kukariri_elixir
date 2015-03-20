defmodule Kukariri.Mixfile do
  use Mix.Project

  def project do
    [app: :kukariri,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "web"],
     compilers: [:phoenix] ++ Mix.compilers,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Kukariri, []},
     applications: [:phoenix, :cowboy, :logger, :postgrex, :ecto]]
  end

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 0.9.0"},
     {:cowboy, "~> 1.0"},
     {:postgrex, "~> 0.8.0"},
     {:ecto, "~> 0.9.0"},
     {:sass_elixir, "~> 0.0.1"},
     {:inflex, "~> 1.0.0"},
     {:plug, "~> 0.7"},
     {:mogrify, "~> 0.1"}
    ]
  end
end
