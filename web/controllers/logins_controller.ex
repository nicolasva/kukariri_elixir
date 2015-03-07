defmodule Kukariri.LoginsController do
  use Phoenix.Controller
  alias Kukariri.Router
  alias Phoenix.Controller.Flash

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    user = Kukariri.login.login?(params["email"], params["password"])
    if user == nil do
      conn
      |> Flash.put(:notice, "Username and or password was wrong")
      |> render "new"
    else
      conn
      |> Flash.put(:notice, "Login succees.")
      |> put_session(:email, params["email"])
      |> redirect Router.pages_path(:index)
    end
  end

  def logout(conn, _params) do
    conn
    |> put_session(:email, "")
    |> Flash.put(:notice, "Logout has been succeeded")
    |> redirect Router.pages_path(:index)
  end
end
