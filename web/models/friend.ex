defmodule Friend do
  use Ecto.Model

  schema "friends" do
    field :follow, :boolean
    field :friend, :boolean
    belongs_to :user, User
    has_many :users, through: FriendUser
    field :accept_friend, :boolean 
    field :created_at, :datetime, default: Ecto.DateTime.local
    field :updated_at, :datetime, default: Ecto.DateTime.local 
  end
end
