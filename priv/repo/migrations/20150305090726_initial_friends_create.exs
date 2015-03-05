defmodule Kukariri.Repo.Migrations.InitialFriendsCreate do
  use Ecto.Migration

  def up do
    """
      CREATE TABLE friends(
        id serial primary key,
        follow boolean default false,
        friend boolean default false,
        friend_id integer not null references users,
        accept_friend boolean default false, 
        created_at timestamp,
        updated_at timestamp,
        cancel boolean default false
      )
    """
  end

  def down do
    "DROP TABLE FRIENDS"
  end
end
