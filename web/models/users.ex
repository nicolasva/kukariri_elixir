defmodule Users do
  use Ecto.Model

  schema "users" do
    field :email, :string
    field :username, :string
    field :encrypted_password, :string
    field :created_at, :datetime, default: Ecto.DateTime.local
    field :updated_at, :datetime, default: Ecto.DateTime.local
  end
end
