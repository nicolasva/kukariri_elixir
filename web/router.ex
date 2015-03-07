defmodule Kukariri.Router do
  use Phoenix.Router

  #pipeline :browser do
  #  plug :accepts, ~w(html)
  #  plug :fetch_session
  #  plug :fetch_flash
  #  plug :protect_from_forgery
  #end

  #pipeline :api do
  #  plug :accepts, ~w(json)
  #end

  scope "/", Kukariri do
    #pipe_through :browser # Use the default browser stack

    get "/", UsersController, :new, as: :users
    get "/pages", PageController, :index, as: :pages
  end

  # Other scopes may use custom stacks.
  # scope "/api", Kukariri do
  #   pipe_through :api
  # end
end
