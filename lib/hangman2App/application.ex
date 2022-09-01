defmodule Hangman2App.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Hangman2AppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hangman2App.PubSub},
      # Start the Endpoint (http/https)
      Hangman2AppWeb.Endpoint
      # Start a worker by calling: Hangman2App.Worker.start_link(arg)
      # {Hangman2App.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hangman2App.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Hangman2AppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
