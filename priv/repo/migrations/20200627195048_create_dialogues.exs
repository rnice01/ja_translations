defmodule JaTranslations.Repo.Migrations.CreateDialogues do
  use Ecto.Migration

  def change do
    create table(:dialogues) do
      add :context, :string
      add :japanese, :string, null: false
      add :english, :string
      add :grammar_notes, {:array, :string}, default: [""]
      add :number, :integer, null: false, default: 0
      add :character_id, references(:game_characters, on_delete: :nothing), null: true
      add :scene_id, references(:scenes, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:dialogues, [:character_id])
    create index(:dialogues, [:scene_id])
  end
end
