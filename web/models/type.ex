defmodule Kukariri.Type do
  use Ecto.Model

  schema "types" do
    field :descriptif, :string
    has_many :pictures, Kukariri.Picture
    belongs_to :item, Item
    belongs_to :contact, Contact
  end
end
