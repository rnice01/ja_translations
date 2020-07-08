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
  def get_game_transcript!(id) do
    scenes_order = from(s in JaTranslations.Transcripts.Scene, order_by: s.number)
    chapters_order = from(c in JaTranslations.Transcripts.Chapter, order_by: c.number, preload: [scenes: ^scenes_order])

    transcript = JaTranslations.Transcripts.GameTranscript
    |> where([t], t.id == ^id)
    |> preload([chapters: ^chapters_order])
    |> Repo.one

    transcript
  end

  @doc """
  Gets the GameTranscript by title
  and preloads the chapters and scenes.
  """
  def get_game_transcript_by_title(title) do
    scenes_order = from(s in JaTranslations.Transcripts.Scene, order_by: s.number)
    chapters_order = from(c in JaTranslations.Transcripts.Chapter, order_by: c.number, preload: [scenes: ^scenes_order])

    transcript = JaTranslations.Transcripts.GameTranscript
    |> where([t], ilike(t.title, ^title))
    |> preload([chapters: ^chapters_order])
    |> Repo.one
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


  alias JaTranslations.Transcripts.GameTranscript

  @doc """
  Returns the list of game_transcripts.

  ## Examples

      iex> list_game_transcripts()
      [%GameTranscript{}, ...]

  """
  def list_game_transcripts do
    raise "TODO"
  end

  @doc """
  Gets a single game_transcript.

  Raises if the Game transcript does not exist.

  ## Examples

      iex> get_game_transcript!(123)
      %GameTranscript{}

  """
  def get_game_transcript!(id), do: raise "TODO"

  @doc """
  Creates a game_transcript.

  ## Examples

      iex> create_game_transcript(%{field: value})
      {:ok, %GameTranscript{}}

      iex> create_game_transcript(%{field: bad_value})
      {:error, ...}

  """
  def create_game_transcript(_attrs) do
    raise "TODO"
  end

  @doc """
  Updates a game_transcript.

  ## Examples

      iex> update_game_transcript(game_transcript, %{field: new_value})
      {:ok, %GameTranscript{}}

      iex> update_game_transcript(game_transcript, %{field: bad_value})
      {:error, ...}

  """
  def update_game_transcript(%GameTranscript{} = game_transcript, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a GameTranscript.

  ## Examples

      iex> delete_game_transcript(game_transcript)
      {:ok, %GameTranscript{}}

      iex> delete_game_transcript(game_transcript)
      {:error, ...}

  """
  def delete_game_transcript(%GameTranscript{} = game_transcript) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking game_transcript changes.

  ## Examples

      iex> change_game_transcript(game_transcript)
      %Todo{...}

  """
  def change_game_transcript(%GameTranscript{} = game_transcript, _attrs) do
    raise "TODO"
  end

  alias JaTranslations.Transcripts.Chapter

  @doc """
  Returns the list of chapters.

  ## Examples

      iex> list_chapters()
      [%Chapter{}, ...]

  """
  def list_game_transcript_chapters(game_transcript_id) do
    Chapter
    |> where([c], c.game_transcript_id == ^game_transcript_id)
    |> order_by([c], c.number)
    |> Repo.all
  end

  @doc """
  Gets a single chapter.

  Raises if the Chapter does not exist.

  ## Examples

      iex> get_chapter!(123)
      %Chapter{}

  """
  def get_chapter!(id), do: raise "TODO"

  @doc """
  Creates a chapter.

  ## Examples

      iex> create_chapter(%{field: value})
      {:ok, %Chapter{}}

      iex> create_chapter(%{field: bad_value})
      {:error, ...}

  """
  def create_chapter(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a chapter.

  ## Examples

      iex> update_chapter(chapter, %{field: new_value})
      {:ok, %Chapter{}}

      iex> update_chapter(chapter, %{field: bad_value})
      {:error, ...}

  """
  def update_chapter(%Chapter{} = chapter, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Chapter.

  ## Examples

      iex> delete_chapter(chapter)
      {:ok, %Chapter{}}

      iex> delete_chapter(chapter)
      {:error, ...}

  """
  def delete_chapter(%Chapter{} = chapter) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking chapter changes.

  ## Examples

      iex> change_chapter(chapter)
      %Todo{...}

  """
  def change_chapter(%Chapter{} = chapter, _attrs \\ %{}) do
    raise "TODO"
  end

  alias JaTranslations.Transcripts.Scene

  @doc """
  Returns the list of scenes.

  ## Examples

      iex> list_scenes()
      [%Scene{}, ...]

  """
  def chapter_scenes(chapter_id) do
    Scene
    |> where([s], s.chapter_id == ^chapter_id)
    |> order_by([s], s.number)
    |> Repo.all
  end

  @doc """
  Gets a single scene.

  Raises if the Scene does not exist.

  ## Examples

      iex> get_scene!(123)
      %Scene{}

  """
  def get_scene!(id) do
    dialogue_order = from(d in JaTranslations.Transcripts.Dialogue, order_by: d.number)

    scene = JaTranslations.Transcripts.Scene
    |> where([s], s.id == ^id)
    |> preload([dialogues: ^dialogue_order])
    |> Repo.one

    scene
  end
  @doc """
  Creates a scene.

  ## Examples

      iex> create_scene(%{field: value})
      {:ok, %Scene{}}

      iex> create_scene(%{field: bad_value})
      {:error, ...}

  """
  def create_scene(attrs \\ %{}) do
    %Scene{}
    |> Scene.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a scene.
  """
  def update_scene(%Scene{} = scene, attrs) do
    scene
    |> Scene.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Scene.

  ## Examples

      iex> delete_scene(scene)
      {:ok, %Scene{}}

      iex> delete_scene(scene)
      {:error, ...}

  """
  def delete_scene(%Scene{} = scene) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking scene changes.

  ## Examples

      iex> change_scene(scene)
      %Todo{...}

  """
  def change_scene(%Scene{} = scene, attrs \\ %{}) do
    Scene.changeset(scene, attrs)
  end

  alias JaTranslations.Transcripts.Dialogue

  @doc """
  Returns the list of dialogues for a scene.
  """
  def scene_dialogues(scene_id) do
    Dialogue
    |> where([d], d.scene_id == ^scene_id)
    |> order_by([d], d.number)
    |> Repo.all
  end

  @doc """
  Gets a single dialogue.

  Raises if the Dialogue does not exist.

  ## Examples

      iex> get_dialogue!(123)
      %Dialogue{}

  """
  def get_dialogue!(id), do: Repo.get!(Dialogue, id)

  @doc """
  Creates a dialogue.

  ## Examples

      iex> create_dialogue(%{field: value})
      {:ok, %Dialogue{}}

      iex> create_dialogue(%{field: bad_value})
      {:error, ...}

  """
  def create_dialogue(attrs \\ %{}) do
    %Dialogue{}
    |> Dialogue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dialogue.

  ## Examples

      iex> update_dialogue(dialogue, %{field: new_value})
      {:ok, %Dialogue{}}

      iex> update_dialogue(dialogue, %{field: bad_value})
      {:error, ...}

  """
  def update_dialogue(%Dialogue{} = dialogue, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Dialogue.

  ## Examples

      iex> delete_dialogue(dialogue)
      {:ok, %Dialogue{}}

      iex> delete_dialogue(dialogue)
      {:error, ...}

  """
  def delete_dialogue(%Dialogue{} = dialogue) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking dialogue changes.

  ## Examples

      iex> change_dialogue(dialogue)
      %Todo{...}

  """
  def change_dialogue(%Dialogue{} = dialogue, attrs \\ %{}) do
    Dialogue.changeset(dialogue, attrs)
  end
end
