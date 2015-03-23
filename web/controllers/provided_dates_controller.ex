defmodule Kukariri.ProvidedDatesController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def new(conn, _params) do
    item_id = _params["item_id"]
    contact_id = _params["contact_id"]
    
    render conn, "new.html", item_id: item_id, contact_id: contact_id
  end

  def create(conn, %{"item_id" => item_id, "contact_id" => contact_id, "provided_date" => params}) do
    if is_nil(params["date_to_activation"]) do
      date_to_activation = false
    else
      date_to_activation = true
    end
    provided_date = %Kukariri.ProvidedDate{date_at: format_date(params["date_at"]), date_to: format_date(params["date_to"]), date_to_activation: date_to_activation, contact_id: String.to_integer(contact_id), item_id: String.to_integer(item_id)}
    provided_date = Kukariri.Repo.insert(provided_date)
    redirect conn, to: "/items/#{item_id}/contacts"
  end

  defp format_date(date) do
    date_array = Regex.split(~r/\//, date)
    day = Enum.at(date_array, 0)
    month = Enum.at(date_array, 1)
    year = Enum.at(date_array, 2)
    {{String.to_integer(year), String.to_integer(month), String.to_integer(day)}, {0, 0, 0, 0}}
  end
end
