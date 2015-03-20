defmodule Kukariri.Item do
  use Ecto.Model

  schema "items" do
    field :title, :string
    belongs_to :user, Kukariri.User
    has_many :pictures, Kukariri.Picture
    has_many :types, Kukariri.Type
    has_many :provided_dates, Kukariri.ProvidedDate
  end

end
