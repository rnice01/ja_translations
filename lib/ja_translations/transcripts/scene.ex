defmodule JaTranslations.Transcripts.Scene do
  use Ecto.Schema
  import Ecto.Changeset

  schema "scenes" do
    field :description, :string
    field :image, :string
    field :number, :integer
    field :title, :string
    belongs_to :chapter, JaTranslations.Transcripts.Chapter
    has_many :dialogues, JaTranslations.Transcripts.Dialogue

    timestamps()
  end

  @doc false
  def changeset(scene, attrs) do
    scene
    |> cast(attrs, [:image, :description, :number, :title])
    |> validate_required([:image, :description, :number, :title])
  end
end
