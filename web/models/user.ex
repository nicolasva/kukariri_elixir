defmodule Kukariri.User do
  use Ecto.Model

  schema "users" do
    field :email, :string
    field :username, :string
    field :encrypted_password, :string
    has_many :items, Item
    has_many :contacts, Contact
    has_many :friends, through: FriendUser
    field :created_at, :datetime, default: Ecto.DateTime.local
    field :updated_at, :datetime, default: Ecto.DateTime.local
  end
end
