defmodule Kukariri.Item do
  use Ecto.Model

  schema "items" do
    field :title, :string
    belongs_to :user, User
    has_many :pictures, Picture
    has_many :types, Type
    has_many :provided_dates, ProvidedDate
  end

end
