defmodule JaTranslations.Repo.Migrations.CreateDialogues do
  use Ecto.Migration

  def change do
    create table(:dialogues) do
      add :character, :string, null: true
      add :context, :string, null: true
      add :japanese, :string, null: false
      add :english, :string, null: true
      add :grammar_notes, :string, null: true
      add :number, :integer, null: false, default: 0
      add :scene_id, references(:scenes, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:dialogues, [:scene_id])
  end
end
