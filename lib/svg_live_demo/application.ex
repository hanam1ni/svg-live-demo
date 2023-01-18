defmodule SvgLiveDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SvgLiveDemoWeb.Telemetry,
      # Start the Ecto repository
      SvgLiveDemo.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SvgLiveDemo.PubSub},
      # Start Finch
      {Finch, name: SvgLiveDemo.Finch},
      # Start the Endpoint (http/https)
      SvgLiveDemoWeb.Endpoint
      # Start a worker by calling: SvgLiveDemo.Worker.start_link(arg)
      # {SvgLiveDemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SvgLiveDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SvgLiveDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
