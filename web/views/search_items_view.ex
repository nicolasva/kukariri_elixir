defmodule Kukariri.SearchItemsView do
  import Kukariri.Router
  use Kukariri.View

  def render("index.json", %{items: items}) do
   array_items = []
   for item <- items do
     array_items = array_items ++ item.title
   end
  end

  def get_img_preview(pictures) do
    picture = pictures |> List.first
    if is_nil(picture) do
      "no_image/noImage.jpg"
    else
      picture.picture_file_name
    end
  end
end
