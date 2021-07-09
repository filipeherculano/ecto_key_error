defmodule Poc.Customer do
  @moduledoc false

  use Ecto.Schema

  schema "customer" do
    field(:name, :string)
    belongs_to(:store, Poc.Store)
  end
end
