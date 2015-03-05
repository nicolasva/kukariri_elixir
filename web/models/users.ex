defmodule Users do
  use Ecto.Model

  schema "users" do
    field :email, :string
    field :username, :string
    field :encrypted_password, :string
    has_many :items, Item
    has_many :contacts, Contact
    field :created_at, :datetime, default: Ecto.DateTime.local
    field :updated_at, :datetime, default: Ecto.DateTime.local
  end

  def changeset(user, params \\ nil) do
    params
    |> validate_format(:email, ~r/@/)
    |> validate_length(:email, 1..100)
    |> validate_length(:username, 1..100)
    |> validate_length(:encrypted_password, 1..100)
    |> validate_unique(:email, Repo)
  end
end
