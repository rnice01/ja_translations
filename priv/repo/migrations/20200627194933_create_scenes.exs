defmodule JaTranslations.Repo.Migrations.CreateScenes do
  use Ecto.Migration

  def change do
    create table(:scenes) do
      add :image, :string
      add :description, :string
      add :number, :integer, null: false, default: 0
      add :title, :string, null: false
      add :chapter_id, references(:chapters, on_delete: :nothing)

      timestamps()
    end

    create index(:scenes, [:chapter_id])
  end
end
