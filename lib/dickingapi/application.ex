defmodule Dickingapi.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DickingapiWeb.Telemetry,
      {Phoenix.PubSub, name: Dickingapi.PubSub},
      DickingapiWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Dickingapi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    DickingapiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
