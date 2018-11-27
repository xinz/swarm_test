defmodule SwarmTest.Mixfile do
  use Mix.Project

  def project do
    [app: :swarm_test,
     version: "0.1.0",
     elixir: "~> 1.7",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger],
     mod: {SwarmTest, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:libcluster, "~> 3.0"},
      {:swarm, github: "bitwalker/swarm", ref: "738decb"},
      {:ex_unit_clustered_case, github: "xinz/ex_unit_clustered_case", only: :test},
    ]
  end

end
