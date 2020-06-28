defmodule JaTranslations.Transcripts.GameCharacter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "game_characters" do
    field :image, :string
    field :name, :string
    field :game_transcript_id, :id
    has_many :dialogues, JaTranslations.Transcripts.Dialogue

    timestamps()
  end

  @doc false
  def changeset(game_character, attrs) do
    game_character
    |> cast(attrs, [:name, :image])
    |> validate_required([:name, :image])
  end
end
