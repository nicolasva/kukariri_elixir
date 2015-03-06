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
    [{:phoenix, nil, [git: "git://github.com/phoenixframework/phoenix.git"]},
     {:cowboy, "~> 1.0"},
     {:postgrex, "~> 0.6.0"},
     {:ecto, "~> 0.2.5"},
     {:sass_elixir, "~> 0.0.1"},
     {:phoenix_haml, github: "chrismccord/phoenix_haml"}
    ]
  end
end
