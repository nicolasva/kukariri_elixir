defmodule FriendsUser do 
  use Ecto.Model

  schema "friends_users" do
    belongs_to :user, User
    belongs_to :friend, Friend
  end
end
