defmodule Kukariri.ProvidedDatesView do
  import Kukariri.Router
  use Kukariri.View

  def format_date_input(date) do
    year = elem(elem(date, 0), 0)
    month = elem(elem(date, 0), 1)
    day = elem(elem(date, 0), 2)
    "#{day}/#{month}/#{year}"
  end
end
