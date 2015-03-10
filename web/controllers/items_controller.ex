defmodule Kukariri.ItemsController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"item" => params}) do 
    conn = fetch_session(conn)
    user = get_session(conn, :user)
    item = Map.merge(%Kukariri.Item{user_id: user.id}, atomize_keys(params)) 
    item = Kukariri.Repo.insert(item)
    if is_nil(item) do
      render conn, "new.html", item: item
    else  
      redirect conn, to: "/items"
    end
  end

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

  def atomize_keys(struct) do
    Enum.reduce struct, %{}, fn({k, v}, map) -> Map.put(map, String.to_atom(k), v) end
  end

end
