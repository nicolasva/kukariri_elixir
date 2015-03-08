defmodule Kukariri.LoginsController do
  use Phoenix.Controller
  alias Kukariri.Router
  alias Phoenix.Controller.Flash

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    user = Kukariri.Login.login?(params["email"], params["password"])
    if user == nil do
      conn
      |> render "new"
    else
      conn = fetch_session(conn)
      put_session(conn, :email, params["email"])
      foo = get_session(conn, :email)
      redirect conn, Router.pages_path(:index)
    end
  end

  def logout(conn, _params) do
    conn
    |> put_session(:email, "")
    |> Flash.put(:notice, "Logout has been succeeded")
    |> redirect Router.pages_path(:index)
  end
end
