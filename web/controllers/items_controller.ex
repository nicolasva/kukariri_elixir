defmodule Kukariri.ItemsController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def index(conn, _params) do
    conn = fetch_session(conn)
    user_id = get_session(conn, :user_id)
    items = Kukariri.Queries.items_list(user_id)
    render conn, "index", items: items
  end
end
