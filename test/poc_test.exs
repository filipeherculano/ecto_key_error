defmodule PocTest do
  use Poc.RepoCase, async: false

  alias Poc.Store
  alias Poc.Customer
  alias Poc.Repo

  test "smoke" do
    nash = %Store{name: "Nash Cookies"}

    assert {:ok, _} = Repo.insert(nash)

    adrien = %Customer{name: "Adrien"}
    filipe = %Customer{name: "Filipe"}
    jan = %Customer{name: "Jan"}

    assert {:ok, _} = Ecto.build_assoc(nash, :customer, adrien) |> Repo.insert()
    assert {:ok, _} = Ecto.build_assoc(nash, :customer, filipe) |> Repo.insert()
    assert {:ok, _} = Ecto.build_assoc(nash, :customer, jan) |> Repo.insert()

    Repo.all(Store)
    Repo.all(Customer)

    Repo.delete_all(Customer)
    Repo.delete_all(Store)

    Repo.all(Store)
    Repo.all(Customer)

    customers = [adrien, filipe, jan]

    # Should be ConstraintError{} since assoc is not present
    assert_raise(KeyError, fn ->
      customers
      |> Enum.map(&Map.delete(&1, :id))
      |> Enum.map(&Repo.insert!/1)
    end)
  end
end
