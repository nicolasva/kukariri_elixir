defmodule Kukariri.Picture do
  use Ecto.Model

  schema "pictures" do
    field :picture, :string
    field :cached_path, :string
    field :position, :integer
    belongs_to :item, Item
    belongs_to :type, Type
    field :created_at, :datetime, default: Ecto.DateTime.local
    field :updated_at, :datetime, default: Ecto.DateTime.local
  end
end
