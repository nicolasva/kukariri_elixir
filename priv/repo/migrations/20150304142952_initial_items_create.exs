defmodule Kukariri.Repo.Migrations.InitialItemsCreate do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :title, :string, null: false
      add :user_id, references(:users)
    end
  end

end
