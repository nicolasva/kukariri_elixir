defmodule Kukariri.Repo.Migrations.InitialTypesCreate do
  use Ecto.Migration

  def up do
    """
      CREATE TABLE types(
        id serial primary key,
        descriptif varchar(255) not null,
        item_id integer not null references items,
        contact_id integer not null references contacts,
        created_at timestamp,
        updated_at timestamp
      )
    """
  end

  def down do
    "DROP TABLE TYPES"
  end
end
