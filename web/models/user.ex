defmodule Kukariri.User do
  use Ecto.Model

  schema "users" do
    field :email, :string
    field :username, :string
    field :encrypted_password, :string
    has_many :items, Kukariri.Item
    has_many :contacts, Kukariri.Contact
    #has_many :friends, through: FriendUser
    has_many :provided_dates, Kukariri.ProvidedDate
  end
end
