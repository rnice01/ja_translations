defmodule JaTranslations.Transcripts.Dialogue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dialogues" do
    field :context, :string
    field :character, :string
    field :english, :string
    field :grammar_notes, :string
    field :japanese, :string
    field :number, :integer
    belongs_to :scene, JaTranslations.Transcripts.Scene

    timestamps()
  end

  @doc false
  def changeset(dialogue, attrs) do
    dialogue
    |> cast(attrs, [:context, :japanese, :english, :grammar_notes, :number, :scene_id, :character])
    |> validate_required([:japanese, :number, :scene_id])
  end
end
