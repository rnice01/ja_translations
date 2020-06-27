defmodule JaTranslations.Repo.Migrations.CreateGameCharacters do
  use Ecto.Migration

  def change do
    create table(:game_characters) do
      add :name, :string, null: false
      add :image, :string
      add :game_transcript_id, references(:game_transcripts, on_delete: :nothing)

      timestamps()
    end

    create index(:game_characters, [:game_transcript_id])
  end
end
