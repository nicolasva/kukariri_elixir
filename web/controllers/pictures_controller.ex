defmodule Kukariri.PicturesController do
  use Phoenix.Controller
  alias Kukariri.Router

  plug :action

  def create(conn, params) do
    IO.puts "-=-=-=-=-=-=-=-=-=-=-VANDENBOGAERDE Nicolas-=-=-=-=-=-=-=-=-"
    image = params["files"]
    image_filename = to_char_list(image.filename)
    image_content_type = to_char_list(image.content_type)
    image_path = to_char_list(image.path)
    
    picture = %Kukariri.Picture{picture_file_name: image_filename}
    picture = Kukariri.Repo.insert(picture)
 
    picture = UpPlug.process_upload_plug(%UpPlug{
      model: picture,
      plug: %Plug.Upload{
        filename: image_filename,
        path: image_path,
        content_type: "image/png"
      },
      attribute_name: :photo,
      styles: %{
        thumb: "50x50>",
        medium: "120x120>"
      }
    })

    picture= Map.delete(picture, :picture)
    Kukariri.Repo.update(picture)
    #IO.puts image_url
    #atomized_keys_params = atomize_keys(params)
    #IO.puts "-=--=-=-=-=-=-=-#{atomized_keys_params}=-=-=-=-=-=-=-=-=-"
    #IO.puts picture
    #upload_picture_attachment(picture, atomize_keys(params), :picture)
    text conn, "test nicolas"
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

  defp atomize_keys(struct) do
    Enum.reduce struct, %{}, fn({k, v}, map) -> Map.put(map, String.to_atom(k), v) end
  end
end
