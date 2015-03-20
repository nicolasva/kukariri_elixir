defmodule Kukariri.Friend do
  use Ecto.Model

  schema "friends" do
    field :follow, :boolean
    field :friend, :boolean
    belongs_to :user, User
    #has_many :users, through: FriendUser
    field :accept_friend, :boolean 
  end
end
