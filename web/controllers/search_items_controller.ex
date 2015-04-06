defmodule Kukariri.SearchItemsController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def index(conn, _params) do
    items = Kukariri.Queries.search_item("magnifique")
    render conn, "index.json", items: items 
  end
end
