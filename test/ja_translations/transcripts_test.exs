defmodule JaTranslations.TranscriptsTest do
  use JaTranslations.DataCase

  alias JaTranslations.Transcripts

  describe "game_transcripts" do
    alias JaTranslations.Transcripts.GameTranscript

    @valid_attrs %{image: "some image", title: "some title"}
    @update_attrs %{image: "some updated image", title: "some updated title"}
    @invalid_attrs %{image: nil, title: nil}

    def game_transcript_fixture(attrs \\ %{}) do
      {:ok, game_transcript} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transcripts.create_game_transcript()

      game_transcript
    end

    test "list_game_transcripts/0 returns all game_transcripts" do
      game_transcript = game_transcript_fixture()
      assert Transcripts.list_game_transcripts() == [game_transcript]
    end

    test "get_game_transcript!/1 returns the game_transcript with given id" do
      game_transcript = game_transcript_fixture()
      assert Transcripts.get_game_transcript!(game_transcript.id) == game_transcript
    end

    test "create_game_transcript/1 with valid data creates a game_transcript" do
      assert {:ok, %GameTranscript{} = game_transcript} = Transcripts.create_game_transcript(@valid_attrs)
      assert game_transcript.image == "some image"
      assert game_transcript.title == "some title"
    end

    test "create_game_transcript/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transcripts.create_game_transcript(@invalid_attrs)
    end

    test "update_game_transcript/2 with valid data updates the game_transcript" do
      game_transcript = game_transcript_fixture()
      assert {:ok, %GameTranscript{} = game_transcript} = Transcripts.update_game_transcript(game_transcript, @update_attrs)
      assert game_transcript.image == "some updated image"
      assert game_transcript.title == "some updated title"
    end

    test "update_game_transcript/2 with invalid data returns error changeset" do
      game_transcript = game_transcript_fixture()
      assert {:error, %Ecto.Changeset{}} = Transcripts.update_game_transcript(game_transcript, @invalid_attrs)
      assert game_transcript == Transcripts.get_game_transcript!(game_transcript.id)
    end

    test "delete_game_transcript/1 deletes the game_transcript" do
      game_transcript = game_transcript_fixture()
      assert {:ok, %GameTranscript{}} = Transcripts.delete_game_transcript(game_transcript)
      assert_raise Ecto.NoResultsError, fn -> Transcripts.get_game_transcript!(game_transcript.id) end
    end

    test "change_game_transcript/1 returns a game_transcript changeset" do
      game_transcript = game_transcript_fixture()
      assert %Ecto.Changeset{} = Transcripts.change_game_transcript(game_transcript)
    end
  end

  describe "chapters" do
    alias JaTranslations.Transcripts.Chapter

    @valid_attrs %{name: "some name", number: 42}
    @update_attrs %{name: "some updated name", number: 43}
    @invalid_attrs %{name: nil, number: nil}

    def chapter_fixture(attrs \\ %{}) do
      {:ok, chapter} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transcripts.create_chapter()

      chapter
    end

    test "list_chapters/0 returns all chapters" do
      chapter = chapter_fixture()
      assert Transcripts.list_chapters() == [chapter]
    end

    test "get_chapter!/1 returns the chapter with given id" do
      chapter = chapter_fixture()
      assert Transcripts.get_chapter!(chapter.id) == chapter
    end

    test "create_chapter/1 with valid data creates a chapter" do
      assert {:ok, %Chapter{} = chapter} = Transcripts.create_chapter(@valid_attrs)
      assert chapter.name == "some name"
      assert chapter.number == 42
    end

    test "create_chapter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transcripts.create_chapter(@invalid_attrs)
    end

    test "update_chapter/2 with valid data updates the chapter" do
      chapter = chapter_fixture()
      assert {:ok, %Chapter{} = chapter} = Transcripts.update_chapter(chapter, @update_attrs)
      assert chapter.name == "some updated name"
      assert chapter.number == 43
    end

    test "update_chapter/2 with invalid data returns error changeset" do
      chapter = chapter_fixture()
      assert {:error, %Ecto.Changeset{}} = Transcripts.update_chapter(chapter, @invalid_attrs)
      assert chapter == Transcripts.get_chapter!(chapter.id)
    end

    test "delete_chapter/1 deletes the chapter" do
      chapter = chapter_fixture()
      assert {:ok, %Chapter{}} = Transcripts.delete_chapter(chapter)
      assert_raise Ecto.NoResultsError, fn -> Transcripts.get_chapter!(chapter.id) end
    end

    test "change_chapter/1 returns a chapter changeset" do
      chapter = chapter_fixture()
      assert %Ecto.Changeset{} = Transcripts.change_chapter(chapter)
    end
  end

  describe "scenes" do
    alias JaTranslations.Transcripts.Scene

    @valid_attrs %{description: "some description", image: "some image", number: 42, title: "some title"}
    @update_attrs %{description: "some updated description", image: "some updated image", number: 43, title: "some updated title"}
    @invalid_attrs %{description: nil, image: nil, number: nil, title: nil}

    def scene_fixture(attrs \\ %{}) do
      {:ok, scene} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transcripts.create_scene()

      scene
    end

    test "list_scenes/0 returns all scenes" do
      scene = scene_fixture()
      assert Transcripts.list_scenes() == [scene]
    end

    test "get_scene!/1 returns the scene with given id" do
      scene = scene_fixture()
      assert Transcripts.get_scene!(scene.id) == scene
    end

    test "create_scene/1 with valid data creates a scene" do
      assert {:ok, %Scene{} = scene} = Transcripts.create_scene(@valid_attrs)
      assert scene.description == "some description"
      assert scene.image == "some image"
      assert scene.number == 42
      assert scene.title == "some title"
    end

    test "create_scene/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transcripts.create_scene(@invalid_attrs)
    end

    test "update_scene/2 with valid data updates the scene" do
      scene = scene_fixture()
      assert {:ok, %Scene{} = scene} = Transcripts.update_scene(scene, @update_attrs)
      assert scene.description == "some updated description"
      assert scene.image == "some updated image"
      assert scene.number == 43
      assert scene.title == "some updated title"
    end

    test "update_scene/2 with invalid data returns error changeset" do
      scene = scene_fixture()
      assert {:error, %Ecto.Changeset{}} = Transcripts.update_scene(scene, @invalid_attrs)
      assert scene == Transcripts.get_scene!(scene.id)
    end

    test "delete_scene/1 deletes the scene" do
      scene = scene_fixture()
      assert {:ok, %Scene{}} = Transcripts.delete_scene(scene)
      assert_raise Ecto.NoResultsError, fn -> Transcripts.get_scene!(scene.id) end
    end

    test "change_scene/1 returns a scene changeset" do
      scene = scene_fixture()
      assert %Ecto.Changeset{} = Transcripts.change_scene(scene)
    end
  end

  describe "game_characters" do
    alias JaTranslations.Transcripts.GameCharacter

    @valid_attrs %{image: "some image", name: "some name"}
    @update_attrs %{image: "some updated image", name: "some updated name"}
    @invalid_attrs %{image: nil, name: nil}

    def game_character_fixture(attrs \\ %{}) do
      {:ok, game_character} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transcripts.create_game_character()

      game_character
    end

    test "list_game_characters/0 returns all game_characters" do
      game_character = game_character_fixture()
      assert Transcripts.list_game_characters() == [game_character]
    end

    test "get_game_character!/1 returns the game_character with given id" do
      game_character = game_character_fixture()
      assert Transcripts.get_game_character!(game_character.id) == game_character
    end

    test "create_game_character/1 with valid data creates a game_character" do
      assert {:ok, %GameCharacter{} = game_character} = Transcripts.create_game_character(@valid_attrs)
      assert game_character.image == "some image"
      assert game_character.name == "some name"
    end

    test "create_game_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transcripts.create_game_character(@invalid_attrs)
    end

    test "update_game_character/2 with valid data updates the game_character" do
      game_character = game_character_fixture()
      assert {:ok, %GameCharacter{} = game_character} = Transcripts.update_game_character(game_character, @update_attrs)
      assert game_character.image == "some updated image"
      assert game_character.name == "some updated name"
    end

    test "update_game_character/2 with invalid data returns error changeset" do
      game_character = game_character_fixture()
      assert {:error, %Ecto.Changeset{}} = Transcripts.update_game_character(game_character, @invalid_attrs)
      assert game_character == Transcripts.get_game_character!(game_character.id)
    end

    test "delete_game_character/1 deletes the game_character" do
      game_character = game_character_fixture()
      assert {:ok, %GameCharacter{}} = Transcripts.delete_game_character(game_character)
      assert_raise Ecto.NoResultsError, fn -> Transcripts.get_game_character!(game_character.id) end
    end

    test "change_game_character/1 returns a game_character changeset" do
      game_character = game_character_fixture()
      assert %Ecto.Changeset{} = Transcripts.change_game_character(game_character)
    end
  end

  describe "dialogues" do
    alias JaTranslations.Transcripts.Dialogue

    @valid_attrs %{context: "some context", english: "some english", grammar_notes: [], japanese: "some japanese", number: 42}
    @update_attrs %{context: "some updated context", english: "some updated english", grammar_notes: [], japanese: "some updated japanese", number: 43}
    @invalid_attrs %{context: nil, english: nil, grammar_notes: nil, japanese: nil, number: nil}

    def dialogue_fixture(attrs \\ %{}) do
      {:ok, dialogue} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transcripts.create_dialogue()

      dialogue
    end

    test "list_dialogues/0 returns all dialogues" do
      dialogue = dialogue_fixture()
      assert Transcripts.list_dialogues() == [dialogue]
    end

    test "get_dialogue!/1 returns the dialogue with given id" do
      dialogue = dialogue_fixture()
      assert Transcripts.get_dialogue!(dialogue.id) == dialogue
    end

    test "create_dialogue/1 with valid data creates a dialogue" do
      assert {:ok, %Dialogue{} = dialogue} = Transcripts.create_dialogue(@valid_attrs)
      assert dialogue.context == "some context"
      assert dialogue.english == "some english"
      assert dialogue.grammar_notes == []
      assert dialogue.japanese == "some japanese"
      assert dialogue.number == 42
    end

    test "create_dialogue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transcripts.create_dialogue(@invalid_attrs)
    end

    test "update_dialogue/2 with valid data updates the dialogue" do
      dialogue = dialogue_fixture()
      assert {:ok, %Dialogue{} = dialogue} = Transcripts.update_dialogue(dialogue, @update_attrs)
      assert dialogue.context == "some updated context"
      assert dialogue.english == "some updated english"
      assert dialogue.grammar_notes == []
      assert dialogue.japanese == "some updated japanese"
      assert dialogue.number == 43
    end

    test "update_dialogue/2 with invalid data returns error changeset" do
      dialogue = dialogue_fixture()
      assert {:error, %Ecto.Changeset{}} = Transcripts.update_dialogue(dialogue, @invalid_attrs)
      assert dialogue == Transcripts.get_dialogue!(dialogue.id)
    end

    test "delete_dialogue/1 deletes the dialogue" do
      dialogue = dialogue_fixture()
      assert {:ok, %Dialogue{}} = Transcripts.delete_dialogue(dialogue)
      assert_raise Ecto.NoResultsError, fn -> Transcripts.get_dialogue!(dialogue.id) end
    end

    test "change_dialogue/1 returns a dialogue changeset" do
      dialogue = dialogue_fixture()
      assert %Ecto.Changeset{} = Transcripts.change_dialogue(dialogue)
    end
  end
end
