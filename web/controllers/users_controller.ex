defmodule Kukariri.UsersController do
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
    user = %Kukariri.User{username: params["username"], encrypted_password: params["encrypted_password"], email: params["email"]}
    Kukariri.Repo.insert(user)

    redirect conn, Router.pages_path(:index)
  end
end
