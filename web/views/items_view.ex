defmodule Kukariri.ItemsView do
  import Kukariri.Router
  use Kukariri.View

  def disponibility?(item_id) do
    provided_date = Kukariri.Queries.picture_with_provided_date?(item_id)
    is_nil(provided_date)
  end
end
