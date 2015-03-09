defmodule Kukariri.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", Kukariri do
    #pipe_through :browser # Use the default browser stack

    get "/", UsersController, :new, as: :users
    post "/users", UsersController, :create, as: :users
    get "/logins/new", LoginsController, :new, as: :logins
    post "/logins", LoginsController, :create, as: :logins
    get "/pages", PageController, :index, as: :pages
    get "/items", ItemsController, :index, as: :items
    get "/items/:id", ItemsController, :show, as: :items
  end

  # Other scopes may use custom stacks.
  # scope "/api", Kukariri do
  #   pipe_through :api
  # end
end
