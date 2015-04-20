defmodule Kukariri.Repo.Migrations.InitialFriendsUsersCreate do
  use Ecto.Migration

  def change do
    create table(:friends_users) do
      add :user_id, references(:users)
      add :friend_id, references(:friends)
    end
  end
end
