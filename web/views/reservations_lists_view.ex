defmodule Kukariri.ReservationsListsView do
  import Kukariri.Router
  use Kukariri.View

  def render("index.json", %{provided_dates: provided_dates}) do
   array_provided_date_list = []
   array_provided_date_list = array_provided_date_list ++ provided_dates_get(provided_dates)
  end

  defp provided_dates_get(provided_dates) do
    for provided_date <- provided_dates do
      day_to = elem(elem(provided_date.date_to, 0), 2)
      month_to = elem(elem(provided_date.date_to, 0), 1)
      year_to = elem(elem(provided_date.date_to, 0), 0)

      day_at = elem(elem(provided_date.date_at, 0), 2)
      month_at = elem(elem(provided_date.date_at, 0), 1)
      year_at = elem(elem(provided_date.date_at, 0), 0)

      if day_to > day_at && month_at > month_to do
        day_to_day_at = number_day(day_to, month_to, year_to) + number_day(day_at, month_at, year_at)

        day = day_to - 1
        month = month_to
        year = year_to
        for n <- day_to..day_to_day_at do
          day = day + 1
          date = {{year, month, day}, {0, 0, 0, 0}}
          if verify_date?(date) do
            date_format(date)
          else
            day = 0
            month = month_at
            year = year_at
          end
        end
      else
        for n <- day_to..day_at do
          date = {{year, month, n}, {0, 0, 0, 0}}
          if verify_date?(date) do
            date_format(date)
          end
        end
      end
    end
  end

  defp verify_date?(datetime) do
    date = Timex.Date.from(datetime)
    try do
      Timex.DateFormat.format(date, "{RFC1123}")
    rescue
      x -> false
    else
      x -> true
    end
  end

  defp date_format(datetime) do
    date = Timex.Date.from(datetime)
    elem(Timex.DateFormat.format(date,"%Y-%m-%d", :strftime), 1)
  end

  defp number_day(day, month, year) do
    nb_day = 0
    for n <- day..31 do
      date = {{year, month, n}, {0, 0, 0, 0}}
      if verify_date?(date) do
        nb_day = nb_day + 1
      end
    end
  end
end
