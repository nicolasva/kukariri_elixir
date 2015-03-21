defmodule Kukariri.ProvidedDatesController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end
end
