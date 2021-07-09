defmodule Poc.Repo.Migrations.CreateStore do
  use Ecto.Migration

  def change do
    create table(:store) do
      add(:name, :string, null: false)
    end
  end
end
