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
    post "/pictures", PicturesController, :create, as: :pictures
    get "/items/:item_id/pictures", PicturesController, :index, as: :pictures
    post "/items/:item_id/pictures", PicturesController, :create, as: :pictures
    get "/items/:item_id/pictures/new", PicturesController, :new, as: :pictures
    delete "/items/:item_id/pictures/:id", PicturesController, :destroy, as: :destroy
    get "/pages", PageController, :index, as: :pages
    get "/items/new", ItemsController, :new, as: :items
    get "/items/:id/edit", ItemsController, :edit, as: :items
    delete "/items/:id", ItemsController, :destroy, as: :items
    post "/items/:id/update", ItemsController, :update, as: :items
    put "/items/:id", ItemsController, :update, as: :items
    patch "/items/:id", ItemsController, :update, as: :items
    get "/items/:id/destroy", ItemsController, :destroy, as: :items
    post "/items", ItemsController, :create, as: :items 
    get "/items", ItemsController, :index, as: :items
    get "/items/:id", ItemsController, :show, as: :items
    get "/items/:id/edit", ItemsController, :edit, as: :items
    get "/items/:item_id/contacts", ContactsController, :index, as: :contacts
    get "/items/:item_id/contacts/new", ContactsController, :new, as: :contacts 
    post "/items/:item_id/contacts", ContactsController, :create, as: :contacts
    get "/items/:item_id/contacts/:id/edit", ContactsController, :edit, as: :contacts
    post "/items/:item_id/contacts/:id/update", ContactsController, :update, as: :contacts
    put "/items/:item_id/contacts/:id", ContactsController, :update, as: :contacts
    patch "/items/:item_id/contacts/:id", ContactsController, :update, as: :contacts
    delete "/items/:item_id/contacts/:id", ContactsController, :destroy, as: :contacts
    get "/items/:item_id/contacts/:id/delete", ContactsController, :destroy, as: :contacts
    get "/items/:item_id/contacts/:contact_id/provided_dates/new", ProvidedDatesController, :new, as: :provided_dates
  end

  # Other scopes may use custom stacks.
  # scope "/api", Kukariri do
  #   pipe_through :api
  # end
end
