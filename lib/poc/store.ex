defmodule Poc.Store do
  @moduledoc false

  use Ecto.Schema

  schema "store" do
    field(:name, :string)
    has_many(:customer, Poc.Customer)
  end
end
