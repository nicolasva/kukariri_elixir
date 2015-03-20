defmodule Kukariri.FriendsUser do 
  use Ecto.Model

  schema "friends_users" do
    belongs_to :user, Kukariri.User
    belongs_to :friend, Kukariri.Friend
  end
end
