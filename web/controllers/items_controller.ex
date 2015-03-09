defmodule Kukariri.ItemsController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def index(conn, _params) do
    conn = fetch_session(conn)
    user = get_session(conn, :user)
    items = Kukariri.Queries.items_list(user.id)
    render conn, "index.html", items: items
  end

  def show(conn, %{"id" => id}) do
   item = Kukariri.Queries.item(id)
   render conn, "show", item: item
  end
end
