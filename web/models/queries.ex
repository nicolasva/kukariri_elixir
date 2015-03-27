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

  def lent_item?(item_id) do
    is_nil(picture_with_provided_date?(item_id))
  end

  def picture_with_provided_date?(item_id) do
    #2015-03-18 00:00:00 | 2015-03-28 00:00:00
    time_today = elem(Ecto.DateTime.dump(Ecto.DateTime.local()), 1)
    query = from provided_date in ProvidedDate, 
            where: provided_date.date_at < ^time_today,
            where: provided_date.date_to > ^time_today, 
            where: provided_date.item_id == ^item_id,
            where: provided_date.date_to_activation == true, 
            select: provided_date

    Kukariri.Repo.all(query) |> List.first
  end

  def contact_provided_date_lent?(contact_id, item_id) do 
    time_today = elem(Ecto.DateTime.dump(Ecto.DateTime.local()), 1)
    query = from provided_date in ProvidedDate,
            where: provided_date.date_at < ^time_today,
            where: provided_date.date_to > ^time_today,
            where: provided_date.item_id == ^item_id,
            where: provided_date.contact_id == ^contact_id,
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

  def provided_dates_list(item_id, start, end_date) do
    item_id = String.to_integer(item_id)
    query = from provided_date in ProvidedDate,
      where: provided_date.item_id == ^item_id, 
      where: provided_date.date_at > ^date_calendar(start),
      where: provided_date.date_to < ^date_calendar(end_date),
      select: provided_date
    Kukariri.Repo.all(query)
  end

  defp date_calendar(date) do 
    date_array = Regex.split(~r/-/, date)
    {{String.to_integer(Enum.at(date_array, 0)), String.to_integer(Enum.at(date_array, 1)), String.to_integer(Enum.at(date_array, 2))}, {0, 0, 0, 0}}
  end
end
