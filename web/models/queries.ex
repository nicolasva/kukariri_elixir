defmodule Kukariri.Queries do
  import Ecto.Query
  alias Kukariri.User
  alias Kukariri.Item

  def items_list(user_id)
    query = from item in Item,
      where: item.user_id == ^user_id,
      select: item
    Kukariri.Repo.all(query)
  end
end
