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
    changeset = Kukariri.Item.changeset(params, :create)
    if changeset.valid? do
      item = Kukariri.Repo.insert(item)  
      redirect_items(params, item, conn)
    else
      render conn, "new.html", item: item, errors: changeset.errors
    end
  end

  def index(conn, _params) do
    session = fetch_session(conn)
    user = get_session(session, :user)
    items = Kukariri.Queries.items_list(user.id)
    render conn, "index.html", items: items
  end

  def edit(conn, %{"id" => id}) do 
    item = Kukariri.Repo.get Kukariri.Item, String.to_integer(id)
    render conn, "edit.html", item: item
  end

  def update(conn, params) do 
    item = Kukariri.Repo.get Kukariri.Item, String.to_integer(params["id"])
    changeset = Kukariri.Item.changeset(params["item"], :update, item)
    if changeset.valid? do
      item = %{item | title: params["item"]["title"]}
      Kukariri.Repo.update(item)
      redirect_items(params["item"], item, conn)
    else
      render conn, "edit.html", item: item, errors: changeset.errors
    end
  end

  def show(conn, %{"id" => id}) do 
   item = Kukariri.Queries.item(id)
   render conn, "show.html", item: item
  end

  def destroy(conn, %{"id" => id}) do
    item = Kukariri.Queries.item(id)
    Kukariri.Repo.delete(item) 
    redirect conn, to: "/items"
  end

  defp atomize_keys(struct) do
    Enum.reduce struct, %{}, fn({k, v}, map) -> Map.put(map, String.to_atom(k), v) end
  end

  defp redirect_items(params, item, conn) do 
    if is_nil(params["update_img"]) do
      redirect conn, to: "/items"
    else
      redirect conn, to: "/items/#{item.id}/pictures/new"
    end
  end

end
