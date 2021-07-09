defmodule Poc.Repo.Migrations.CreateCustomer do
  use Ecto.Migration

  def change do
    create table(:customer) do
      add(:name, :string, null: false)
      add(:store_id, references(:store))
    end
  end
end
