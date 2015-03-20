defmodule Kukariri.Contact do
  use Ecto.Model

  schema "contacts" do
    field :lastname, :string
    field :firstname, :string
    field :email, :string
    field :tel_home, :string
    field :tel_mobile, :string
    field :address, :string
    field :country, :string
    belongs_to :user, User 
    has_many :types, Type
    has_many :provided_dates, ProvidedDate
    field :region, :string
  end

end
