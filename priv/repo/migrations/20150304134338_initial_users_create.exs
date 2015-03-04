defmodule Kukariri.Repo.Migrations.InitialUsersCreate do
  use Ecto.Migration

  def up do
    """
      CREATE TABLE users(
        id serial primary key,
        email varchar(255) not null,
        username varchar(255) not null,
        encrypted_password varchar(255) not null,
        created_at timestamp,
        updated_at timestamp
      )
    """
  end

  def down do
    "DROP TABLE USERS"
  end
end
