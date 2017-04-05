defmodule SwarmTest do
  use Application

  def start(_type, _args) do
    SwarmTest.Supervisor.start_link
  end

end
