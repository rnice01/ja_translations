defmodule JaTranslations.Transcripts.GameTranscript do
  use Ecto.Schema
  import Ecto.Changeset

  schema "game_transcripts" do
    field :image, :string
    field :title, :string
    has_many :chapters, JaTranslations.Transcripts.Chapter

    timestamps()
  end

  @doc false
  def changeset(game_transcript, attrs) do
    game_transcript
    |> cast(attrs, [:title, :image])
    |> validate_required([:title, :image])
  end
end
