defmodule Kukariri.Repo.Migrations.CreateTableProvidedDatesBis do
  use Ecto.Migration

  def change do
    create table(:provided_dates) do
      add :date_at, :datetime, default: fragment("now()")
      add :date_to, :datetime, default: fragment("now()")
      add :date_to_activation, :boolean
      add :contact_id, references(:contacts)
      add :item_id, references(:items)
    end
  end
end
