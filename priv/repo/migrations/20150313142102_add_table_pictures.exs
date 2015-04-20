defmodule Kukariri.Repo.Migrations.AddTablePictures do
  use Ecto.Migration

  def change do
    create table(:pictures) do
      add :picture_file_name, :string, null: false
      add :picture_content_type, :string
      add :picture_file_size, :integer
      add :picture_updated_at, :datetime
      add :position, :integer, null: false, default: 0
      add :item_id, references(:items)
      add :type_id, references(:types)
    end
  end
end
