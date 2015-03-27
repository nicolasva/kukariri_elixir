defmodule Kukariri.ProvidedDate do
  use Ecto.Model

  schema "provided_dates" do
    field :date_at, :datetime
    field :date_to, :datetime
    field :date_to_activation, :boolean
    belongs_to :contact, Kukariri.Contact
    belongs_to :item, Kukariri.Item
  end

  def changeset(params, :create) do
    %Kukariri.ProvidedDate{}
    |> cast(params, ~w(date_at date_to))
    |> validate_length(:date_at, min: 10)
    |> validate_length(:date_to, min: 10)
  end

  def changeset(params, :update, provided_date) do
    provided_date
    |> cast(params, [], ~w(date_at dat_to))
    |> validate_length(:date_at, min: 10)
    |> validate_length(:date_to, mon: 10)
  end
end
