defmodule JaTranslations.Repo.Migrations.CreateChapters do
  use Ecto.Migration

  def change do
    create table(:chapters) do
      add :name, :string, null: false
      add :number, :integer, default: 0
      add :game_transcript_id, references(:game_transcripts, on_delete: :nothing)

      timestamps()
    end

    create index(:chapters, [:game_transcript_id])
  end
end
