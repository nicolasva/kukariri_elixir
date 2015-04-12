defmodule Kukariri.View do
  use Phoenix.View, root: "web/templates"

  # The quoted expression returned by this block is applied
  # to this module and all other views that use this module.
  using do
    quote do
      # Import common functionality
      import Kukariri.Router.Helpers

      # Use Phoenix.HTML to import all HTML functions (forms, tags, etc)
      use Phoenix.HTML
    end
  end

  # Functions defined here are available to all other views/templates
  def disponibility?(item_id) do
    provided_date = Kukariri.Queries.picture_with_provided_date?(item_id)
    is_nil(provided_date)
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
