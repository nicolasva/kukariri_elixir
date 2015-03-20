defmodule Kukariri.ProvidedDate do
  use Ecto.Model

  schema "provided_dates" do
    field :date_at, :datetime
    field :date_to, :datetime
    field :date_to_activation, :boolean
    belongs_to :contact, Contact
    belongs_to :item, Item
  end
end
