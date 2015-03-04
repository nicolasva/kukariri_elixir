defmodule Kukariri.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres
 
  def conf do
    parse_url "ecto://localhost/kukariri"
  end

  def priv do
    app_dir(:kukariri, "priv/repo")
  end 
end
