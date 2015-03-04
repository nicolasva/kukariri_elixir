defmodule Items do
  use Ecto.Model

  schema "items" do
    field :title, :string
    belongs_to :user, User 
    field :created_at, :datetime, default: Ecto.DateTime.local
    field :updated_at, :datetime, default: Ecto.DateTime.local
  end
end
