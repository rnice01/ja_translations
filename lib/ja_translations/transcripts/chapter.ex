defmodule JaTranslations.Transcripts.Chapter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chapters" do
    field :name, :string
    field :number, :integer
    belongs_to :game_transcript, JaTranslations.Transcripts.GameTranscript
    has_many :scenes, JaTranslations.Transcripts.Scene

    timestamps()
  end

  @doc false
  def changeset(chapter, attrs) do
    chapter
    |> cast(attrs, [:name, :number])
    |> validate_required([:name, :number])
  end
end
