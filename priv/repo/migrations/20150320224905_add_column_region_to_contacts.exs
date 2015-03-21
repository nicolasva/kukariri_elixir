defmodule Kukariri.Repo.Migrations.AddColumnRegionToContacts do
  use Ecto.Migration

  def change do
    alter table(:contacts) do
      add :region, :string
    end 
  end
end
