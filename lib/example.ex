defmodule SwarmTest.Example do

  def start_worker(name) do
    {:ok, pid} = Swarm.register_name(name, SwarmTest.Supervisor, :register, [name])
    Swarm.join(:foo, pid)
  end
  
  def get_worker(name), do: Swarm.whereis_name(name)

  def get_foos(), do: Swarm.members(:foo)

end
