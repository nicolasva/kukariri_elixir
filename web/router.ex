defmodule Kukariri.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    #plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", Kukariri do
    pipe_through :browser # Use the default browser stack

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
    get "/users/:user_id/items/:id", ItemsController, :show, as: :items
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
    post "/users/:user_id/items/:item_id/provided_dates", ProvidedDatesController, :create, as: :provided_dates
    get "/users/:user_id/items/:item_id/reservations_lists", ReservationsListsController, :index, as: :reservations_lists
    post "/items/:item_id/contacts/:contact_id/provided_dates", ProvidedDatesController, :create, as: :provided_dates
    get "/items/:item_id/contacts/:contact_id/provided_dates/:id/edit", ProvidedDatesController, :edit, as: :provided_dates
    put "/items/:item_id/contacts/:contact_id/provided_dates/:id", ProvidedDatesController, :update, as: :provided_dates
    post "/items/:item_id/contacts/:contact_id/provided_dates/:id/update", ProvidedDatesController, :update, as: :provided_dates
    get "/items/:item_id/calendars", CalendarsController, :index, as: :calendars
    get "/items/:item_id/calendars/provided_dates_list", CalendarsController, :provided_dates_list, as: :calendars
    get "/persons", PersonsController, :index, as: :persons
    get "/items/search_items/index", SearchItemsController, :index, as: :search_items
    get "/items/search_items/:id", SearchItemsController, :show, as: :search_items
  end

  # Other scopes may use custom stacks.
  # scope "/api", Kukariri do
  #   pipe_through :api
  # end
end
