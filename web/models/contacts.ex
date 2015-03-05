defmodule Contacts do
  use Ecto.Model

  schema "contacts" do
    field :lastname, :string
    field :firstname, :string
    field :email, :string
    field :tel_home, :string
    field :tel_mobile, :string
    field :address, :string
    field :country, :string
    belongs_to :user, User 
    field :created_at, :datetime, default: Ecto.DateTime.local
    field :updated_at, :datetime, default: Ecto.DateTime.local
    field :region, :string
  end

end
