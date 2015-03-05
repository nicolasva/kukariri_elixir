defmodule Kukariri.Repo.Migrations.InitialPicturesCreate do
  use Ecto.Migration

  def up do
    """
      CREATE TABLE Pictures(
        id serial primary key,
        picture varchar(255) not null,
        cached_path varchar(255) not null,
        position integer not null default 0,
        item_id integer not null references items,
        type_id integer not null references types, 
        created_at timestamp,
        updated_at timestamp
      )
    """
  end

  def down do
    "DROP TABLE PICTURES"
  end
end
