defmodule Kukariri.UsersController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    user = %Kukariri.User{username: params["username"], encrypted_password: Crypto.md5(params["encrypted_password"]), email: params["email"]}
    Kukariri.Repo.insert(user)

    redirect conn, Router.pages_path(:index)
  end
end
