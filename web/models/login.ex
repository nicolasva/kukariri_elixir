defmodule Kukariri.Login do
  use Ecto.Query
  alias Kukariri.User

  def login?(email, password) do 
    query = from user in Users,
      where user.email == ^email,
      where user.password == ^password,
      select: user
    Repo.all(query) |> List.first
  end
end
