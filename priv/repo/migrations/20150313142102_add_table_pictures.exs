defmodule Kukariri.Repo.Migrations.AddTablePictures do
  use Ecto.Migration

  def up do
    """
      CREATE TABLE Pictures(
        id serial primary key,
        picture_file_name varchar(255) not null,
        picture_content_type varchar(255),
        picture_file_size integer,
        picture_updated_at timestamp,
        position integer not null default 0,
        item_id integer references items,
        type_id integer references types,
        created_at timestamp,
        updated_at timestamp
      )
    """
  end

  def down do
    "DROP TABLE PICTURES"
  end
end
