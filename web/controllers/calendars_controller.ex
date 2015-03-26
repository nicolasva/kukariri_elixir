defmodule Kukariri.CalendarsController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def provided_dates_list(conn, params) do
    IO.puts "dqsfdsfdsf"
    provided_dates = Kukariri.Queries.provided_dates_list(params["item_id"])
    render conn, "provided_dates_list.json", provided_dates: provided_dates
  end
end
