defmodule Kukariri.Repo.Migrations.InitialProvidedDatesCreate do
  use Ecto.Migration

  def up do
    """
      CREATE TABLE provided_dates(
        id serial primary key,
        date_at timestamp,
        date_to timestamp,
        date_to_activation boolean,
        contact_id integer not null references contacts,
        item_id integer not null references items, 
        created_at timestamp,
        updated_at timestamp
      )
    """
  end

  def down do
    "DROP TABLE PROVIDED_DATES"
  end
end
