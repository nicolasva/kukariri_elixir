defmodule Users do
  use Ecto.Model

  schema "users" do
    field :email, :string
    field :username, :string
    field :encrypted_password, :string
    has_many :items, Item
    field :created_at, :datetime, default: Ecto.DateTime.local
    field :updated_at, :datetime, default: Ecto.DateTime.local
  end

  def changeset(user, params \\ nil) do
    params
    |> validate_format(:email, ~r/@/)
    |> validate_unique(:email, Repo)
  end
end
