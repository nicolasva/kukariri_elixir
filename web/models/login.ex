defmodule Kukariri.Login do
  import Ecto.Query
  alias Kukariri.User

  def login?(email, password) do 
    query = from user in User,
      where: user.email == ^email,
      where: user.encrypted_password == ^password,
      select: user
    Kukariri.Repo.all(query) |> List.first
  end

end
