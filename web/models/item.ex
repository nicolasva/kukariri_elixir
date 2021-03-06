defmodule Kukariri.Item do
  use Ecto.Model
  import Ecto.Query
  alias Kukariri.Item

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
    |> validate_length(:title, min: 1)
  end

  def changeset(params, :update, item) do
    item
    |> cast(params, [], ~w(title))
    |> validate_length(:title, min: 1)
  end

end
