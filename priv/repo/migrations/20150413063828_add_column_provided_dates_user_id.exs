defmodule Kukariri.Repo.Migrations.AddColumnProvidedDatesUserId do
  use Ecto.Migration

  def change do
    alter table(:provided_dates) do
      add :user_id, references(:users)
    end
    create index(:provided_dates, [:user_id], name: :provided_date_to_users)
  end
end
