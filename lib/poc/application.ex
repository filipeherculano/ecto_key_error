defmodule Poc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Poc.Worker.start_link(arg)
      # {Poc.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Poc.Supervisor]
    Supervisor.start_link([{Poc.Repo, []}] ++ children, opts)
  end
end
