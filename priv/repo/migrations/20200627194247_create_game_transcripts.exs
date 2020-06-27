defmodule JaTranslations.Repo.Migrations.CreateGameTranscripts do
  use Ecto.Migration

  def change do
    create table(:game_transcripts) do
      add :title, :string, null: false
      add :image, :string

      timestamps()
    end

    create index(:game_transcripts, [:title])
  end
end
