defmodule Kukariri.Repo.Migrations.InitialUsersCreate do
  use Ecto.Migration

  def up do
    """
      CREATE TABLE users(
        id serial primary key,
        email varchar(255),
        username varchar(255),
        encrypted_password varchar(255),
        created_at timestamp,
        updated_at timestamp
      )
    """
  end

  def down do
    "DROP TABLE USERS"
  end
end
