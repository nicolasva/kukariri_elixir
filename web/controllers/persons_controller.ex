defmodule Kukariri.PersonsController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
