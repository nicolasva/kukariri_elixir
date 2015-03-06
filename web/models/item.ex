defmodule Kukariri.Item do
  use Ecto.Model

  schema "items" do
    field :title, :string
    belongs_to :user, User
    has_many :types, Type
    has_many :provided_dates, ProvidedDate
    field :created_at, :datetime, default: Ecto.DateTime.local
    field :updated_at, :datetime, default: Ecto.DateTime.local
  end

end
