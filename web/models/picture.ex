defmodule Kukariri.Picture do
  use Ecto.Model

  schema "pictures" do
    field :picture_file_name, :string
    field :picture_content_type, :string
    field :picture_file_size, :integer
    field :picture_updated_at, :datetime
    field :position, :integer
    belongs_to :item, Kukariri.Item
    belongs_to :type, Kukariri.Type
  end
end
