defmodule Kukariri.ProvidedDate do
  use Ecto.Model

  schema "provided_dates" do
    field :date_at, :datetime
    field :date_to, :datetime
    field :date_to_activation, :boolean
    belongs_to :contact, Kukariri.Contact
    belongs_to :item, Kukariri.Item
    belongs_to :user, Kukariri.User
  end

  def changeset(params, :create) do
    %Kukariri.ProvidedDate{}
    |> cast(params, ~w(date_at date_to date_to_activation))
    |> validate_length(:date_at, min: 1)
    |> validate_length(:date_to, min: 1)
  end

  def changeset(params, :update, provided_date) do
    provided_date
    |> cast(params, [], ~w(date_at date_to date_to_activation))
  end
end
