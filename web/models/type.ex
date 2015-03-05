defmodule Type do
  use Ecto.Model

  schema "types" do
    field :descriptif, :string
    belongs_to :item, Item
    belongs_to :contact, Contact
    field :created_at, :datetime, default: Ecto.DateTime.local
    field :updated_at, :datetime, default: Ecto.DateTime.local
  end
end
