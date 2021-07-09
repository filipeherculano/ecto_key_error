defmodule Poc.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Poc.Repo

      import Ecto
      import Ecto.Query
      import Poc.RepoCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Poc.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Poc.Repo, {:shared, self()})
    end

    :ok
  end
end
