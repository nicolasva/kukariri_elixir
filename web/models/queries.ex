defmodule Kukariri.Queries do
  import Ecto.Query
  alias Kukariri.User
  alias Kukariri.Item
  alias Kukariri.Picture

  def item(id) do
    id = String.to_integer(id)
    query = from item in Item,
            where: item.id == ^id,
            select: item
    Kukariri.Repo.all(query) |> List.first
  end

  def picture(id) do
    id = String.to_integer(id)
    query = from picture in Picture,
            where: picture.id == ^id,
            select: picture
    
    Kukariri.Repo.all(query) |> List.first
  end

  def all_pictures_item(item_id) do
    item_id = String.to_integer(item_id)
    query = from picture in Picture,
            where: picture.item_id == ^item_id,
            select: picture
    Kukariri.Repo.all(query) 
  end
  
  def picture_register?(filename) do
    query = from picture in Picture,
      where: picture.picture_file_name == ^filename,
      where: picture.item_id == "",
      select: picture
    Kukariri.Repo.all(query) |> List.first
  end

  def items_list(user_id) do
    query = from item in Item,
      where: item.user_id == ^user_id,
      select: item
    Kukariri.Repo.all(query)
  end
end
