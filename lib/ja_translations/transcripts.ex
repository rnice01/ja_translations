defmodule JaTranslations.Transcripts do
  @moduledoc """
  The Transcripts context.
  """

  import Ecto.Query, warn: false
  alias JaTranslations.Repo

  alias JaTranslations.Transcripts.GameTranscript

  @doc """
  Returns the list of game_transcripts.

  ## Examples

      iex> list_game_transcripts()
      [%GameTranscript{}, ...]

  """
  def list_game_transcripts do
    Repo.all(GameTranscript)
  end

  @doc """
  Gets a single game_transcript.

  Raises `Ecto.NoResultsError` if the Game transcript does not exist.

  ## Examples

      iex> get_game_transcript!(123)
      %GameTranscript{}

      iex> get_game_transcript!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game_transcript!(id), do: Repo.get!(GameTranscript, id)

  @doc """
  Gets the GameTranscript by title
  and preloads the chapters and scenes.
  """
  def get_game_transcript_by_title(title) do
    transcript = JaTranslations.Transcripts.GameTranscript
    |> where([t], ilike(t.title, ^title))
    |> join(:left, [t], chapters in assoc(t, :chapters))
    |> join(:left, [t, c], scenes in assoc(c, :scenes))
    |> preload([transcript, chapters, scenes], [chapters: {chapters, scenes: scenes}])
    |> Repo.one

    transcript
  end

  @doc """
  Creates a game_transcript.

  ## Examples

      iex> create_game_transcript(%{field: value})
      {:ok, %GameTranscript{}}

      iex> create_game_transcript(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game_transcript(attrs \\ %{}) do
    %GameTranscript{}
    |> GameTranscript.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game_transcript.

  ## Examples

      iex> update_game_transcript(game_transcript, %{field: new_value})
      {:ok, %GameTranscript{}}

      iex> update_game_transcript(game_transcript, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game_transcript(%GameTranscript{} = game_transcript, attrs) do
    game_transcript
    |> GameTranscript.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a game_transcript.

  ## Examples

      iex> delete_game_transcript(game_transcript)
      {:ok, %GameTranscript{}}

      iex> delete_game_transcript(game_transcript)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game_transcript(%GameTranscript{} = game_transcript) do
    Repo.delete(game_transcript)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game_transcript changes.

  ## Examples

      iex> change_game_transcript(game_transcript)
      %Ecto.Changeset{data: %GameTranscript{}}

  """
  def change_game_transcript(%GameTranscript{} = game_transcript, attrs \\ %{}) do
    GameTranscript.changeset(game_transcript, attrs)
  end
end
