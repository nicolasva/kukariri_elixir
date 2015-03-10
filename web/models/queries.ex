defmodule Kukariri.Queries do
  import Ecto.Query
  alias Kukariri.User
  alias Kukariri.Item

  def item(id) do
    id = String.to_integer(id)
    query = from item in Item,
            where: item.id == ^id,
            select: item
    Kukariri.Repo.all(query) |> List.first
  end

  def items_list(user_id) do
    query = from item in Item,
      where: item.user_id == ^user_id,
      select: item
    Kukariri.Repo.all(query)
  end
end
