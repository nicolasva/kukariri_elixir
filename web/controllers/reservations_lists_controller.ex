defmodule Kukariri.ReservationsListsController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def index(conn, _params) do
    provided_dates = Kukariri.Queries.provided_dates_all(_params["item_id"])

    render conn, "index.json", provided_dates: provided_dates
  end
end
