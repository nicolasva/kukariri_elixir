defmodule Kukariri.CalendarsView do
  import Kukariri.Router
  use Kukariri.View

  def render("provided_dates_list.json", %{provided_dates: provided_dates})  do
    array_provided_date = []
    array_provided_date = array_provided_date ++ get_provided_dates(provided_dates)
    array_provided_date
  end


  defp get_provided_dates(provided_dates) do 
    for provided_date <- provided_dates do
      register_hash(provided_date)
    end
  end

  defp register_hash(provided_date) do
    map_general = Map.new
    month_at = elem(elem(provided_date.date_at, 0), 1)
    month_at = String.rjust(to_string(month_at), 2, ?0)

    month_to = elem(elem(provided_date.date_to, 0), 1)
    month_to = String.rjust(to_string(month_to), 2, ?0) 
    
    date_at = "#{elem(elem(provided_date.date_at, 0), 0)}-#{month_at}-#{elem(elem(provided_date.date_at, 0), 2)}"
    date_to = "#{elem(elem(provided_date.date_to, 0), 0)}-#{month_to}-#{elem(elem(provided_date.date_to, 0), 2)}"
    map_general = Map.merge(map_title(date_at, date_to), map_start(date_at))
    Map.merge(map_general, map_end(date_to))
  end

  defp map_title(date_at, date_to) do
    map_title = Map.new
    Map.put(map_title, :title, "#{date_at}-#{date_to}")
  end

  defp map_start(date_at) do
    map_start = Map.new
    Map.put(map_start, :start, date_at)
  end
  
  defp map_end(date_to) do
    map_end = Map.new
    Map.put(map_end, :end, date_to)
  end
end
