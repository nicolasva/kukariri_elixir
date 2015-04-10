defmodule Kukariri.SearchItemsController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def index(conn, _params) do
    items = Kukariri.Queries.search_items(_params["term"])
    render conn, "index.json", items: items 
  end

  def show(conn, %{"id" => id}) do
    items = Kukariri.Queries.search_items(id)
    render conn, "show.html", items: items
  end
end
