defmodule Kukariri.Repo.Migrations.InitialFriendsUsersCreate do
  use Ecto.Migration

  def up do
    """
      CREATE TABLE friends_users(
        user_id integer not null references users,
        friend_id integer not null references friends
      )
    """
  end

  def down do
    "DROP TABLE FRIENDS_USERS"
  end
end
