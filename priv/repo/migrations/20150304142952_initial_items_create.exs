defmodule Kukariri.Repo.Migrations.InitialItemsCreate do
  use Ecto.Migration

  def up do
    """
      CREATE TABLE items(
        id serial primary key,
        title varchar(255) not null,
        user_id integer not null
      )
    """ 
  end

  def down do
    "DROP TABLE ITEMS"
  end
end
