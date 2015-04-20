defmodule Kukariri.ProvidedDatesController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def new(conn, _params) do
    item_id = _params["item_id"]
    contact_id = _params["contact_id"]

    render conn, "new.html", item_id: item_id, contact_id: contact_id
  end

  def edit(conn, %{"item_id" => item_id, "contact_id" => contact_id, "id" => id}) do
    provided_date = Kukariri.Repo.get Kukariri.ProvidedDate, String.to_integer(id)
    render conn, "edit.html", provided_date: provided_date
  end

  def update(conn, %{"item_id" => item_id, "contact_id" => contact_id, "id" => id, "provided_date" => params}) do
    if is_nil(params["date_to_activation"]) do
      date_to_activation = false
    else
      date_to_activation = true
    end
    provided_date = Kukariri.Repo.get Kukariri.ProvidedDate, String.to_integer(id) 
    changeset = Kukariri.ProvidedDate.changeset(%{date_at: format_date(params["date_at"]), date_to: format_date(params["date_to"]), date_to_activation: date_to_activation}, :update, provided_date)
    if changeset.valid? do
      provided_date = %{provided_date | date_at: format_date(params["date_at"]), date_to: format_date(params["date_to"]), date_to_activation: date_to_activation}
      Kukariri.Repo.update(provided_date)
      redirect conn, to: "/items/#{item_id}/contacts"
    else
      render conn, "edit.html", provided_date: provided_date, errors: changeset.errors
    end
  end

  def create(conn, %{"item_id" => item_id, "contact_id" => contact_id, "provided_date" => params}) do
    if is_nil(params["date_to_activation"]) do
      date_to_activation = false
    else
      date_to_activation = true
    end
    #if is_nil(user_id) do
      provided_date = %Kukariri.ProvidedDate{date_at: format_date(params["date_at"]), date_to: format_date(params["date_to"]), date_to_activation: date_to_activation, contact_id: String.to_integer(contact_id), item_id: String.to_integer(item_id)}
    #else
    #  provided_date = %Kukariri.ProvidedDate{date_at: format_date(params["date_at"]), date_to: format_date(params["date_to"]), date_to_activation: date_to_activation, user_id: String.to_integer(user_id), item_id: String.to_integer(item_id)}
    #end
    #changeset = Kukariri.ProvidedDate.changeset(params, :create)
    #if changeset.valid? do
      provided_date = Kukariri.Repo.insert(provided_date)
      redirect conn, to: "/items/#{item_id}/contacts"
    #else
        #render conn, "new.html", provided_date: provided_date, item_id: item_id, contact_id: contact_id, errors: changeset.errors
    #end
  end

  defp format_date(date) do
    date_array = Regex.split(~r/\//, date)
    day = Enum.at(date_array, 0)
    month = Enum.at(date_array, 1)
    year = Enum.at(date_array, 2)
    {{String.to_integer(year), String.to_integer(month), String.to_integer(day)}, {0, 0, 0, 0}}
  end
end
