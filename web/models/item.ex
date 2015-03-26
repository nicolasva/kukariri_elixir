defmodule Kukariri.Item do
  use Ecto.Model

  schema "items" do
    field :title, :string
    belongs_to :user, Kukariri.User
    has_many :pictures, Kukariri.Picture
    has_many :types, Kukariri.Type
    has_many :provided_dates, Kukariri.ProvidedDate
  end

  def changeset(params, :create) do
    %Kukariri.Item{}
    |> cast(params, ~w(title))
    |> validate_unique(:title, on: Kukariri.Repo)
  end

  def changeset(params, :update, item) do
    item
    |> cast(params, [], ~w(title))
    |> validate_unique(:title, on: Kukariri.Repo)
  end
end
