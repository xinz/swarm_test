defmodule SwarmTest.Worker do
  use GenServer
  require Logger

  def start_link(name) do
    GenServer.start_link(__MODULE__, [name])
  end

  def init([name]) do
    {:ok, name}
  end

  def handle_call({:swarm, :begin_handoff}, _from, name) do
    Logger.info(">>>> begin_handoff <<<<")
    {:reply, {:resume, name}, name}
    #{:reply, :restart, name}
  end

  def handle_cast({:swarm, :end_handoff, name}, name) do
    Logger.info(">>>> end_handoff <<<<")
    {:noreply, name}
  end

  def handle_info({:swarm, :die}, state) do
    Logger.info(">>>> die <<<<")
    {:stop, :shutdown, state}
  end

end
