defmodule Kukariri.CalendarsView do
  import Kukariri.Router
  use Kukariri.View

  def render("provided_dates_list.json", %{provided_dates: provided_dates}) do
    provided_dates
  end
end
