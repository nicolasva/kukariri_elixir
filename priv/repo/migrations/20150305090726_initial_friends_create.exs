defmodule Kukariri.Repo.Migrations.InitialFriendsCreate do
  use Ecto.Migration

  def change do
    create table(:friends) do
      add :follow, :boolean, default: false
      add :friend, :boolean, default: false
      add :friend_id, references(:users)
      add :accept_friend, :boolean, default: false
      add :cancel, :boolean, default: false
    end
  end
end
