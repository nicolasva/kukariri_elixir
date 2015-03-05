defmodule Kukariri.Repo.Migrations.InitialContactsCreate do
  use Ecto.Migration

  def up do
    """
      CREATE TABLE contacts(
        id serial primary key,
        lastname varchar(255) not null,
        firstname varchar(255) not null,
        email varchar(255) not null,
        tel_home varchar(255),
        tel_mobile varchar(255),
        address varchar(255),
        country varchar(255) not null,
        user_id integer not null references users,
        created_at timestamp,
        updated_at timestamp
      )
    """
  end

  def down do
    "DROP TABLE CONTACTS"
  end
end
