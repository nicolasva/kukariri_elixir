defmodule Kukariri.SearchItemsView do
  import Kukariri.Router
  use Kukariri.View

  def render("index.json", %{items: items}) do
   array_items = []
   for item <- items do
      IO.puts item.title
      array_items = array_items ++ item.title
   end
  end
end
