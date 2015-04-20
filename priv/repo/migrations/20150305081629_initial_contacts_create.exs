defmodule Kukariri.Repo.Migrations.InitialContactsCreate do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :lastname, :string, null: false
      add :firstname, :string, null: false
      add :email, :string, null: false
      add :tel_home, :string
      add :tel_mobile, :string
      add :address, :string
      add :country, :string, null: false
      add :user_id, references(:users)
    end
  end
end
