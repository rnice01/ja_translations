defmodule JaTranslations.Transcripts.Dialogue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dialogues" do
    field :context, :string
    field :english, :string
    field :grammar_notes, {:array, :string}
    field :japanese, :string
    field :number, :integer
    field :character_id, :id
    belongs_to :scene, JaTranslations.Transcripts.Scene

    timestamps()
  end

  @doc false
  def changeset(dialogue, attrs) do
    dialogue
    |> cast(attrs, [:context, :japanese, :english, :grammar_notes, :number])
    |> validate_required([:context, :japanese, :english, :grammar_notes, :number])
  end
end
