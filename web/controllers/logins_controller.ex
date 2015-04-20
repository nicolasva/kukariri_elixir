defmodule Kukariri.LoginsController do
  use Phoenix.Controller
  alias Kukariri.Router
  alias Phoenix.Controller.Flash

  plug :action

  def new(conn, _params) do
    if is_nil(get_session(fetch_session(conn), :user)) do
      render conn, "new.html"
    else
      redirect conn, to: "/items"
    end
  end

  def create(conn, params) do
    user = Kukariri.Login.login?(params["email"], params["password"])
    if user == nil do
      conn
      |> render "new"
    else
      conn = fetch_session(conn)
      conn = put_session(conn, :user, user)
      redirect conn, to: "/items"
    end
  end

  def logout(conn, _params) do
    conn
    |> put_session(:email, "")
    |> Flash.put(:notice, "Logout has been succeeded")
    |> redirect Router.pages_path(:index)
  end
end
