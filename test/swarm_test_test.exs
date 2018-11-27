defmodule SwarmTestTest do
  use ExUnit.ClusteredCase
  alias ExUnit.ClusteredCase.Cluster

  @tag timeout: :infinity

  require Logger

  @config [
    nodes: [
      [{:name, "n1"}, {:env, [{"PORT", "6001"}]}, {:boot_timeout, 20_000}, {:capture_log, true}, {:stdout, :standard_io}],
      [{:name, "n2"}, {:env, [{"PORT", "6002"}]}, {:boot_timeout, 20_000}, {:capture_log, true}, {:stdout, :standard_io}],
    ]
  ]

  scenario "cluster test", @config do

    node_setup(:start_apps)

    test "swarm test", %{cluster: c} do
      [_node1, _node2] = Cluster.members(c)
    end
  end

  def start_apps(_context) do
    ensure_swarm_result = Application.ensure_all_started(:swarm)
    Logger.info ">> ensure_swarm_result: #{inspect ensure_swarm_result}"
    ensure_swarm_test_result = Application.ensure_all_started(:swarm_test)
    Logger.info ">> ensure_swarm_test_result: #{inspect ensure_swarm_test_result}"
  end
end
