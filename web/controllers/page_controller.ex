defmodule Kukariri.PageController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def index(conn, _params) do
    conn = fetch_session(conn)
    email_session = get_session(conn, :email)
    #render conn, "index"
    text conn, email_session
  end
end
