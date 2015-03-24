defmodule Kukariri.Queries do
  import Ecto.Query
  alias Kukariri.User
  alias Kukariri.Item
  alias Kukariri.Picture
  alias Kukariri.Contact
  alias Kukariri.ProvidedDate

  def item(id) do
    id = String.to_integer(id)
    query = from item in Item,
            where: item.id == ^id,
            select: item
    Kukariri.Repo.all(query) |> List.first
  end

  def picture_with_provided_date?(item_id) do
    time_today = elem(Ecto.DateTime.dump(Ecto.DateTime.local()), 1)
    query = from provided_date in ProvidedDate, 
            where: provided_date.date_at < ^time_today,
            where: provided_date.date_to > ^time_today, 
            where: provided_date.item_id == ^item_id,
            where: provided_date.date_to_activation == true, 
            select: provided_date

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
            preload: [:type],
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
      preload: [:provided_dates],
      select: item
    Kukariri.Repo.all(query)
  end

  def contacts_list(user_id) do 
    query = from contact in Contact,
      where: contact.user_id == ^user_id,
      select: contact
    Kukariri.Repo.all(query)
  end

  def provided_dates_list(item_id) do 
    time_today = elem(Ecto.DateTime.dump(Ecto.DateTime.local()), 1)
    item_id = String.to_integer(item_id)
    query = from provided_date in ProvidedDate,
      where: provided_date.item_id == ^item_id, 
      where: provided_date.date_at < ^time_today,
      where: provided_date.date_to > ^time_today, 
      select: provided_date
    Kukariri.Repo.all(query)
  end
end
