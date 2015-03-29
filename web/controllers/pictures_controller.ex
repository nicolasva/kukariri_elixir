defmodule Kukariri.PicturesController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def index(conn, _params) do
    item_id = _params["item_id"]
    pictures = Kukariri.Queries.all_pictures_item(item_id)
    json conn, %{pictures:  pictures}
  end

  def new(conn, _params) do
    item_id = String.to_integer(_params["item_id"])
    item = Kukariri.Repo.get Kukariri.Item, item_id 
    pictures = Kukariri.Queries.all_pictures_item(_params["item_id"])
    render conn, "new.html", item: item, pictures: pictures
  end

  def create(conn, params) do
    item_id = String.to_integer(params["item_id"]) 
    Enum.each(params["files"], fn(image) ->  
      picture = Kukariri.Picture.picture_save(image, item_id, params)
      json conn, %{files: [%{thumbnailUrl: "/images/img_items/#{picture.picture_file_name}", type: picture.picture_content_type, size: 174035, deleteUrl: "/images/img_items/#{picture.picture_file_name}", item_id: item_id, type_id: picture.type_id, deleteType: "DELETE",  url: "/images/img_items/#{picture.picture_file_name}", picture_file_name: picture.picture_file_name}]}
    end
    )
  end

  def destroy(conn, %{"id" => id}) do 
    picture = Kukariri.Queries.picture(id)
    type = Kukariri.Repo.get Kukariri.Type, picture.type_id
    Kukariri.Repo.delete(picture)
    Kukariri.Repo.delete(type)
    json conn, %{picture: true}
  end

  def upload_picture_attachment(picture, params, attachment_attribute_name
) do
    if (params[attachment_attribute_name] != nil and String.length(params[attachment_attribute_name].filename) > 0 ) do
      picture = UpPlug.process_upload_plug(%UpPlug{
        model: picture,
        plug: params[attachment_attribute_name],
        attribute_name: attachment_attribute_name,
        styles: %{ thumb: "100x100>", large: "300x300>" }
      })
      picture= Map.delete(picture, :picture)
      Kukariri.Repo.update(picture)
    end
  end

  defp file_name_for_save(file_name) do
    Regex.replace(~r/[&$+,\/:;=?@<>\[\]\{\}\|\\\^~%# ]/, file_name, "_")
  end

  defp atomize_keys(struct) do
    Enum.reduce struct, %{}, fn({k, v}, map) -> Map.put(map, String.to_atom(k), v) end
  end
end
