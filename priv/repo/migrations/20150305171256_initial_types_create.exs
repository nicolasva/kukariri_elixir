defmodule Kukariri.Repo.Migrations.InitialTypesCreate do
  use Ecto.Migration

  def change do
    create table(:types) do
      add :descriptif, :string, null: false
      add :item_id, references(:items)
      add :contact_id, references(:contacts)
    end
  end
end
