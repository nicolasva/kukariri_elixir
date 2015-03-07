defmodule Kukariri.UsersController do
  use Phoenix.Controller
  alias Kukariri.Router
  alias Kukariri.Controller.Flash

  def new(conn, _params) do
    render conn, "new"
  end

  def create(conn, params) do
    user = %Kukariri.User{username: params["username"], encrypted_password: Crypto.md5(params["encrypted_password"]), email: params["email"]}
    Kukariri.Repo.insert(user)

    redirect conn, Router.pages_path(:index)
  end
end
