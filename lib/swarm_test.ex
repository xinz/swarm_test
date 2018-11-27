defmodule SwarmTest do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    topologies = Application.get_env(:libcluster, :topologies)

    children = [
      {Cluster.Supervisor, [topologies, [name: XWeChatHub.ClusterSupervisor]]},
      supervisor(SwarmTest.Worker.Supervisor, []),
    ]

    opts = [strategy: :one_for_one, name: SwarmTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
