defmodule Kukariri.CalendarsController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def provided_dates_list(conn, params) do
    provided_dates = Kukariri.Queries.provided_dates_list(params["item_id"], params["start"], params["end"])
    render conn, "provided_dates_list.json", provided_dates: provided_dates
  end
end
