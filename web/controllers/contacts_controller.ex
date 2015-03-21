defmodule Kukariri.ContactsController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def index(conn, _params) do 
    conn = fetch_session(conn)
    user = get_session(conn, :user)
    contacts = Kukariri.Queries.contacts_list(user.id)
    render conn, "index.html", contacts: contacts, item_id: _params["item_id"]
  end

  def new(conn, _params) do
    render conn, "new.html", item_id: _params["item_id"]
  end

  def edit(conn, %{"item_id" => item_id, "id" => id}) do
    contact = Kukariri.Repo.get Kukariri.Contact, String.to_integer(id) 
    render conn, "edit.html", contact: contact, item_id: item_id
  end

  def create(conn, %{"item_id" => item_id, "contact" => params}) do 
    session = fetch_session(conn)
    user = get_session(session, :user)
    contact = Map.merge(%Kukariri.Contact{user_id: user.id}, atomize_keys(params))
    contact = Kukariri.Repo.insert(contact)
    redirect conn, to: "/items/#{item_id}/contacts" 
    #redirect conn, to: '/items/#{params["item_id"]}/contacts/#{contact.id}/provided_dates/new'
  end

  def update(conn, params) do
    item_id = params["item_id"]
    session = fetch_session(conn)
    user = get_session(session, :user)
    contact = Kukariri.Repo.get Kukariri.Contact, String.to_integer(params["id"])
    contact = %{contact | user_id: user.id, lastname: params["contact"]["lastname"], firstname: params["contact"]["firstname"], email: params["contact"]["email"], tel_home: params["contact"]["tel_home"], tel_mobile: params["contact"]["tel_mobile"], address: params["contact"]["address"], country: params["contact"]["country"], region: params["contact"]["region"]}
    Kukariri.Repo.update(contact)
    redirect conn, to: "/items/#{item_id}/contacts"
    #redirect conn, to: '/items/#{params["item_id"]}/contacts/#{contact.id}/provided_dates/new'
  end

  def destroy(conn, %{"item_id" => item_id, "id" => id}) do
    contact = Kukariri.Repo.get Kukariri.Contact, String.to_integer(id)
    Kukariri.Repo.delete(contact) 
    redirect conn, to: "/items/#{item_id}/contacts"
  end

  defp atomize_keys(struct) do
    Enum.reduce struct, %{}, fn({k, v}, map) -> Map.put(map, String.to_atom(k), v) end
  end
end
