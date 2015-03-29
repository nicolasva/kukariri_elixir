defmodule Kukariri.Picture do
  use Ecto.Model

  schema "pictures" do
    field :picture_file_name, :string
    field :picture_content_type, :string
    field :picture_file_size, :integer
    field :picture_updated_at, :datetime
    field :position, :integer
    belongs_to :item, Kukariri.Item
    belongs_to :type, Kukariri.Type
  end

  def picture_save(image, item_id, params) do 
      picture_upload = UploadFile.upload_img(image) 
      picture = %Kukariri.Picture{item_id: item_id, picture_content_type: picture_upload.image_content_type, picture_file_name: picture_upload.image_filename, type: [descriptif: params["picture"]["type"]["descriptif"]]}
      type_description = elem(Enum.at(picture.type, 0),1)
      type = %Kukariri.Type{descriptif: type_description, item_id: item_id}
      type = Kukariri.Repo.insert(type) 
      picture = %Kukariri.Picture{position: 0, type_id: type.id, item_id: item_id, picture_content_type: picture_upload.image_content_type, picture_file_name: picture_upload.image_filename, type: [descriptif: params["picture"]["type"]["descriptif"]]}
      Kukariri.Repo.insert(picture)
  end
end
